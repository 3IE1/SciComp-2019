# Day 2 Worksheet
Instructions and resources for Day 2 of Introduction to Scientific Computing. 

## Overview and Required Deliverables
Your goal over the next 3 hours (or working remotely) is to achieve the following objectives: 
1. Follow along with Jay to use scripts in [EC_Wx_tools repository](https://github.com/jasonbrodeur/EC_Wx_tools) to download a variety of weather records for two Canadian cities of interest 
2. After viewing the data, work in a small group (2 or 3) to answer the broad question: **"How does climate differ between two locations in Canada?"** by identifying a number of different figures or analyses that can be produced.
3. Use [this Google Sheet](https://goo.gl/gUWBrS) to claim a comparison for your group. 
4. Work with your group to create tables and figures that demonstrate your analysis (see instructions below). 
5. Write up your results (and display tables and figures) in Markdown in the results.md file in the folder of the course [github repo](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables) that corresponds to your selected comparison.  

**Your results must contain:** 
  - An introductory statement that describes your objectives, and the cities that you're comparing.
  - A list of the questions you've developed for your analyses.
  - At least three figures, with caption text beneath them, which explains their content.
  - At least two tables, caption text above them, which explains their content.
  - A couple of sentences beneath each figure and table, which communicate the results.
  - A final paragraph summarizing results. 
6. Into the same folder, upload the following: 
 - Your commented Matlab analysis script 
 - The figures you have generated, in png format (***hint:*** use these uploaded figures in your Markdown writeup by linking to them [browse to them in github, right-click > 'Copy link address'])

## A1. Prepare for analyses
1. Go to https://github.com/jasonbrodeur/EC_Wx_tools. Click on 'Clone or Download' and Download the zip file to the /Downloads directory (or another directory that you want to work in) on the computer and unzip it.

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

4. Claim a pair of cities for you (or your group) to investigate.
  - Use [this Google Sheet](https://goo.gl/gUWBrS) to claim a comparison for your group. Note that these correspond to the folders that have been created in the [Deliverables folder of our course Github repository](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables). You will edit the results.md file in the matching folder and upload your final content to it.
  
## A2. Create a data analysis plan  
Inspect the downloaded data tables in Excel. 


  - Open a new script. Load the station data in Matlab using the **importdata** function.
  - e.g. ```Calgary = importdata(<path to file>);```
    - This will load a structure variable with three fields:
      - Calgary.data is the numeric values from the table
      - Calgary.textdata contains any text values from the table
      - Calgary.colheaders list the column headers in the same columns as they exist in the table (useful to refer to columns in the data file)


1. Brainstorm with your peers some questions that could be explored in these datasets, e.g.:
  - How do daily temperature trends differ, generally? 
  - How much snowfall does each city receive in each year?  
  - How do the cities compare in terms of days per year with a temperature > 30 Celsius?
  - Which city has the highest day-to-day temperature ranges (or swings)?
  - What are the monthly mean temperatures for each city?
2. Ensure that you choose a range of questions that will allow you to create tables and figures. Your final report must contain: 
  - 
3. Collaborate with your group (and Jay) to figure out how to perform the analysis.
4. Locate a markdown page to show your results
- Find the proper folder in the [github repo](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables) that corresponds to the cities that you are comparing. 
- Within that folder (e.g. calgary-winnipeg), build your results page in the existing **results.md** document using the Github editor 
- Figures created in Matlab (and exported to .png files) can be uploaded to this same folder and used to host images for your results document.

## A4. Comment your script; upload to github
- Comment your script and add it to the proper folder in the [github repo](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables) that corresponds to the cities that you are comparing. 

## B. Matlab Figure Reference
### Plotting and visualizing data
To create a plot (or to bring up one that exists, use the **figure** command, 
- e.g. ```figure(1) % This creates a blank figure (if figure 1 doesn't exist), or brings it back up (if it already has been made)```

There are many [different plot types](https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html) that can be created.  The simplest is a line plot. To create it, use the **plot** command:
- e.g. ```plot(Calgary.data(:,4)); %plots the seventh column of the table```

By default, you get a line plot in blue, with no title or legend. You can customize virtually all parts of a figure:

### Line Type: 
```
plot(Calgary.data(:,4),'.');  % Plots Data points as dots instead of connected series
plot(Calgary.data(:,4),'.-'); % Connected dots
plot(Calgary.data(:,4),'--'); % Dashed line
plot(Calgary.data(:,4),'o'); % Open Circles
plot(Calgary.data(:,4),'s-'); % Connected Open Squares
```
### Marker Color:
```
plot(Calgary.data(:,4),'r.-'); % Makes the line and dots red.
plot(Calgary.data(:,4),'gp-'); % Green.
plot(Calgary.data(:,4),'kx'); % Makes the 'x's red.
plot(Calgary.data(:,4),'.','Color',[0.8 0.4 0.5]); % Can specify color as [Red Green Blue] from 0 to 1
```
### Custom Marker and Line Colors
```
plot(Calgary.data(:,4),'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.
```
### Plotting multiple series on a figure
Notice that each time you plot, you lose the previously plotted data. If you want to keep the previous plotted data, use the command **hold on**. Now, a second series can be plotted on top of it:
```
clf; % Use the command 'clf' to clear the figure:
plot(Calgary.data(:,4),'.','Color',[0.8 0.4 0.5]);
hold on;```
plot(Toronto.data(:,4),'bx-');
```

### Legend, title, x and y labels, font size
The **legend** command adds a legend to the plot. The labels correspond to the order of plotted series in your figure. You can specify the location of the legend on the figure by using the 'Location' keyword, and then specifying a compass direction:

```legend('Calgary','Toronto','Location','NorthWest');```
- For more information: ```doc legend```

Set the title using the **title** command. The **FontSize** argument sets the weight of the font
```title('<name of your plot>','FontSize',14); % font set to 14```

Set the x- and y-labels with the following Commands:
```
xlabel('<name of your x-axis variable>','FontSize',14);
ylabel('<name of your y-axis variable>','FontSize',14);
```

Set the font size of the axes and the legend with:
```set(gca,'FontSize',14); % The gca stands for 'get current axis'```

### Figure Handles
Another way to specify a figure is to assign it a variable name (you can then recall this figure by referring to its variable name)
```
f2b = figure(); 
plot(Calgary.data(:,4),'.','Color',[0.8 0.4 0.5]);
figure(f2b); clf;
plot(Toronto.data(:,4),'.','Color',[0.8 0.4 0.5]);
```

### Printing Figures:
Figures can be saved by either using the 'Save Figure' option in the figure window, or by using the MATLAB function **print**
- ***Note*** that this will print whichever figure is currently active (last selected).  We can make sure we save the right one by calling figure 2 again:
```
figure(f2b)
print(f2b,'-dpng',[data_loc 'lucky_random_numbers']); % saves as .png
print(f2b,'-dtiff',[data_loc 'lucky_random_numbers']); % saves as .tiff
print(f2b,'-djpeg',[data_loc 'lucky_random_numbers']); % saves as .jpg
```
- See ```doc print``` for more information about printing figures

### Closing figures:
You can close a figure by using the **close** command:
```close(f2b);```
- Or you can use ```close all``` to close all figures.

### Scatterplots
- Scatterplots are created similar to a line plot, except that you specify both x and y values:
```
figure(3);
plot(rand(100,1),rand(100.1),'b.'); % Scatterplot between random numbers
title('Random numbers','FontSize',14);
xlabel('Random Numbers','FontSize',14);
ylabel('Random Numbers, too','FontSize',14);
set(gca,'FontSize',14);
```

### Other Types of plots.
There are many types of plots. Highlight either variable in Workspace, and click the dropdown 'plot' menu above to see the different types of plots available. 
- You can also view [this Matlab page](https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html) that shows the types of plots available.

### Bar Graphs:
The command **bar** is used to make a bar graph: Let's make and compare histograms of the distribution of numbers in 
% rand_num and luck_num to see if they are similar (use the 'histc'
% command')
```
doc histc;
edges = (0:5:100)';
% Do for Lucky Numbers:
counts_rand = histc(randi(100,100,1),edges);
fbar_lucky = figure();
bar(edges+2.5,counts_rand);
title('Histogram for Numbers','FontSize',14);
xlabel('Value Number','FontSize',14);
ylabel('Count','FontSize',14);
```
