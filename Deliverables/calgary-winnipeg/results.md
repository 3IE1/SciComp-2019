# An analysis of weather data from 1950 - 2010 from Calgary and Winnipeg 
Completed by Kaushar Mahetaji 

# Objectives 
The objective of this script is to compare weather data between Calgary and Winnipeg. This involves answering the following four questions: 
1. How does annual rainfall differ between Calgary and Winnipeg? 
2. How does the annual snowfall differ between Calgary and Winnipeg? 
3. How does the daily maximum temperature differ between Calgary and Winnipeg? 
4. How strong is the correlation between daily maximum temperatures in Calgary and Winnipeg?  

These questions are answered using the figures provided below. 

# Results from Script 
## Comparing Precipitation in Calgary and Winnipeg 
![Calgary_Precip](https://github.com/KausharM/SciComp-2019/blob/patch-1/Deliverables/calgary-winnipeg/Calgary_precip.png)
![Winnipeg_Precip](https://github.com/KausharM/SciComp-2019/blob/patch-1/Deliverables/calgary-winnipeg/Winnipeg_precip.png)
*Figure 1: A comparison of annual rainfall and snowfall in two major Canadian cities: Calgary and Winnipeg, from 1950 – 2010 using two distinct line graphs. The pink square indicates annual rainfall, while the green circle indicates annual snowfall.* 

Using Figure 1, we can observe that for Winnipeg, annual rainfall is greater than annual snowfall for any given year from 1950 - 2010. For Calgary, this is not the case, as around 1966, rainfall reaches 140mm, whereas snowfall is at 165mm. This occurs earlier on for Calgary around 1955, where precipitation in the form of snowfall is greater. In Winnipeg, as seen by the y-axis, there is higher precipitation in the form of rainfall compared to Calgary. When comparing the general trend over each decade for each city, the maximum and minimum precipitation tend to fall within the same five-year time period. 

## Comparing Daily Maximum Temperature in Calgary and Winnipeg 
![Calgary_Tmax](https://github.com/KausharM/SciComp-2019/blob/patch-1/Deliverables/calgary-winnipeg/Calgary_Tmax_histogram.png)
![Winnipeg_Tmax](https://github.com/KausharM/SciComp-2019/blob/patch-1/Deliverables/calgary-winnipeg/Winnipeg_Tmax_histogram.png)
*Figure 2: A comparison of the frequency of daily maximum temperatures in two major Canadian cities: Calgary and Winnipeg, from 1950 – 2010 using histograms.*

Using the two histograms from Figure 2, daily maximum temperature for Calgary resembles a skewed normal distribution unlike Winnipeg's daily maximum temperatures, which most closely mirrors a bimodal distribution. The greatest number of days for any given temperature is given to Calgary, which has a maximum of 1500 days for a given temperature of 22 degrees Celsius. This contrasts approximately 1275 days for Winnipeg at about the same temperature. The most frequent temperature appears to be the same for both Calgary and Winnipeg. Moreover, cooler conditions below freezing point are more frequent in Winnipeg than in Calgary. The trend for warmer temperatures above 28 degrees Celsius is generally the same for both Calgary and Winnipeg. 

## Comparing the Strength of the Correlation Between Daily Maximum Temperature in Calgary and Winnipeg 
![Winnipeg_Calgary_Tmax_Comparison](https://github.com/KausharM/SciComp-2019/blob/patch-1/Deliverables/calgary-winnipeg/Winnipeg_Calgary_Tmax_comparison.png)
*Figure 3: Examining the correlation of daily maximum temperature in Calgary on a given day to daily maximum temperature in Winnipeg on a given day.*
      
The correlation coefficient using the linear trendline generated in Figure 3 is 0.81607 with a p-value of 0. The correlation between the two daily maximum temperatures is strong. The graph also shows a strong positive linear trend. From the graph, neither city frequently reaches extremes below -30 degrees Celsius or above 35 degrees Celsius. There is also more variation between the two cities at lower temperatures as seen in Figure 3 with the greater dispersion of points. 

## Comparing Annual Precipitation (mm) in Two Major Cities 
*Table 1: Comparing Annual Precipitation in mm of Rainfall and Snowfall in Calgary and Winnipeg in 2005.*

| City        | Rainfall   | Snowfall |
| ------------- |:-------------:| -----:|
| Calgary | 480mm | 75mm |
| Winnipeg | 525mm | 165mm |

It is evident from Figure 1 and Table 1 that Winnipeg experiences greater precipitation than Calgary, and rainfall is more prevalent than snowfall in both cities. Note that the table only uses data from 2005. 

# Summarizing Results 
These results indicate similiarities and differences between Calgary and Winnipeg weather. Similarities include trends of increasing and decreasing precipitation around the same timeframe for both Calgary and Winnipeg. Yet, Calgary tends to experience less rainfall in comparison to Winnipeg. In addition, weather data provided insight into daily maximum temperatures for Calgary and Winnipeg. The most frequent temperature for both Calgary and Winnipeg was around 22 degrees Celsius but differences emerged around cooler temperatures. Winnipeg experienced cooler temperatures more frequently than Calgary. Lastly, there was a strong correlation between daily maximum temperatures in Calgary and Winnipeg, which was observed using a linear trendline. 
