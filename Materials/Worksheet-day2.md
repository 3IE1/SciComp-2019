# Day 2 Worksheet
Instructions and resources for Day 2 of Introduction to Scientific Computing. 
## A Note on how to use this document
**You can use and/or repurpose any of the commands you find below (and in fact, you should!)**. You can copy and paste from a text block into a script, or you can find these instructions as a ready-to-go Matlab sample script in the [calgary-montreal example folder](https://github.com/3IE1/SciComp-2019/tree/master/Deliverables/calgary-montreal). 

## 1. Creating a new script 
- Open a new script. 
- Save it to your working directory. Give it an appropriate name
- At the top of the script, add some commented text to communicate the following information: 
  - What is the name of this script? 
  - What does it do? 
  - Who created it? 
  - When was it created? When was it last modified (if applicable).
***Note:*** use a ```%``` to comment everything afterwards on a line of code. 

## 2. Loading station data
There are a variety of methods for loading data into Matlab. In this example, we're use the **importdata** function.
- Load both sets of station data into the Matlab Workspace using the **importdata** function. Be sure to select the proper file - Refer to the [table of station numbers](https://github.com/3IE1/SciComp-2019/blob/master/Materials/deliverable-instructions.md#prepare-for-analyses) to identify the correct station numbers.
  - e.g for Calgary: ```Calgary = importdata('D:\Local\EC_Wx\Data\station2205-1950-2010-daily.csv'); %change the path to match the location of your files``` 
  - This will load a structure variable with three fields:
    - Calgary.data is the numeric values from the table
    - Calgary.textdata contains any text values from the table
    - Calgary.colheaders list the column headers in the same columns as they exist in the table (useful to refer to columns in the data file)

## 3. Calculating climate statistics 
### Calculate mean daily temperature for entire 1950-2010 period. 
Mean temperature is in column 6 of Calgary.data (as determined by looking in Calgary.colheaders)
```Cal_mean = mean(Calgary.data(:,6)); % will be NaN if there is a single NaN in the entire column```

### Use 'find' function to identify all rows where there isn't an NaN 
isnan is a function that identifies where a row is an NaN. 
Putting a '~' in front for isnan inverts the function so that it searches for all rows that **ARE NOT NaNs**.
```no_nans = find(~isnan(Calgary.data(:,6)));```

### Recalculate mean daily temperature, excluding NaNs from the analysis
```Cal_mean = mean(Calgary.data(no_nans,6)); % will be NaN if there is a single NaN in the entire column```
An alternative method is found by reading the help page for mean ```help mean```:
```Cal_mean = mean(Calgary.data(:,6),1,'omitnan'); % The 1 indicates to take the mean down the column```

### Find the highest maximum daily temperature recorded in Calgary
Max Temp is column 4 (as determined by looking in Calgary.colheaders)
```Cal_max = max(Calgary.data(:,4),[],1,'omitnan');```

### Calculate the average high and low temperatures for each month
Column 2 is the month number; column 4 is maximum; column 5 is minimum
```
for i = 1:1:12 % i will represent each month
% Select all rows where month equals the value of i.
    rows_selected = find(Calgary.data(:,2)==i); 
% Take the mean of maximum temperature for the selected rows
Cal_monthly_max(i,1) = mean(Calgary.data(rows_selected,4),1,'omitnan');  
% Take the mean of minimum temperature for the selected rows    
Cal_monthly_min(i,1) = mean(Calgary.data(rows_selected,5),1,'omitnan');  
end
% Cal_monthly_max and Cal_monthly_min are 12 rows x 1 column. Each row corresponds to the month of the year.
```
### Calculate annual rain and snowfall for Calgary for each year between 1950 and 2010
Column 1 is year; Column 9 is rain; Column 10 is snowfall
```
ctr = 1;
for i = 1950:1:2010 % i will represent each year
    % Select all rows where year (column 1) equals the value of i.
    rows_selected = find(Calgary.data(:,1)==i);
    % Take the sum of precipitation
    Cal_annual_rain(ctr,1) = sum(Calgary.data(rows_selected,9),1,'omitnan');
    Cal_annual_snow(ctr,1) = sum(Calgary.data(rows_selected,10),1,'omitnan');
ctr = ctr+1;
end
% Cal_annual_rain and Cal_annual_snow are 61 rows x 1 column. Each row
% corresponds to a year from 1950 to 2010.
```

## 4. Plotting and visualizing data

### Create a blank figure
Use the figure command to create a blank figure or bring it back up (if it already has been made)
```figure(1);```

### Create a line plot of Calgary Max Temperature data using the **plot** command
```
figure(1);clf % clf clears a figure of its content.
plot(Calgary.data(:,4))
% Notes on this figure: 
% - Since no x-axis variable is provided, it inserts the data point number as a default
% - NaNs in the dataset are ignored and the series is shifted to fill in the gap
```
### Controlling line colours and markers
Experiment with different plot styles by plotting the annual rainfall data calculated earlier
```
figure(1);clf;
% Experiment with line type:
plot(Cal_annual_rain,'.');  % Plots Data points as dots instead of connected series
plot(Cal_annual_rain,'.-'); % Connected dots
plot(Cal_annual_rain,'--'); % Dashed line
plot(Cal_annual_rain,'o'); % Open Circles
plot(Cal_annual_rain,'s-'); % Connected Open Squares
% Experiment with Marker Colour:
plot(Cal_annual_rain,'r.-'); % Makes the line and dots red.
plot(Cal_annual_rain,'gp-'); % Green.
plot(Cal_annual_rain,'kx'); % Makes the 'x's red.
plot(Cal_annual_rain,'.','Color',[0.8 0.4 0.5]); % Can specify color as [Red Green Blue] from 0 to 1
% Custom Marker and Line Colors
plot(Cal_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.
```

Re-plot with year as the x-axis variable
```plot([1950:1:2010],Cal_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.```

Create a plot of annual snow AND rain sums, as calculated above
- Use the command **hold on** to keep Matlab from clearing the plot before drawing the new one
```
figure(2);clf;
plot([1950:1:2010],Cal_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Cal_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.
```

### Adding and styling a legend, title, x and y labels

The **legend** command adds a legend to the plot. The labels correspond to the order of plotted series in your figure. You can specify the location of the legend on the figure by using the 'Location' keyword, and then specifying a compass direction:
- For more information, enter ```doc legend``` in the command window
```
figure(2);clf;
plot([1950:1:2010],Cal_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Cal_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.
legend('Rain','Snow','Location','NorthEast');
```
Set the title using the **title** command. 
- The **FontSize** argument sets the weight of the font
```
figure(2);
title('Annual rain and snow, Calgary, 1950-2010','FontSize',14); % font set to 14
```

Set the x- and y-labels with the **xlabel**, **ylabel** Commands:
```
figure(2);
xlabel('Year','FontSize',14);
ylabel('Precipitation (mm)','FontSize',14);
```

Set the font size of the axes and the legend with the **set** command:
```set(gca,'FontSize',14); % The gca stands for 'get current axis'```

The **grid** command turns the grid on and off
```grid on; % use 'grid off' to turn grid off.```

The **axis** function can be used to set the boundaries of the graph. The format is [xmin xmax ymin ymax]
```axis([1948 2012 0 630])```

### Printing figures
Figures can be saved by either using the 'Save Figure' option in the figure window, or by using the MATLAB function **print**
- ***Note*** that this will print whichever figure is currently active (last selected).  We can make sure we save the right one by calling it again before we print.

Compile all commands from the last example:
```
figure(3);clf;
plot([1950:1:2010],Cal_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Cal_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.
legend('Rain','Snow','Location','NorthWest');
title('Annual rain and snow, Calgary, 1950-2010','FontSize',14); % font set to 14
xlabel('Year','FontSize',14);
ylabel('Precipitation (mm)','FontSize',14);
set(gca,'FontSize',14); % The gca stands for 'get current axis'
grid on; % use 'grid off' to turn grid off.

% Print the figure in 3 different formats. They will be saved in our current directory
% Note that the '-r300' argument saves it at 300 points per inch (ppi) resultion 
figure(3);
print('-dpng','-r300','Calgary_precip'); % saves as Calgary_precip.png
print('-dtiff','-r300','Calgary_precip'); % saves as Calgary_precip.tiff
print('-djpeg','-r300','Calgary_precip'); % saves as Calgary_precip.jpg
```

### Closing figures
You can close a figure by using the **close** command:
```close(figure(3));```
Or you can close all figures with ```close all;```

### Scatterplots
Scatterplots are just line plots with corresponding x and y values plotted as points
- ***Note*** that each x and y values should correspond with another variable (i.e. time)

Create a scatterplot of annual rain and annual snowfall for Calgary, 1950-2010
```
figure(4);clf;
plot(Cal_annual_rain,Cal_annual_snow,'ko');
title('Annual rainfall vs snowfall, Calgary 1950-2010','FontSize',14);
xlabel('Annual rainfall','FontSize',14);
ylabel('Annual snowfall','FontSize',14);
set(gca,'FontSize',14);
```
### Bar Graphs
The function **bar** is used to make a bar graph. 
- Often you will use a bar graph to present a histogram. You can use the function **histcounts** 

Make a histogram of daily maximum temperature and present as a bar graph
```
bins = [-37:2:37]; % We'll create 38 bins that are 2 degrees wide
bin_centres = [-36:2:36]; % Centres of the bins (for plotting nicely).
[count_num, edges] = histcounts(Calgary.data(:,4),bins); % The 20 indicates that we want 20 even-width bins for the histogram
% Plot as a bar graph
figure(4);clf;
bar(bin_centres, count_num);
ylabel('Number of days','FontSize',14)
xlabel('Temperature (°C)','FontSize',14);
title('Distribution of daily max temperatures, Calgary 1950-2010')
% Print the figure:
figure(4);
print('-dpng','-r300','Calgary_Tmax_histogram'); % saves as Calgary_precip.png
```

### Other Types of plots.
There are many types of plots. Highlight a variable in your Matlab Workspace, and click the dropdown 'plot' menu above to see the different types of plots available. 
- You can also view [this Matlab page](https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html) that shows the types of plots available.

## 5. Other Examples

### Calculating and plotting a trend line
- The **polyfit** function is used to fit a trendline of a given order to a set of x,y data
- The **polyval** function can be used to estimate values based on the trendline produced

Fit a linear trendline to Calgary annual rain and precipitation. Add the trend line to the plot.

```
% re-plot previous scatterplot:
figure(5);clf;
plot(Cal_annual_rain,Cal_annual_snow,'ko');
title('Annual rainfall vs snowfall, Calgary 1950-2010','FontSize',10);
xlabel('Annual rainfall','FontSize',14);
ylabel('Annual snowfall','FontSize',14);
set(gca,'FontSize',14);
% Use polyfit to fit a linear trend to the data. 
% Note that NaNs cannot be used -- use the find function to find all rows with no NaNs:
rows_to_use = find(~isnan(Cal_annual_rain) & ~isnan(Cal_annual_snow));
p = polyfit(Cal_annual_rain(rows_to_use),Cal_annual_snow(rows_to_use),1); % The '1' indicates a first-order model (i.e. line)
% Values of p are (slope,intercept)

% Use polyval to create the linear estimates between 100 and 500
Cal_annual_snow_pred = polyval(p,[100:100:500]);

% Add it to the figure:
figure(5);
hold on;
plot([100:100:500],Cal_annual_snow_pred,'k--'); %plot the predicted values (i.e. trend line)
axis([100 500 50 300]); % Set axis limits to be tight to the data
```

### Adding a trend line; calculating correlation, Adding text
- The function **corrcoef** provides the correlation coefficient, and can return its associated p-value.
- The **text** function can be used to add free text to a figure

Evaluate correlation between maximum temperature on a given day in Calgary and the maximum temperature on the same day in Montreal.
```
figure(6);clf;
% Find rows that aren't NaNs in both vectors
rows_to_use2 = find(~isnan(Calgary.data(:,4)) & ~isnan(Montreal.data(:,4)));
plot(Calgary.data(rows_to_use2,4),Montreal.data(rows_to_use2,4),'.','Color',[0.7,0.7,0.7]);
title('Daily maximum temperature comparison, Calgary-Montreal','FontSize',10);
xlabel('T_{max} Calgary (°C)','FontSize',14);
ylabel('T_{max} Montreal (°C)','FontSize',14);
set(gca,'FontSize',14);

% Use polyfit to fit a linear trend to the data. 
p2 = polyfit(Calgary.data(rows_to_use2,4),Montreal.data(rows_to_use2,4),1); % The '1' indicates a first-order model (i.e. line)
% Use polyval to create the linear estimates between -40 and 40
Mtl_Tmax_pred = polyval(p2,[-40:10:40]);
% Calculate correlation coefficient (R)
[R,p_value] = corrcoef(Calgary.data(rows_to_use2,4),Montreal.data(rows_to_use2,4));

% Add it to the figure:
figure(6);
hold on;
plot([-40:10:40],Mtl_Tmax_pred,'k--'); %plot the predicted values (i.e. trend line)
axis([-40 40 -40 40]); % Set axis limits to be tight to the data

%%% Use **text** to add the R and p-value
text(-38,-30,['R = ' num2str(R(1,2)) ', p = ' num2str(p_value(1,2))],'FontSize',12);

% Print the figure:
figure(6);
print('-dpng','-r300','Tmax_comparison'); % saves as Calgary_precip.png
```
