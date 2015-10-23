library(shiny)
library(lubridate)
library(caret)

scientist <- read.csv("scientist.csv", stringsAsFactors = F)
scientist$class <- c(1 : nrow(scientist))

zodiac <- data.frame(
       Aries =c('Active', 'Demanding', 'Determined', 'Effective', 'Ambitious'),
       Taurus = c('Security', 'Subtle strength', 'Appreciation', 'Instruction', 'Patience'),
       Gemini = c('Communication', 'Indecision', 'Inquisitive', 'Intelligent', 'Changeable'),
       Cancer = c('Emotion', 'Diplomatic', 'Intensity', 'Impulsive', 'Selective'),
       Leo = c('Ruling', 'Warmth', 'Generosity', 'Faithful', 'Initiative'),
       Virgo = c('Analyzing', 'Practical', 'Reflective', 'Observation', 'Thoughtful'),
       Libra = c('Balance', 'Justice', 'Truth', 'Beauty', 'Perfection'),
       Scorpio = c('Transient', 'Self-Willed', 'Purposeful', 'Unyielding', 'Flirt'),
       Sagittarius =c('Philosophical', 'Motion', 'Experimentation', 'Optimism', 'Selective'),
       Capricorn = c('Determination', 'Dominance', 'Perservering', 'Practical', 'Willful'),
       Aquarius= c('Knowledge', 'Humanitarian', 'Serious', 'Insightful', 'Duplicitous'),
       Pisces = c('Fluctuation', 'Depth', 'Imagination', 'Reactive', 'Indecisive')
                     )

nearestScientist <- function(k, dayVal, monthVal){
       fit <- train(class ~ day + month, data = scientist, method= 'knn',
                    tuneLength =k, preProcess='range')
       
       classVal <- round(predict(fit,newdata = data.frame(day=dayVal,
                                                          month = monthVal)))
       classVal
}


shinyServer(
       function(input, output) {
              output$ofName <- renderPrint(
                     paste('Hi!',input$txtFName))
             # output$olName <- renderPrint(input$txtLName)
              
              k <- renderText(input$KN)
              dateVal <- renderText(ymd(input$date))
              #idx <- renderText(nearestScientist(k,day(dateVal), month(dateVal)))
              
              
              re <- eventReactive(
                     input$Submitbtn,{input$date})
              output$b <- renderText({ re()
              }) 
              
              
              reScName <- eventReactive(
                     input$Submitbtn,{
                            scientist$Name[nearestScientist(
                                   input$KN, day(ymd(input$date)),month(ymd(input$date)) )]
                            })
              output$scName <- renderText({ reScName()
              }) 
              
              
              reSCDOB <- eventReactive(
                     input$Submitbtn,{
                            scientist$year[nearestScientist(
                                   input$KN, day(ymd(input$date)),month(ymd(input$date)) )]
                            })
              output$scDOB <- renderText({ reSCDOB()
              }) 
              
              
              
              reScCountry <- eventReactive(
                     input$Submitbtn,{
                            scientist$country[nearestScientist(
                                   input$KN, day(ymd(input$date)),month(ymd(input$date)) )]
                            })
              output$scCountry <- renderText({ reScCountry()
              }) 
              
              rv <- reactiveValues()
              rv <- renderText(scientist$star[nearestScientist(
                     input$KN, day(ymd(input$date)),month(ymd(input$date)))])
              
              
              
              reChr <- eventReactive(
                     input$Submitbtn,{
                            zodiac[
                                   scientist$star[nearestScientist(
                                          input$KN, day(ymd(input$date)),month(ymd(input$date)))]
                                   ]
                            })
              output$Chr <- renderTable({ reChr()
              }) 
              
              
#               output$b <- renderTable(zodiac[
#                      scientist$star[nearestScientist(
#                             input$KN, day(ymd(input$date)),month(ymd(input$date)))]
#               ])
#               
              
       }
)