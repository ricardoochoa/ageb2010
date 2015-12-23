# ageb2010
## Mexican Urban Basic Geostatistical Areas (AGEB) 2010
As described by INEGI, an Urban Basic Geostatistical Area (AGEB) is the territorial extent which constitutes the basic unit of the National Geostatistical Framework. AGEBs are a set of blocks (generally ranging from 1 to 50), which are bounded by streets, avenues, walkways or any other feature of easy identification in the field. They are always located within urban localities and their land use is commonly residential, industrial, services or commercial. This package contains census data (2010) for all AGEBs in Mexico in two different formats: tabular and spatial. The former was prepared to be easily plotted with ggplot2. 

# Installation and loading
devtools::install_github('ricardoochoa/ageb2010')
load(ageb2010)

# Examples of use
Here are a couple of examples of use. First, lets plot gross population density in Mexico City (formally known as the Metropolitan Area of the Valley of Mexico). 


```r
# libraries
library(ggplot2)
library(ageb2010)

# setup data
# please note that Mexico City's Metropolitan Zone code is "13".
df <- merge(subset(ageb_spatial, CVE_ZOM == "13"), 
            ageb_tabular[,c("CVE_ENT", "CVE_MUN", "NOM_ZOM", "CVE_ZOM", 
                            "NOM_ENT", "NOM_MUN", "CVE_LOC", "NOM_LOC", 
                            "CVE_AGEB", "POBTOT", "TVIVHAB", "area")])


# plot
# please remember to order the data after subsetting the data.frame. 
ggplot(data=df[order(df$order),]) + # order the data
  geom_polygon(aes(long, lat, group=group, fill = POBTOT/area))+
  ylab('') + xlab('')+
  theme_bw() + coord_equal()

```

Want to see more? Check out the package Wiki! 



