## @knitr loadfiles

library("tools")
filesPath <- file.path("./files")
files <- grep(list.files(filesPath, full.names = TRUE, recursive = FALSE), pattern = ("ini$"), invert = TRUE, value = TRUE)
files <- files[!file.info(files)$isdir]

if (length(files) > 0) {
  ext <- file_ext(files)
  size <- file.size(files)
  name <- sapply(strsplit(files, "[/.]"), "[", 4)
  
  info <- data.frame(name, ext, size)
  
  for (i in 1:nrow(info)) {
    if (size[i] < 1000000) {
      info[i, 3] <- round(info[i, 3]/1024, 1)
      output <- as.character(info[i,])
      cat(paste0("* ", "[", output[1], " (",output[2], ")", " (", output[3], " Kb)", "]", "(", files[i], ")", "\n"))
    }
    else {
      info[i, 3] <- round(info[i, 3]/1024/1024, 1)
      output <- as.character(info[i,])
      cat(paste0("* ", "[", output[1], " (",output[2], ")", " (", output[3], " MB)", "]", "(", files[i], ")", "\n"))
    }
  }
} else {
  cat("There are no files associated with this workshop.")
}





