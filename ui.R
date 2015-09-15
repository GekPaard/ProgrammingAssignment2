library(shiny)
shinyUI(pageWithSidebar
        (
headerPanel ("Predicting Height of Children from Parents' Heights"),
sidebarPanel(
             sliderInput("text1", "Father's Height (meter)", value =1.75, min = 1.40, max=2.20, step = 0.01),
             sliderInput("text2", "Mother's Height (meter)", value =1.65, min = 1.40, max=2.20, step = 0.01),
             submitButton('Submit')),

mainPanel   (
            h3('Predicted Heights'),
            textOutput("text3"),
            textOutput("text4"),
            h5("Explanation:"),
            h6("This app predicts the eventual height of a son and a daughter from the parents' height."),
            h6("Put the mouse on the grey balls and move it to the correct values and click then on the Submit button."),
            h6("In this app the International System of Units is used. To convert inches to meters this site is recommended:"), 
            a("inches to meters", href="http://www.metric-conversions.org/length/inches-to-meters.htm"), 
            h6("To convert meters to inches: "),
            a(href="http://www.metric-conversions.org/length/meters-to-inches.htm", "meters to inches"),
            h6(em("----------------------------------------------------------------------------------------------------------------------------------------")),
            h6(em("The data set GaltonFamilies from the package HistData is used to calculate the slope and intercept ")),
            h6(em("for heights sons and daughters from the same parents. The parents height is calculated according ")),
            h6(em("to Galton's idea ((father's height plus (mother's height * 1.08))/2)."))
            )
        )
       )