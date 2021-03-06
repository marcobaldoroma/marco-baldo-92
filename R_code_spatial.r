#R code first spatial view of points package sp already downloaded
#instal this two packages for spatial analysis "raster" "rgdal"
## R code for spatial view of points
install.packages("raster")
install.packages("rgdal")

                                                          # call the library sp
library(sp)

                                                          # preparing the data meuse
data(meuse)

                                                          # the top lines of the data base
head(meuse)

                                                          # coordinates

coordinates(meuse) = ~x+y                                 # alt 126 for the tilde in windows / "sp" function is a R old package

                                                          # plot object meuse
plot(meuse)

                                                          # simple plot, spp
spplot(meuse, "zinc")                                     # simple plot graphs point and vectors, using spplot you can use a variable as function and graph the function i.g. concentration 

                                                          # Exercise: plot the spatial amount of copper using simple plot
spplot(meuse, "copper")

                                                          # add the label
spplot(meuse, "copper", main= "Copper concentration ")


                                                          #just to have a size directly related at the concentration we can use function bubble 

bubble(meuse,"zinc", main= "Zinc concentration")

                                                          # Exercise: use bubble f. for copper, lead, cadmium in red
bubble(meuse, "copper", main="Copper concentration", col="red")
bubble(meuse, "lead", main="Lead concentration", col="blue")
bubble(meuse, "cadmium", main="Cadmium concentration", col="gray")


# We create an exel file covid-19 aggregate of dataset to insert in the R console and work with our dataset for the first time. remember lab folder without capital letter always:
# these are the steps:  1#### Importing new data 2# download covid_agg.csv from our teaching site and build a folder called lab into C: 3#put the covid_agg.csv file into the folder lab
# setting the working directory: lab
# Windows users: setwd("C:/lab/") # Mac users: setwd("/Users/yourname/lab/") # Linux users: setwd("~/lab")

setwd("C:/lab/")

                                                           # recalling our data that I need for the graphs

covid <- read.table ("covid_agg.csv", head= T)             #T=TRUE head= header

head(covid)

attach(covid)

                                                            ## The following objects are masked from covid (pos = 5):
                                                            ####    cases, cat, country, lat, lon

plot(country, cases)

                                                            #plot (country$country,covid$cases) if you don't attached the covid cases

plot(country, cases, las=1)                                 #horizzontal labels

plot(country, cases, las=2)                                 #perpendicolar labels

plot(country, cases, las=0)                                 #parellel labels

plot(country, cases, las=3)                                 #vertical labels

plot(country, cases, las=3, cex.axis=0.5)                   #parellel labels + exaggeration cex

plot(country, cases, las=3, cex.axis=0.7)                   #parellel labels very good size balance for our graph

                                                            # let's make the spatial plot, ggplot: book, elegant graph, suggest to get it!!
                                                            # ggplot is a library very usefull for graphs

                                                            # ggplot to make a good graph you need 3 component: 1' data, 2' aestetic mappings, 3' tipe of symbol i.g. point

                                                            # let's install.packages ggplot2, you need installed packages "sp"
install.packages("ggplot2")

library(ggplot2)                                            # require ggplot2

                                                            #if ggplot2 doesn't work follow this alternative installation
                                                            # install.packages("devtools")
                                                            # devtools::install_github("tidyverse/ggplot2")

                                                            # save the .RData under the menu File

                                                            # q()  to save in alternative way

#### second part

                                                            # load the previously saved .RData

                                                            # setting the working directory: lab

setwd ("c:/lab/")

                                                            # load the previews script "R_code_spatial_first.RData"

load("C:/lab/R_code_spatial_first.RData")

                                                            # have a look on the data loaded

ls()
                                                            # covid
                                                            # if ggplot2 not work
                                                            # install.packages("devtools")
                                                            # devtools::install_github("tidyverse/ggplot2") before then ggplot2

library(ggplot2)                                            # require ggplot2

data(mpg)
head(mpg)

                                                            # key component: data, aes, geometry
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
                                                            # for plot with line
ggplot(mpg, aes(x=displ, y=hwy)) + geom_line()
                                                            # poligones
ggplot(mpg, aes(x=displ, y=hwy)) + geom_polygon()

                                                            # let's graphy covid, putting lat and lon in funcion of the cases variable, geom_point
head(covid)
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point()
ggplot(covid, aes(x=lon, y=lat, size=cases, col= "red")) + geom_point()



