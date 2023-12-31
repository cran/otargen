#' Retrieves all variants for a study.
#'
#' For an input study ID, this function returns information of all variants across associated loci. The output also includes
#'  information about the associated genes within the each loci.
#'
#' @param study_id Character: Study ID(s) generated by Open Targets Genetics (e.g GCST90002357).
#'
#' @return Returns a list of two data frames.
#'
#' the first data frame (tibble format) includes the loci data frame with following data structure:
#' \itemize{
#'   \item{\code{variant.id}:} \emph{Character}. Variant ID.
#'   \item{\code{pval}:} \emph{Numeric}. P-value.
#'   \item{\code{variant.nearestCodingGene.symbol}:} \emph{Character}. Symbol of the nearest coding gene to the variant.
#'   \item{\code{variant.rsId}:} \emph{Character}. Variant rsID.
#'   \item{\code{variant.chromosome}:} \emph{Character}. Chromosome of the variant.
#'   \item{\code{variant.position}:} \emph{Integer}. Position of the variant.
#'   \item{\code{variant.nearestCodingGeneDistance}:} \emph{Integer}. Distance to the nearest coding gene.
#'   \item{\code{credibleSetSize}:} \emph{Integer}. Size of the credible set.
#'   \item{\code{ldSetSize}:} \emph{Integer}. Size of the LD set.
#'   \item{\code{oddsRatio}:} \emph{Numeric}. Odds ratio.
#'   \item{\code{beta}:} \emph{Numeric}. Beta value.
#' }
#'
#' The second data frame includes gene information with following data structure:
#' \itemize{
#'   \item{\code{score}:} \emph{Numeric}. Gene score.
#'   \item{\code{gene.id}:} \emph{Character}. Gene ID.
#'   \item{\code{gene.symbol}:} \emph{Character}. Gene symbol.
#' }
#'
#' @examples
#' \dontrun{
#' result <- studyVariants(study_id = "GCST003155")
#'}
#' @importFrom magrittr %>%
#' @export
#'

studyVariants <- function(study_id) {

  # Check if the study ID argument is empty or null
  if (missing(study_id) || is.null(study_id) || study_id == "") {
    message("Please provide a value for the study ID argument.")
    return(NULL)
  }

  ## Set up to query Open Targets Genetics API
  variables <- list(studyId = study_id)
tryCatch({
  #variables <- list(studyId  = "GCST003155")
  cli::cli_progress_step("Connecting to the Open Targets Genetics GrpahQL API...", spinner = TRUE)
  otg_cli <- ghql::GraphqlClient$new(url = "https://api.genetics.opentargets.org/graphql")
  otg_qry <- ghql::Query$new()


  query <- "query StudyVariants($studyId: String!) {
  manhattan(studyId: $studyId) {
    associations {
      variant {
        id
        rsId
        chromosome
        position
        nearestCodingGene {
          id
          symbol
        }
        nearestCodingGeneDistance
      }
      pval
      credibleSetSize
      ldSetSize
      oddsRatio
      beta
    }
  }
}"


  ## Execute the query

  otg_qry$query(name = "StudyVariants", x = query)

  cli::cli_progress_step("Downloading data...", spinner = TRUE)
  result <- jsonlite::fromJSON(otg_cli$exec(otg_qry$queries$StudyVariants, variables), flatten = TRUE)$data
  loci_all <- as.data.frame(result$manhattan$associations) %>% dplyr::arrange(pval)


  final_output <-  loci_all





  if (nrow(final_output) == 0) {
    final_output <- data.frame()
  }
  return(final_output)

  }, error = function(e) {
  # Handling connection timeout
  if(grepl("Timeout was reached", e$message)) {
    stop("Connection timeout reached while connecting to the Open Targets Genetics GraphQL API.")
  } else {
    stop(e) # Handle other types of errors
  }
})
}
