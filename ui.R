library(shiny)
shinyUI(
       
       navlistPanel(
              tabPanel("Home",
                       
                       pageWithSidebar(
                              headerPanel("Data science FTW!"),
                              sidebarPanel(
                                     h3('Your Information'),
                                     textInput('txtFName','Name'),
                                     # textInput('txtLName','Last Name'),
                                     radioButtons('radioGender','Gender', c('M','F'), inline = T),
                                     dateInput("date", "Date of Birth"),
                                     numericInput('KN', 'Nearest Value', 1, min = 1, max = 5,
                                                  step = 2),
                                     actionButton('Submitbtn', 'Submit')
                              ),
                              mainPanel(
                                     h3('Personality Trait'),
                                     
                                     # verbatimTextOutput("ofName"),
                                     textOutput("ofName"),
                                     p("Welcome to the App, the Personaltiy trait. In this App you 
                are compared with the some of the greatest Scientist of the 
                world. Whose Details are as below:"),
                                     p(strong("(please fill the form and press the submit button at
                       right panel)")),
                                     #verbatimTextOutput("olName"),
                                     h4("Scientist Name:"),
                                     verbatimTextOutput("scName"),
                                     h4("Scientist Date of Birth:"),
                                     verbatimTextOutput("scDOB"),
                                     h4("Scientist Date of Country:"),
                                     verbatimTextOutput("scCountry"),
                                     
                                     h4("Common Traits:"),
                                     tableOutput("Chr")
                                     
                              )
                       )
              ),
              tabPanel("Documentation",
                       
                       
                       
                       h2("Personality Trait"),
                       p("The history is full of the greatest scientist who invented the things
                          that are very useful for us. We are relating you with the world greatest
                         scientist and also matches your qualities with the scientists. So, you have 
                         to give information about you, so we can predict your persoality."),
                       p("You have to provide your Name, Gender, Date of Birth and the Number of possible
                         Scientest you want to campare with. In the Home Tab, please enter your Name in 
                         the box Labelled with Name. and Date of Birth in the available calender. You can 
                         choose the value 1, 3, 5 at a time, and then press submit button."),
                       p("The result of calculation will be shown at the right section. And you can see the
                         Name of Scientst, his year of birth the country where he born and at last you can
                         also see the some common traits matched with you.")
                       
              )
       )
)