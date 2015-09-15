library (shiny)
coefFunction <- function ()
{library(HistData)  
 data    (GaltonFamilies)
 ## prepare dataset with coefficients
 coefs <- vector(mode = "numeric", length = 6)
 ## inches to international standard (meter)
 GaltonFamilies$childHeight     <- round((GaltonFamilies$childHeight * 2.54)/100,3)
 GaltonFamilies$midparentHeight <- round((GaltonFamilies$midparentHeight * 2.54)/100,3)
 ## calculate linear model for sons
 GaltonSon      <- subset(GaltonFamilies, GaltonFamilies$gender == "male")
 fitSon         <- lm(childHeight ~ midparentHeight, data=GaltonSon)
 coefs[1]       <- round(summary(fitSon)$coef[2,1], 3)
 coefs[2]       <- round(summary(fitSon)$coef[1,1], 3)
 coefs[3]       <- round(summary(fitSon)$coef[2,2]*100, 0)
 ## calculate linear model for daughter
 GaltonDaughter <- subset(GaltonFamilies, GaltonFamilies$gender == "female")
 fitDaughter    <- lm(childHeight ~ midparentHeight, data=GaltonDaughter)
 coefs[4]       <- round(summary(fitDaughter)$coef[2,1], 3)
 coefs[5]       <- round(summary(fitDaughter)$coef[1,1], 3)
 coefs[6]       <- round(summary(fitDaughter)$coef[2,2]*100, 0)
 
 return(coefs)
 }
coef <- coefFunction()

shinyServer
(
function(input, output)
 {
  output$text3 <- 
        renderText((paste("Predicted son's height:      ", 
        {round((((coef[1]*(as.numeric(input$text1) + as.numeric(input$text2)*1.08)/2))+ coef[2]),2)},
        "meter plus/minus", coef[3], "cm", sep = " ")))
  output$text4 <- 
        renderText((paste("Predicted daugther's height: ", 
        {round((((coef[4]*(as.numeric(input$text1) + as.numeric(input$text2)*1.08)/2))+ coef[5]),2)},
        "meter plus/minus", coef[6], "cm", sep = " ")))
 }
)