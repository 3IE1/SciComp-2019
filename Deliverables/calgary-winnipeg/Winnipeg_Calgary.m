%% Kaushar Mahetaji script for Calgary-Winnipeg - modified version of Jay's script to analyze Calgary-Winnipeg weather data
% This script performs a sample analysis on weather data collected from
% 1950 to 2010 for the sites Calgary and Winnipeg
% Created February 23, 2019 by Kaushar Mahetaji


%% Import Calgary and Winnipeg data
Calgary = importdata('station2205-1950-2010-daily.csv'); %change the path to match the location of your files
Winnipeg = importdata('station3698-1950-2010-daily.csv'); %change the path to match the location of your files

%% Calculating Climate Statsitcs 
%%% Calculate mean daily temperature for entire 1950-2010 period. 
% Mean temperature is in column 6 of Winnipeg.data (as determined by looking in Winnipeg.colheaders)
Wpg_mean = mean(Winnipeg.data(:,6)); % will be NaN if there is a single NaN in the entire column

%%% Use 'find' function to identify all rows where there isn't an NaN 
% isnan is a function that identifies where a row is an NaN. 
% Putting a '~' in front for isnan inverts the function so that it searches
% for all rows that ARE NOT NaNs.
no_nans = find(~isnan(Winnipeg.data(:,6))); 

%%% Recalculate mean daily temperature, excluding NaNs from the analysis
Wpg_mean = mean(Winnipeg.data(no_nans,6)); % will be NaN if there is a single NaN in the entire column
% An alternative method is found by reading the help page for mean ```help mean```
Wpg_mean = mean(Winnipeg.data(:,6),1,'omitnan'); % The 1 indicates to take the mean down the column

%%% Find the highest maximum daily temperature recorded in Winnipeg 
% Max Temp is column 4 (as determined by looking in Winnipeg.colheaders)
Wpg_max = max(Winnipeg.data(:,4),[],1,'omitnan');

%%% Calculate the average high and low temperatures for each month
% Column 2 is the month number; column 4 is maximum; column 5 is minimum
for i = 1:1:12 % i will represent each month
% Select all rows where month equals the value of i.
    rows_selected = find(Winnipeg.data(:,2)==i); 
% Take the mean of maximum temperature for the selected rows
Wpg_monthly_max(i,1) = mean(Winnipeg.data(rows_selected,4),1,'omitnan');  
% Take the mean of minimum temperature for the selected rows    
Wpg_monthly_min(i,1) = mean(Winnipeg.data(rows_selected,5),1,'omitnan');  
end
% Cal_monthly_max and Cal_monthly_min are 12 rows x 1 column. Each row
% corresponds to the month of the year.

%%% Calculate annual rain and snowfall for Winnipeg for each year between 1950 and 2010
% Column 1 is year; Column 9 is rain; Column 10 is snowfall
ctr = 1;
for i = 1950:1:2010 % i will represent each year
    % Select all rows where year (column 1) equals the value of i.
    rows_selected = find(Winnipeg.data(:,1)==i);
    % Take the sum of precipitation
    Wpg_annual_rain(ctr,1) = sum(Winnipeg.data(rows_selected,9),1,'omitnan');
    Wpg_annual_snow(ctr,1) = sum(Winnipeg.data(rows_selected,10),1,'omitnan');
ctr = ctr+1;
end
% Cal_annual_rain and Cal_annual_snow are 61 rows x 1 column. Each row
% corresponds to a year from 1950 to 2010.

%% Creating a plot
%%% Create a blank figure
% Use the figure command to create a blank figure or bring it back up (if it already has been made)
figure(1);

%%% Create a line plot of Winnipeg Max Temperature data using the **plot** command
figure(1);clf % clf clears a figure of its content.
plot(Winnipeg.data(:,4))
% Notes on this figure: 
% - Since no x-axis variable is provided, it inserts the data point number as a default
% - NaNs in the dataset are ignored and the series is shifted to fill in the gap

%% Controlling line colours and markers
%%% Experiment with different plot styles by plotting the annual rainfall data calculated earlier
figure(1);clf;
% Experiment with line type:
plot(Wpg_annual_rain,'.');  % Plots Data points as dots instead of connected series
plot(Wpg_annual_rain,'.-'); % Connected dots
plot(Wpg_annual_rain,'--'); % Dashed line
plot(Wpg_annual_rain,'o'); % Open Circles
plot(Wpg_annual_rain,'s-'); % Connected Open Squares
% Experiment with Marker Colour:
plot(Wpg_annual_rain,'r.-'); % Makes the line and dots red.
plot(Wpg_annual_rain,'gp-'); % Green.
plot(Wpg_annual_rain,'kx'); % Makes the 'x's red.
plot(Wpg_annual_rain,'.','Color',[0.8 0.4 0.5]); % Can specify color as [Red Green Blue] from 0 to 1
% Custom Marker and Line Colors
plot(Wpg_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.

%%% Re-plot with year as the x-axis variable
plot([1950:1:2010],Wpg_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.

%%% Create a plot of annual snow AND rain sums, as calculated above
% Use the command **hold on** to keep Matlab from clearing the plot before drawing the new one
figure(2);clf;
plot([1950:1:2010],Wpg_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Wpg_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.

%% Adding and styling a legend, title, x and y labels
%%% The **legend** command adds a legend to the plot. The labels correspond to the order of plotted series in your figure. You can specify the location of the legend on the figure by using the 'Location' keyword, and then specifying a compass direction:
% For more information, enter ```doc legend``` in the command window
figure(2);clf;
plot([1950:1:2010],Wpg_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Wpg_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.
legend('Rain','Snow','Location','NorthEast');

%%% Set the title using the **title** command. 
% The **FontSize** argument sets the weight of the font
figure(2);
title('Annual rain and snow, Winnipeg, 1950-2010','FontSize',14); % font set to 14

%%% Set the x- and y-labels with the **xlabel**, **ylabel** Commands:
figure(2);
xlabel('Year','FontSize',14);
ylabel('Precipitation (mm)','FontSize',14);

%%% Set the font size of the axes and the legend with the **set** command:
set(gca,'FontSize',14); % The gca stands for 'get current axis'

%%% The **grid** command turns the grid on and off
grid on; % use 'grid off' to turn grid off.

%%% The **axis** function can be used to set the boundaries of the graph.
% The format is [xmin xmax ymin ymax]
axis([1948 2012 0 630])
%% Printing figures
%%% Figures can be saved by either using the 'Save Figure' option in the figure window, or by using the MATLAB function **print**
% ***Note*** that this will print whichever figure is currently active (last selected).  We can make sure we save the right one by calling it again before we print.
% Compile all commands from the last example:
figure(3);clf;
plot([1950:1:2010],Wpg_annual_rain,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.1 0.1 1],'LineWidth',1 ); % Makes the line and dots red.
hold on;
plot([1950:1:2010],Wpg_annual_snow,'o--','Color',[0.6 0.6 0.6],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',1 ); % Makes the line and dots red.
legend('Rain','Snow','Location','NorthWest');
title('Annual rain and snow, Winnipeg, 1950-2010','FontSize',14); % font set to 14
xlabel('Year','FontSize',14);
ylabel('Precipitation (mm)','FontSize',14);
set(gca,'FontSize',14); % The gca stands for 'get current axis'
grid on; % use 'grid off' to turn grid off.

% Print the figure in 3 different formats. They will be saved in our current directory
% Note that the '-r300' argument saves it at 300 points per inch (ppi) resultion 
figure(3);
print('-dpng','-r300','Winnipeg_precip'); % saves as Winnipeg_precip.png
print('-dtiff','-r300','Winnipeg_precip'); % saves as Winnipeg_precip.tiff
print('-djpeg','-r300','Winnipeg_precip'); % saves as Winnipeg_precip.jpg

%% Closing figures
%%% You can close a figure by using the **close** command:
close(figure(3));
%%% Or you can close all figures with ```close all```
close all;

%% Scatterplots
%%% Scatterplots are just line plots with corresponding x and y values plotted as points
% Note that each x and y values should correspond with another variable (i.e. time)

%%% Create a scatterplot of annual rain and annual snowfall for Winnipeg, 1950-2010
figure(4);clf;
plot(Wpg_annual_rain,Wpg_annual_snow,'ko');
title('Annual rainfall vs snowfall, Winninpeg 1950-2010','FontSize',14);
xlabel('Annual rainfall','FontSize',14);
ylabel('Annual snowfall','FontSize',14);
set(gca,'FontSize',14);

%% Bar Graphs
%%% The function **bar** is used to make a bar graph. 
% Often you will use a bar graph to present a histogram. You can use the function **histcounts** 

%%% Make a histogram of daily maximum temperature and present as a bar graph
bins = [-37:2:37]; % We'll create 38 bins that are 2 degrees wide
bin_centres = [-36:2:36]; % Centres of the bins (for plotting nicely).
[count_num, edges] = histcounts(Winnipeg.data(:,4),bins); % The 20 indicates that we want 20 even-width bins for the histogram
% Plot as a bar graph
figure(4);clf;
bar(bin_centres, count_num);
ylabel('Number of days','FontSize',14)
xlabel('Temperature (°C)','FontSize',14);
title('Distribution of daily max temperatures, Winnipeg 1950-2010')
% Print the figure:
figure(4);
print('-dpng','-r300','Winnipeg_Tmax_histogram'); % saves as Winnipeg_precip.png

%% Other Types of plots.
%%% There are many types of plots. Highlight either variable in Workspace, and click the dropdown 'plot' menu above to see the different types of plots available. 
% You can also view [this Matlab page](https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html) that shows the types of plots available.

%% Calculating and plotting a trend line
%%% The **polyfit** function is used to fit a trendline of a given order to a set of x,y data
% The **polyval** function can be used to estimate values based on the trendline produced

%%% Fit a linear trendline to Winnipeg annual rain and precipitation. Add the trend line to the plot
% re-plot previous scatterplot:
figure(5);clf;
plot(Wpg_annual_rain,Wpg_annual_snow,'ko');
title('Annual rainfall vs snowfall, Winnipeg 1950-2010','FontSize',10);
xlabel('Annual rainfall','FontSize',14);
ylabel('Annual snowfall','FontSize',14);
set(gca,'FontSize',14);
% Use polyfit to fit a linear trend to the data. 
% Note that NaNs cannot be used -- use the find function to find all rows with no NaNs:
rows_to_use = find(~isnan(Wpg_annual_rain) & ~isnan(Wpg_annual_snow));
p = polyfit(Wpg_annual_rain(rows_to_use),Wpg_annual_snow(rows_to_use),1); % The '1' indicates a first-order model (i.e. line)
% Values of p are (slope,intercept)

% Use polyval to create the linear estimates between 100 and 500
Wpg_annual_snow_pred = polyval(p,[100:100:500]);

% Add it to the figure:
figure(5);
hold on;
plot([100:100:500],Wpg_annual_snow_pred,'k--'); %plot the predicted values (i.e. trend line)
axis([100 500 50 300]); % Set axis limits to be tight to the data

%% Calculating and plotting a trend line; calculating correlation, Adding text
%%% The function **corrcoef** provides the correlation coefficient, and can return its associated p-value.
% The **text** function can be used to add free text to a figure

%%% Evaluate correlation between maximum temperature on a given day in Winnipeg and the maximum temperature on the same day in Calgary.
figure(6);clf;
% Find rows that aren't NaNs in both vectors
rows_to_use2 = find(~isnan(Winnipeg.data(:,4)) & ~isnan(Calgary.data(:,4)));
plot(Winnipeg.data(rows_to_use2,4),Calgary.data(rows_to_use2,4),'.','Color',[0.7,0.7,0.7]);
title('Daily maximum temperature comparison, Winnipeg-Calgary','FontSize',10);
xlabel('T_{max} Winnipeg (°C)','FontSize',14);
ylabel('T_{max} Calgary (°C)','FontSize',14);
set(gca,'FontSize',14);

% Use polyfit to fit a linear trend to the data. 
p2 = polyfit(Winnipeg.data(rows_to_use2,4),Calgary.data(rows_to_use2,4),1); % The '1' indicates a first-order model (i.e. line)
% Use polyval to create the linear estimates between -40 and 40
Cal_Tmax_pred = polyval(p2,[-40:10:40]);
% Calculate correlation coefficient (R)
[R,p_value] = corrcoef(Winnipeg.data(rows_to_use2,4),Calgary.data(rows_to_use2,4));

% Add it to the figure:
figure(6);
hold on;
plot([-40:10:40],Cal_Tmax_pred,'k--'); %plot the predicted values (i.e. trend line)
axis([-40 40 -40 40]); % Set axis limits to be tight to the data

%%% Use **text** to add the R and p-value
text(-38,-30,['R = ' num2str(R(1,2)) ', p = ' num2str(p_value(1,2))],'FontSize',12);

% Print the figure:
figure(6);
print('-dpng','-r300','Tmax_comparison'); % saves as Calgary_precip.png