days=30
city_name <- c("Stockholm", "Uppsala","Enköping","Malmö", "Luleå",
               "Lund","Jönköping", "Umeå","nyköping","örebro")


temperature_data <- c()

for (day in 1:days) {
  temperatures <- c()
  for (name in city_name) {
  prompt_text <- paste("Temperature for", name, "on day", day, ": ") 
  temp <- as.numeric(readline(prompt = prompt_text))
  temperatures <- append(temperatures, temp)
  }
  temperature_data <- rbind(temperature_data, temperatures)
}

#functions created to calculate min, average and max values
minFun <- function(vec) {
  min <- vec[1]
  for (i in vec) {
    if ( i < min) {
      min <- i
    } 
  }
  return (min)  
}

maxFun <- function(vec) {
  max <- vec[1]
  for (i in vec) {
    if ( i > max) {
      max <- i
    } 
  }
  return (max)  
}

averageFun <- function(vec) {
  sum <- 0
  for (i in vec) {
    sum <- sum + i
  }
  average <- sum / length(vec)
  return(average)
}


#manual calculation of min,average and max
for(i in 1:ncol(temperature_data)) {
  cat(city_name[i], "temperature of month:", "min", minFun(temperature_data[,i]), 
      "average", averageFun(temperature_data[,i]), "max", maxFun(temperature_data[,i]), "\n")}

#built in function for min, average and max calculation
for(i in 1:ncol(temperature_data)) {
  cat(city_name[i], "temperature of month:", "min", min(temperature_data[,i]), 
      "average", mean(temperature_data[,i]), "max", max(temperature_data[,i]), "\n")
}