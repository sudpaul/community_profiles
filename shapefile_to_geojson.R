install.packages(c("rgdal", "spdplyr", "geojson", "rmapshaper", "sf", "gdalUtils", "leaflet"))
library(rgdal)
library(spdplyr)
library(geojsonio)
library(rmapshaper)
# Import Shapefile into R
greater_sydeny <- readOGR(dsn="C:/Users/z3525552/Downloads/Shapefile__SEIFA_IRSD___Linguistic_Diversity/shp",
                          layer = "5d70aff6-a426-4a0b-a63a-b7a3c8c10e55", verbose = FALSE)
# Convert SP Data Frame to GeoJSON
sa2_sydney <- geojson_json(greater_sydeny)

# Simplify the geometry information of GeoJSON making the file smaller
sydney_sim <- ms_simplify(sa2_sydney)

# Save it to a local file system
geojson_write(sydney_sim, file = "~/Geo_Spial_data_Australia/sydney_sa2-16.geojson")
