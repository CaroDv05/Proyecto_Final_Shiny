server <- function(input, output, session) {
  
  gapminder <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-24/gapminder_es.csv")
  
  observe({ 
    
    updateSelectInput(session, "anio", choices = unique(gapminder$anio)) 
    
    updateSelectInput(session, "pais", choices = unique(gapminder$pais)) 
    
    updateSelectInput(session, "paiis", choices = unique(gapminder$pais))
    
    updateSelectInput(session, "continente", choices = unique(gapminder$continente))
    
    updateSelectInput(session, "anios", choices = unique(gapminder$anio))
    
    updateSelectInput(session, "variables", choices = unique(gapminder$colnames))
    
    updateSelectInput(session, "year", choices = unique(gapminder$anio))
    
    updateSelectInput(session, "continent", choices = unique(gapminder$continente))
    
    updateSelectInput(session, "country", choices = unique(gapminder$pais))
  })
  
  #OBSERVE EVENTS
  
  observeEvent(input$filtrar, {
    
    output$tabla_gapminder <- renderDataTable({
      
      datos_filtrados <- gapminder[
        
        gapminder$anio == input$anio & gapminder$pais == input$pais, ]
      
    }, options = list(scrollX = TRUE))
    
  })
  
  output$opcion_elegida <- renderText((
    paste("El país y año que seleccionó:",input$pais, "-", input$anio)))
  
  
  #Opciones de paises según continente
  
  
  
  
  observeEvent(c(input$filtro, input$continente), {
    
    
    datos_filtrados <- gapminder |> 
      filter(continente == input$continente) |> 
      pull(pais) |> 
      unique()
    updateSelectInput(session, "paiis", choices = datos_filtrados)
    
    
    output$tabla_gap <- renderDataTable({
      datos_filtrados <- gapminder[
        gapminder$anio == input$anios & gapminder$pais == input$paiis, ]
    }, options = list(scrollX = TRUE))
  })
  
  
  output$texto <- renderText((
    paste("Usted seleccionó:", "Continente:", input$continente, ",",
          "País:", input$paiis, ", Año:", input$anios)))
  
  #Todos los países del continente
  
  observeEvent(input$filtrador, {
    
    output$tabla_gapmind <- renderDataTable({
      
      datos_filtrados <- gapminder[
        
        gapminder$anio == input$year & gapminder$continente == input$continent,]
    }, options = list(scrollX = TRUE))
    
  })
  
  output$texto_2 <- renderText((
    paste("Usted seleccionó:", "Continente:",input$continent, "-", "Año:",input$year)))
  
  
  # Selección por variables
  
  
  observeEvent(input$filtre, {
    datos_filtrados <- gapminder |>
      filter(pais == input$country) |>
      select(input$variables)
    
    output$tabla_variable <- renderDataTable({
      datos_filtrados
    }, options = list(scrollX = TRUE))
  })
  
  #TEXTO 
  output$texto_3 <- renderText((
    paste("Variable seleccionada:", "-",input$variables)))
  