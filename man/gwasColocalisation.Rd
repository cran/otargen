% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gwasColocalisation.R
\name{gwasColocalisation}
\alias{gwasColocalisation}
\title{Retrieve calculated GWAS colocalisation data}
\usage{
gwasColocalisation(study_id, variant_id)
}
\arguments{
\item{study_id}{Character: Open Target Genetics generated ID for the GWAS study.}

\item{variant_id}{Character: Open Target Genetics generated ID for the variant (CHRPOSITION_REFALLELE_ALTALLELE or rsID).}
}
\value{
Returns a data frame of the studies that colocalise with the input variant and study. The table consists of the following data structure:
\itemize{
  \item{\code{study.studyId}:} \emph{Character vector}. Study identifier.
  \item{\code{study.traitReported}:} \emph{Character vector}. Reported trait associated with the colocalisation.
  \item{\code{study.traitCategory}:} \emph{Character vector}. Trait category.
  \item{\code{indexVariant.id}:} \emph{Character vector}. Index variant identifier.
  \item{\code{indexVariant.position}:} \emph{Integer vector}. Index variant position.
  \item{\code{indexVariant.chromosome}:} \emph{Character vector}. Index variant chromosome.
  \item{\code{indexVariant.rsId}:} \emph{Character vector}. Index variant rsID.
  \item{\code{beta}:} \emph{Numeric vector}. Beta value associated with the colocalisation.
  \item{\code{h3}:} \emph{Numeric vector}. H3 value associated with the colocalisation.
  \item{\code{h4}:} \emph{Numeric vector}. H4 value associated with the colocalisation.
  \item{\code{log2h4h3}:} \emph{Numeric vector}. Log2 ratio of H4 to H3 values.
}
}
\description{
This function retrieves colocalisation data for a specific variant from a study with other GWAS studies.
It returns a data frame of the studies that colocalise with the input variant and study,
including details on the study and reported trait, index variant, and calculated coloc method (see Ref. below) outputs.
}
\examples{
\dontrun{
colocalisation_data <- gwasColocalisation(study_id = "GCST90002357", variant_id = "1_154119580_C_A")
colocalisation_data <- gwasColocalisation(study_id = "GCST90002357", variant_id = "rs2494663")
}
}
\references{
Giambartolomei, Claudia et al. “Bayesian test for colocalisation between pairs of genetic association studies using summary statistics.” PLoS genetics vol. 10,5 e1004383. 15 May. 2014, doi:10.1371/journal.pgen.1004383
}
