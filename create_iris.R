# File used to obtain the iris.dat dataset used in AMPL

write_dat <- function(X, k, file, standardise = TRUE) {
  X <- as.matrix(X)
  if (standardise) X <- scale(X)
  D <- as.matrix(dist(X))
  m <- nrow(D)
  
  Ds <- matrix(sprintf("%.6f", D), nrow = m)
  
  lines <- c(
    paste0("param m := ", m, ";"),
    paste0("param k := ", k, ";"),
    paste0("param d : ", paste(1:m, collapse = " "), " :="),
    paste(1:m, apply(Ds, 1, paste, collapse = " ")),
    ";"
  )
  writeLines(lines, file)
  invisible(D)
}

dir.create("data", showWarnings = FALSE)
write_dat(iris[, 1:4], k = 3, file = "data/iris.dat")
message("Written: data/iris.dat (m = 150, k = 3)")