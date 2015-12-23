\name{ageb2010}
\alias{ageb2010}
\docType{data}
\title{
Mexican Urban Basic Geostatistical Areas (AGEB) 2010
}
\description{
As described by INEGI, an Urban Basic Geostatistical Area (AGEB) is the territorial extent which constitutes the basic unit of the National Geostatistical Framework. AGEBs are a set of blocks (generally ranging from 1 to 50), which are bounded by streets, avenues, walkways or any other feature of easy identification in the field. They are always located within urban localities and their land use is commonly residential, industrial, services or commercial. This package contains basic census data (2010) for all AGEBs in Mexico in two different formats: tabular and spatial. The former is prepared to be easily plotted with ggplot2.
}
\usage{data("ageb2010")}
\format{
  \describe{
\item{\code{NOM_ZOM}}{Metropolitan area name (when applies)}  	
\item{\code{NOM_ENT}}{State name}
\item{\code{NOM_MUN}}{Municipality name}
\item{\code{NOM_LOC}}{Locality name}
\item{\code{NOM_AGEB}}{Basic statistical geographic area name}
\item{\code{CVE_ZOM}}{Metropolitan area code (when applies)}
\item{\code{CVE_ENT}}{State code}
\item{\code{CVE_MUN}}{Municipality code}
\item{\code{CVE_LOC}}{Locality code}
\item{\code{CVE_AGEB}}{Basic statistical geographic area code}
\item{\code{...}}{Other 189 variables census data}
\item{\code{x}}{Longitude of the AGEB centroid}
\item{\code{y}}{Latitude of the AGEB centroid}
\item{\code{area}}{Area in ha of the AGEB}
}}
\source{INEGI Marco Geoestadístico 2010 versión 5.0.A (Censo de Población y Vivienda 2010). 
\url{www.inegi.org.mx}
}
\examples{
library(ggplot2)
data(ageb2010)
df <- merge(subset(ageb_spatial, CVE_ZOM == "13"), 
                   ageb_tabular[,c("CVE_ENT", "CVE_MUN", "NOM_ZOM", "CVE_ZOM", 
                                   "NOM_ENT", "NOM_MUN", "CVE_LOC", "NOM_LOC", 
                                   "CVE_AGEB", "VIVTOT", "TVIVHAB", "area")])
ggplot()+
  geom_polygon(data=df[order(df$order),],
               aes(long, lat, group=group, fill = TVIVHAB/area))+
  ylab('') + xlab('')+
  theme_bw() + coord_equal()

}
\keyword{datasets}
