
server<-function(input,output){
        prediction<-function(embarked,pclass,sex,age,sibsp,parch,fare){
                #Reading data into R
                titanic<-read.csv("train.csv")
                
                #Omit all NA values for simplicity
                titanic<-na.omit(titanic)
                titanic$Survived<-as.factor(titanic$Survived)
                
                #Loading required packages
                require(rpart)
                require(e1071)
                require(caTools)
                require(randomForest)
                #Sample Splitting
                set.seed(100)
                spl<-sample.split(titanic$Survived,SplitRatio=0.7)
                titanicTrain<-subset(titanic,spl==TRUE)
                titanicTest<-subset(titanic,spl==FALSE)
        
                
                #Building a model
                model<- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=titanicTrain, method="class")
                
                #Create a dataframe incorporating all the input variable
                df<-data.frame(data.frame(Pclass=pclass,Sex=sex,Age=age,SibSp=sibsp,Parch=parch,Fare=fare,Embarked=embarked))
                predicted<-predict(model,newdata=df)[2]
                return(predicted)
                
        }

        output$survivalProb=renderPrint({paste("According to your input, your calculated survival rate is",round(prediction(as.factor(input$embarked),as.numeric(input$pclass),as.factor(input$sex),input$age,input$sibsp,input$parch,input$fare),3))})
        output$text1=renderText({paste("Dear",input$name,",According to your input data",",your gender is",input$sex,",your age is",input$age,",you are travelling to",input$embarked,"(S=Southampthon,C=Cherboug,Q=Queenstown) with",input$sibsp,"siblings and",input$parch,"parents/children",",and you are buying",input$pclass,"(1:Upper Class,2:Middle Class,3:Lower Class) ticket at a rate of",input$fare,"US Dollar(s)")})
        }
