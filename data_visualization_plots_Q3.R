setwd("C:/Users/sumar/OneDrive/Documents/data scientist")
"C:\\Users\\sumar\\OneDrive\\Documents\\data scientist\\kidney_disease_processed.csv"
kidney_disease_processed=read.csv("kidney_disease_processed.csv", stringsAsFactors = FALSE)
View(kidney_disease_processed)

#bar plot for counts
ggplot(kidney_disease_processed, aes(x=classification, fill ="red"))+
  labs(title= "count of chronic kidney disease patients")+geom_bar()

#bar plot with two categorical variables
ggplot(kidney_disease_processed,aes(x=su, fill=classification))+
  labs(title="Barplot with chronic kidney disease",
       subtitle= "sugar in ckd patients")+
  geom_bar(position=position_dodge())+facet_wrap(~classification)

#box plot
ggplot(kidney_disease_processed,aes(x=classification,y=age,color= classification))
+labs(title = "boxplot with age distribution for ckd")
+geom_boxplot(outlier.colour = "green",outlier.shape = 3)

#scatter plot for two continuous variables
ggplot(kidney_disease_processed,aes(x=wc,y=rc,color=classification))
+labs(title="scatterd plot for wc and rc with ckd", 
      subtitle= "relationship between white cells and red blodd cell count in ckd patient")
+geom_point()+geom_smooth(method=loess, formula ="y~x")

#scatter plot for one categorical and other continuous variable
ggplot(kidney_disease_processed,aes(x=ane,y=bp,color=classification))
+labs(title= "Relationship between Anemia and Bloodpressure", 
      subtitle = "Bp and Anemia in ckd patients") +
  geom_point()
