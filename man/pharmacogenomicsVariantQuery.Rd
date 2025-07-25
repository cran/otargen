% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pharmacogenomicsVariantQuery.R
\name{pharmacogenomicsVariantQuery}
\alias{pharmacogenomicsVariantQuery}
\title{Retrieve Pharmacogenomics data for a specified variant.}
\usage{
pharmacogenomicsVariantQuery(variantId)
}
\arguments{
\item{variantId}{Character: ID of the target variant (e.g., "12_111446804_T_C").}
}
\value{
Returns a tibble containing pharmacogenomics data for the specified variant.
}
\description{
This function queries the Open Targets GraphQL API to retrieve pharmacogenomics data
for a specified variant.
}
\examples{
\dontrun{
result <- pharmacogenomicsVariantQuery(variantId = "12_111446804_T_C")
}
}
