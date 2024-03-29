% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_l2g.R
\name{plot_l2g}
\alias{plot_l2g}
\title{Radar plot for L2G partial scores from \code{studiesAndLeadVariantsForGeneByL2G()}}
\usage{
plot_l2g(data, disease_efo = NULL, l2g_cutoff = 0.5, top_n_disease = 1)
}
\arguments{
\item{data}{Data frame: result of \code{studiesAndLeadVariantsForGeneByL2G} function.}

\item{disease_efo}{Character: Input EFO id to filter the L2G data for a particular disease.}

\item{l2g_cutoff}{Numeric: Sets the minimum L2G score threshold for diseases to be considered in the plot.}

\item{top_n_disease}{Numeric: Determines the number of top diseases to plot for each gene, ranked by L2G score.}
}
\value{
A radar plot for the input disease and the genes associated with that disease.
The variables shown include L2G score, chromatin interaction, variant pathogenicity and distance.
}
\description{
This function returns a radar plot to compare the partial scores,
important for prioritising the causal genes that are obtained
from the \code{studiesAndLeadVariantsForGeneByL2G()} function. The user can
decide to plot only for a specific disease by specifying an \code{EFO} ID
for the \code{disease} argument, otherwise the returned plot will will facet
based on existing traits/diseases in the outputs from \code{studiesAndLeadVariantsForGeneByL2G()}.
}
\examples{
\dontrun{
p <- studiesAndLeadVariantsForGeneByL2G(list("ENSG00000167207","ENSG00000096968",
  "ENSG00000138821", "ENSG00000125255")) \%>\% plot_l2g(disease = "EFO_0003767")
p
}

}
