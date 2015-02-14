library(shiny)

bmi_index <- function(h,w) w/(h**2)
bmi_category <- function(num){
    msg='Be careful!'
    if (num<15){
        cat='Very severely underweight!'
    }else if (num<16){
        cat='Severely underweight!'
    }
    else if (num<18.5){
        cat='Underweight!'
    }
    else if (num<25){
        cat='Normal (healthy weight)!'
        msg='Good job! Keep it up :)'
    }
    else if (num<30){
        cat='Overweight!'
    }
    else if (num<35){
        cat='Obese Class I (Moderately obese)!'
    }
    else if (num<40){
        cat='Obese Class II (Severely obese)!'
    }
    else cat='Obese Class III (Very severely obese)'
    c(cat,msg)
}

shinyServer(
    function(input, output) {
        output$bmiind <- renderText({as.character(round(bmi_index(input$height,input$weight),2))})
        output$bmicat <- renderText({bmi_category(bmi_index(input$height,input$weight))[1]})
        output$msg <- renderText({bmi_category(bmi_index(input$height,input$weight))[2]})
    }
)