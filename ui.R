
require(shiny)
require(shinythemes)
ui<-shinyUI(fluidPage(theme = shinytheme("Cosmo"),
        headerPanel("Titanic Survival Rate Calculator"),
        sidebarPanel(
        textInput("name","Enter your name"),
        selectInput("embarked","Where are you travelling to",c("Cherbourg"="C","Queenstown"="Q","Southampton"="S")),
        selectInput("pclass","Which class are you travelling with",c("Upper"="1","Middle"="2","Lower"="3")),
        selectInput("sex","What is your gender?",c("Male"="male","Female"="female")),
        sliderInput("age","How old are you?",min=0,max=80,value=25,step=1),
        sliderInput("sibsp","How many siblings are you travelling with?",0,min=0,max=5),
        sliderInput("parch","Are you travelling with parents or carrying a child? How many of them are travelling with you",0,min=0,max=6,step=1),
        sliderInput("fare","How much are you willing to pay for the trip (in USD Dollar)",0,min=0,max=512.3,step=0.5),
        submitButton("Submit")
        ),
        mainPanel(
        verbatimTextOutput(outputId="text1"),
        h3("According to your input, your calculated survival rate is"),
        verbatimTextOutput(outputId="survivalProb"),
        h3("Documentation for navigation"),
        h4("I believe everything here is very self-explanatory(hopefully you agree with me). Just imagine that you decided to get on the Titanic after hearing all the great things about it and before it crashes, Just imagine you would like to find out the probability you will survive by using all the information about you.")
        )
))
