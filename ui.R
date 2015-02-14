library(shiny)
shinyUI(fluidPage(
    tags$head(
        tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }

    "))
    ),
    headerPanel("BMI calculator"),
    sidebarPanel(
        h5('Please submit your height and weight:'),
        br(),
        sliderInput('height','Height (m)',1.45,min=1.10,max=2.20,step=0.01),
        submitButton('Submit'),
        br(),
        sliderInput('weight','Weight (kg)',50,min=35,max=160,step=1),
        submitButton('Submit')
    ),
    mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Results",h3('Your BMI index is:'),
                             verbatimTextOutput("bmiind"),
                             h3('Accoring to the World Health Organization (WHO), your category is:'),
                             verbatimTextOutput("bmicat"),
                             br(),
                             h4('Recommendation'),
                             verbatimTextOutput("msg")),        
                    tabPanel("Details",h4('Wikipedia',a("Reference Link", href="http://en.wikipedia.org/wiki/Body_mass_index")),
                             h5('The body mass index (BMI), or Quetelet index, is a measure of relative size based on the massand height of an individual.',
                                           h5('The modern term "body mass index" (BMI) for the ratio of weight to squared height owes its popularity to a paper published in the July 1972 edition of the Journal of Chronic Diseases by Ancel Keys. This found the BMI to be the best proxy for body fat percentage among ratios of weight and height.The interest in an index that measures body fat came with increasing obesity in prosperous Western societies. BMI was explicitly cited by Keys as appropriate for population studies and inappropriate for individual evaluation. Nevertheless, due to its simplicity, it has come to be widely used for preliminary diagnosis.Additional metrics, such as waist circumference, can be more useful.'),
                                           br(),
                                h4('Documentation:'),
                                h5('This website provides a BMI calculator. The same time, it helps the user to interpret its own index. Based on the category of the user a recommendation pops up.'))
) 
        )
    )
))

