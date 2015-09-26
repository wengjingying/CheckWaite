checkWeb<-read.csv("checkWeb.csv",stringsAsFactors = F)
checkWeb$checkyear<-as.numeric(checkWeb$checkyear)
checkWeb$checkmonth<-as.numeric(checkWeb$checkmonth)
checkWeb$waitingdays<-as.numeric(checkWeb$waitingdays)

aveWaite<-function(Type,Entry,City,Year,Month){
        mean(checkWeb[checkWeb$type==Type&checkWeb$entry==Entry&checkWeb$city==City&checkWeb$checkyear==Year&checkWeb$checkmonth==Month,1])
}

library(shiny)

shinyServer(
        function(input,output){
                output$oid1 <- renderPrint({input$id1})
                output$oid2 <- renderPrint({input$id2})
                output$oid3 <- renderPrint({input$id3})
                output$oid4 <- renderPrint({input$id4})
                output$oid5 <- renderPrint({input$id5})
                output$prediction<-renderPrint({aveWaite(input$id3,input$id5,input$id4,input$id1,input$id2)})
        }
)