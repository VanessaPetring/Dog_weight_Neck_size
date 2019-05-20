library(shiny)
dogs <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-16/dogs.csv")


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Dogs average bodyweight and neck size"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "y",
                        "Y-axis:",
                        choices = c("Bodyweight" = "avg_weight",
                                    "Neck size" = "avg_neck"),
                        selected = "avg_weight"),
            
            selectInput(inputId = "x",
                        "X-axis:",
                        choices = c("Year" = "year", 
                                    "Neck size" = "avg_neck"),
                        selected = "year")
        
        
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput(outputId = "scatterplott")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
  
    
    output$scatterplott <- renderPlot({
        ggplot(data = dogs, 
               aes_string(x = input$x , y = input$y)) +
            geom_point()
    })    
 

}

# Run the application 
shinyApp(ui = ui, server = server)
