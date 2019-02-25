# Deliverable Instructions
Instructions for your final deliverable. 

## Overview and Required Deliverables
Your goal over the next 3 hours (or working remotely) is to achieve the following objectives: 
1. Follow along with Jay to use scripts in [EC_Wx_tools repository](https://github.com/jasonbrodeur/EC_Wx_tools) to download a variety of weather records for two Canadian cities of interest. Full instructions for how to do this is [below](https://github.com/3IE1/SciComp-2019/blob/master/Materials/deliverable-instructions.md#prepare-for-analyses).
2. After viewing the data, work in a small group (2 or 3) to answer the broad question: **"How does climate differ between two locations in Canada?"** by identifying a number of different figures or analyses that can be produced.
3. Use [this Google Sheet](https://goo.gl/gUWBrS) to claim a comparison for your group. 
4. Work with your group to create tables and figures that demonstrate your analysis (see instructions below). 
5. Write up your results (and display tables and figures) in Markdown in the results.md file in the folder of the course [github repo](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables) that corresponds to your selected comparison.  

**Your results must contain:** 
  - An introductory statement that describes your objectives, and the cities that you're comparing.
  - A list of the questions you've developed for your analyses.
  - At least three figures, with caption text beneath them, which explains their content.
  - At least one table, with a caption above it that explains its content.
  - A couple of sentences beneath each figure and table, which communicate the results.
  - A final paragraph summarizing results. 
  - A link to your commented analysis script (included in your submission folder)
6. Use the Github web interface to upload the following items into the same folder:
 - Your commented Matlab analysis script 
 - The figures you have generated, in png format (***hint:*** use these uploaded figures in your Markdown writeup by linking to them [browse to them in github, right-click > 'Copy image address'])

## Prepare for analyses
1. Go to https://github.com/jasonbrodeur/EC_Wx_tools. Click on 'Clone or Download' and Download the zip file to the /Downloads directory (or another directory that you want to work in) on the computer and unzip it.
  - ***NOTE:*** If things go wrong in Steps 1, 2, or 3 of this section, you can just find and download the station data files from the [Materials\Data folder](https://github.com/3IE1/SciComp-2019/tree/master/Materials/Data) of this repository. 

2. Follow along with Jay as he reviews the documentation and explains the scripts and functions, and how they work.
  - Jay will explain the advantages that these scripts provide compared to downloading individual months/years worth of data through the Environment Canada [historical data pages](http://climate.weather.gc.ca/climate_data/hourly_data_e.html?hlyRange=1953-01-01%7C2013-06-13&dlyRange=1937-11-01%7C2013-06-13&mlyRange=1937-01-01%7C2013-06-01&StationID=5097&Prov=ON&urlExtension=_e.html&searchType=stnName&optLimit=yearRange&StartYear=1840&EndYear=2019&selRowPerPage=25&Line=0&searchMethod=contains&Month=6&Day=13&txtStationName=Pearson&timeframe=1&Year=2013)

3. Edit (if necessary) and run the **run_get_EC_Wx** script. This script will execute the **get_EC_Wx** function to download data between 1950 and 2010 for a number of weather stations of interest across Canada, as identified through the Station Inventory document. 
  - The one value that you will likely need to change is line 6, which uses the **cd** (change directory) command. You need to edit the string (within the parentheses) to match the path to of your unzipped Ec_Wx folder.   
    - For example, if you've unzipped the package to **C:\Users\yourname\Documents**, the line should read ```C:\Users\yourname\Documents\Ec_Wx```

Once the **run_get_EC_Wx** script runs successfully, view the resulting files in your **\Ec_Wx\Data** folder. Note that the files are labeled with their station code. Relevant station codes for the data we'll be downloading are as follows: 

|Station Name|Station Code|
|:---|---:|
|Vancouver Intl Airport|889|
|Calgary Intl airport|2205|
|Winnipeg Intl airport|3698|
|Toronto (Pearson) Intl airport|5097|
|Montreal (Pierre Elliot Trudeau) Airport|5415|
|St. John's (NL) Airport|6720|

4. Claim which two cities you (or your group) will compare for your analyses.
  - Use [this Google Sheet](https://goo.gl/gUWBrS) to claim a comparison for your group. ***Note*** that these correspond to the folders that have been created in the [Deliverables folder of our course Github repository](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables). 
 - Find the proper folder in the Deliverables folder that corresponds to the cities that you are comparing (e.g. calgary-montreal). **This is where your group will submit their final deliverables.**
- Within that folder, build your results page in the existing **results.md** document using the Github editor 
- Figures created in Matlab (and exported to .png files) can be uploaded to this same folder and used to host images for your results document.
- Your final, commented script will be uploaded here, as well.

## Create a data analysis plan  
1. From your **\Ec_Wx\Data** folder, identify the two files that correspond to the stations you will use in your analyses. 
  - Open the files in Excel; explore the structure of the data and the variables that are available. 
  - Note that NaNs appear in the data -- these indicate missing values. 

2. Brainstorm with your group (or collectively in the class) some questions that could be explored in these datasets. Ensure that you choose a range of questions that will allow you to create the tables and figures listed as the [requirements](https://github.com/3IE1/SciComp-2019/blob/master/Materials/deliverable-instructions.md#overview-and-required-deliverables) for your final analyses.  

Questions that could be answered with a figure include:
  - How do daily temperature trends differ between the two cities, generally? 
  - How much snowfall does each city receive in each year?  
  - Which city has the highest day-to-day temperature ranges (or swings)?
  - Which city is prone to higher winds?

Questions that could be answered with a table include: 
  - What are the monthly mean, minimum, and maximum temperatures for each city? 
  - How do the cities compare in terms of days per year with a temperature > 30 Celsius? <0 Celsius?


|City|Avg days/yr < 0 C | Avg days/yr > 20 C | Avg days/yr > 30 C|
|:---|---:|---:|---:|
|Vancouver|22|70|5|
|Calgary|103|78|17|

## Perform analyses and publish results
1. Collaborate with your group (and Jay) to work through the analyses. 
  - Refer to your [Day 2 Worksheet](https://github.com/3IE1/SciComp-2019/edit/master/Materials/Worksheet-day2.md) for instructions

2. Locate a markdown page to show your results
- Find the proper folder in the [github repo](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables) that corresponds to the cities that you are comparing. 
- Within that folder (e.g. calgary-winnipeg), build your results page in the existing **results.md** document using the Github editor 
- Figures created in Matlab (and exported to .png files) can be uploaded to this same folder and used to host images for your results document.
- Be sure to comment your Matlab analysis script as you go; upload it to this folder when you are finished, and link to it in your final results. 
