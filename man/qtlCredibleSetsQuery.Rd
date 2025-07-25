% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qtlCredibleSetsQuery.R
\name{qtlCredibleSetsQuery}
\alias{qtlCredibleSetsQuery}
\title{Retrieve QTL Credible Sets data for a specified variant.}
\usage{
qtlCredibleSetsQuery(variantId, size = 500, index = 0)
}
\arguments{
\item{variantId}{Character: ID of the target variant (e.g., "19_10352442_G_C").}

\item{size}{Integer: Number of records to retrieve (default: 500).}

\item{index}{Integer: Page index for pagination (default: 0).}
}
\value{
Returns a tibble containing QTL credible sets data for the specified variant.
}
\description{
This function queries the Open Targets GraphQL API to retrieve QTL credible sets data
for a specified variant.
}
\examples{
\dontrun{
result <- qtlCredibleSetsQuery(variantId = "19_10352442_G_C", size = 500, 
index = 0)
}
}
