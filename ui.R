# shiny project about checkee, input month year city output average waiting time
library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Average Waiting days for USA Visa Administrative Processing in China"),
        sidebarPanel(
               numericInput('id1','Year',2008,min = 2008,max  = 2015,step = 1),
               numericInput('id2','Month',0,min = 1,max = 12,step = 1),
               radioButtons("id3",label=h5("Visa Type"),
                                  choices = list("F1" = "F1",
                                    "B1" = "B1",
                                    "J1" = "J1",
                                    "H1" = "H1"),
                                    selected = 1),
               radioButtons("id4",label=h5("Embassy Location"),
                            choices = list("BeiJing" = "BeiJing",
                                    "ShangHai" = "ShangHai",
                                    "ChengDu" = "ChengDu",
                                    "GuangZhou" = "GuangZhou",
                                    "ShenYang" = "ShenYang"),
                                    selected = 1),
               radioButtons("id5",label=h5("Visa Entry"),
                            choices = list("New" = "New",
                                    "Renewal" = "Renewal"),
                            selected = 1),
              submitButton('submit')
        ),
        mainPanel(
                h3('App Description:'),
                p('Data sourse: ',a('Check Reporter',href = 'http://www.checkee.info/main.php?dispdate=')),
                p('Calculate the average waiting days for Administrative Processing also known as Check, based on Month, Year, Embassy Location, Visa type and entry.'),
                p('Data range from 2008/11 to 2015/7. NaN output means lack of data for selected Input.'),
                h3('Result of prediction'),
                h4('Your interview year'),
                verbatimTextOutput("oid1"),
                h4('Your interview month'),
                verbatimTextOutput("oid2"),
                h4('Your visa type'),
                verbatimTextOutput("oid3"),
                h4('Embassy Location'),
                verbatimTextOutput("oid4"),
                h4('Your Visa Entry'),
                verbatimTextOutput("oid5"),
                h4('Average waiting time in days'),
                verbatimTextOutput("prediction")
                
        )
))