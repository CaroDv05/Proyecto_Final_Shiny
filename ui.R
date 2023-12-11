ui <- dashboardPage( 
  
  
  skin = "purple",
  
  dashboardHeader(
    title =  "Datos Demográficos Mundiales - Gapminder",
    titleWidth = 430
  ),
  
  dashboardSidebar(disable = FALSE,
                   
                   width = 430,
                   
                   img(src = "world.jpg", height = 200, width = 200,
                       style="display: block; margin-left: auto; margin-right: auto"),
                   
                   sidebarMenu(
                     
                     menuItem("Tabla de datos", tabName = "datos", icon = icon("table")),
                     
                     menuItem("Gráficos", tabName = "gráficos", icon = icon("chart-simple"))
                     
                   )),
  
  dashboardBody(
    
    tabItems(
      
      tabItem(tabName = "datos",
              
              tabsetPanel(
                
                tabPanel("País", 
                         
                         h3("Elija el año y país que desea ver"),
                         
                         selectInput("pais", "País:", choices = NULL, selected = NULL),
                         
                         selectInput("anio", "Año:", choices = NULL, selected = NULL),
                         
                         actionButton("filtrar", "Filtrar Datos"),
                         
                         downloadButton("datos_gapminder", "Descargar Datos"),
                         
                         textOutput("opcion_elegida"),
                         
                         dataTableOutput("tabla_gapminder")),
                
                tabPanel("Países por Continente", 
                         
                         h3("Países según continente"),
                         
                         selectInput("continente", "Continente:", choices = NULL, selected = NULL),
                         
                         selectInput("paiis", "País:", choices = NULL, selected = NULL),
                         
                         selectInput("anios", "Año:", choices = NULL, selected = NULL),
                         
                         textOutput("texto"),
                         
                         actionButton("filtro", "Filtrar Datos"),
                         
                         downloadButton("datos_gapminder_continente", "Descargar Datos"),
                         
                         dataTableOutput("tabla_gap")),
                
                
                tabPanel("Continente", 
                         
                         h3("Todos los países según continente"),
                         
                         selectInput("continent", "Continente:", choices = NULL, selected = NULL),
                         
                         selectInput("year", "Año:", choices = NULL, selected = NULL),
                         
                         textOutput("texto_2"),
                         
                         actionButton("filtrador", "Filtrar Datos"),
                         
                         downloadButton("datos_gapminder_paises_continente", "Descargar Datos"),
                         
                         dataTableOutput("tabla_gapmind")),
                
                tabPanel("Variables",
                         
                         h3("Elija la variable que desea ver"),
                         
                         selectInput("variables", "Variables:",  choices = colnames(gapminder), 
                                      selected = NULL, multiple = TRUE),
                         
                         selectInput("country", "País:", choices = NULL, selected = NULL),
                         
                         textOutput("texto_3"),
                         
                         dataTableOutput("tabla_variable"),
                         
                         actionButton("filtre", "Filtrar Datos"),
                         
                         downloadButton("datos_gapminder_variables", "Descargar Datos")),
                
                