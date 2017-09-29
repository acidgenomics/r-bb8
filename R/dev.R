#' Load up developer environment
#' @export
dev <- function() {
    # Order is important here
    packages <-
        c("magrittr",
          "Matrix",
          "pbapply",
          "viridis",
          # Package development ====
          "devtools",
          "covr",
          "lintr",
          "testthat",
          # RStudio core ====
          "googlesheets",
          "knitr",
          "pkgdown",
          "readxl",
          "rmarkdown",
          "stringr",
          # Final NAMESPACE bootup ====
          "Biobase",
          "BiocInstaller",
          "S4Vectors",
          "basejump",
          "tidyverse",
          "rlang")

    # Stop on missing packages
    notInstalled = setdiff(packages, rownames(installed.packages()))
    if (length(notInstalled) > 0) {
        stop(paste(
            "The libraries",
            notInstalled,
            "are not installed"
        ))
    }

    # Attach unloaded packages
    lapply(seq_along(packages), function(a) {
        if (!packages[[a]] %in% (.packages())) {
            attachNamespace(packages[[a]])
        }
    })
    invisible()
}