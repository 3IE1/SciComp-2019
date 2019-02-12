# Day 2 Worksheet
Instructions and resources for Day 2 of Introduction to Scientific Computing. 

## Creating a new script 
- Open a new script. 
- Save it to your working directory. Give it an appropriate name
- At the top of the script, add some commented text to communicate the following information: 
  - What is the name of this script? 
  - What does it do? 
  - Who created it? 
  - When was it created? When was it last modified (if applicable).
***Note:*** use a ```%``` to comment everything afterwards on a line of code. 

## Loading station data
There are a variety of methods for loading data into Matlab. In this example, we're use the **importdata** function.
- Load the station data in Matlab using the **importdata** function.
  - e.g. ```Calgary = importdata('D:\Local\EC_Wx\Data\station2205-1950-2010-daily.csv'); %change the path to match the location of your files```
    - This will load a structure variable with three fields:
      - Calgary.data is the numeric values from the table
      - Calgary.textdata contains any text values from the table
      - Calgary.colheaders list the column headers in the same columns as they exist in the table (useful to refer to columns in the data file)
##


## Plotting and visualizing data
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
