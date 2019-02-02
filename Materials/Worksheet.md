# Worksheet

## A. Course introduction
Follow along with Jay's introductory presentation to the course.

## B. Introduction to Matlab
1. Complete short introductory presentation
2. Navigate to our course github repository: https://github.com/3IE1/SciComp-2019 
- Click on 'Clone or Download' and Download the zip file to the /Downloads directory of the computer and unzip it. This is now your working directory.

### B0. Matlab interface
1. Explore the interface layout. Know the name of each panel, and briefly describe what they do.
- Change Matlab's working directory to your /Downloads folder

### B1. Basic command window operation
1. Create a numeric variable using the command window  
  - Create a numeric array and assign it a custom name
2. Create a row vector, a column vectors and a matrix 
  - ***hint***: *use brackets [ ] to generate vectors and matrices, commas or spaces to separate values in the same row, and  semi-colons to indicate new rows.*  
  - Create an **5 x 1** column vector; assign it to a named variable. e.g. ```cv = [4; 3; 1; 3; 1]```
  - Create a **1 x 5** row vector; assign it to a new named variable
  - Create an **4 x 3** matrix; assign it to a new named variable
3. Create a new vector or matrix that contains a not-a-number (NaN) value to indicate a missing (or null) value.  
  - ***note:*** The value NaN is a special character recognized by MATLAB as a null value. Any normal operations that are carried out on variables containing NaNs will result in NaN.
4. Use indexing to create an array that consists of sub-elements of the matrix you created earlier
  - ***example***: ```d = matrix1(2,3)``` creates a variable *d* containing the value in the second row and third column of *matrix1*  
  - ***example2***: ```e = matrix1(:,3)``` creates a variable *e* containing all values in the third column of *matrix1*
5. Perform basic arithmetic [+ - / *] operations on your arrays (try scalars, vectors and matrices). 
  - Do you encounter any issues?
  - try ```sqrt(d);```, ```log;```
6. Perform basic statistical functions on your arrays
  - e.g. ```mean(d);```, ```std(d);```, ```median(d);```  

### B2. Learning more about Matlab
- There are two helpful commands for learning more about what a matlab function (like 'mean', for example) does: 
  - To view help documentation in the command window type **help** and the name of the function 
    - e.g. ```help mean;``` 
  - To view documentation in a separate window, type **doc** and the name of the function 
    - e.g. ```doc mean;``` 

### B3. Working in a script (instead of the command window)
Open a new script, work through the rest of the examples in there.
- ***tip:*** you can send a line (or many lines) of code to the command window by highlighting them and pressing **F9** 
  
### B4. Types of MATLAB variables
MATLAB provides for a number of different variable types to be used. Typically, the most appropriate variable type depends on the nature of your data and your desired processes and outcomes. Here are the MATLAB  variable types:

- **integer** arrays (of varying length, signed/unsigned)
- **numeric** arrays (real numbers)
- **logical** arrays (values of 1 or 0, representing true and false)
  - e.g. ```f = [12 -3 NaN 7];``` ```list_nans = isnan(f)```
- **character** arrays (strings stored as vectors of characters)
  - e.g. ```char1 = 'my first string'``` ```char2 = 'is not my last'```
- **cell** arrays (array of indexed cells, each capable of storing an array of different dimension and type; think of Excel spreadsheets, if each cell could contain countless more cells inside of it)
  - e.g. ```cell1 = {345, 'Mazda', [34 43]; 34, NaN, 'zoom'}```
- **structure** arrays (expandable tree of variables, which can each be of different size and type)
  - e.g. ```s.a = 1; s.b = {'A','B','C'}; ```
- **objects** (user classes and java classes)  

Below, you'll learn a bit more about basic array types.

#### Numeric arrays
You've already had a basic introduction to numeric arrays through your work with scalars, vectors and matrices. 

#### Character arrays  
1. Create two character arrays using strings of characters; assign them variable names.  
  - e.g ```char1 = 'my first string'``` ```char2 = 'is not my last'```  
2. Combine (concatenate) the two character arrays into a new single character array 
  - e.g. ```char3 = [char1 char2];```
3. Figure out how to insert another string between char1 and char2

#### Cell arrays
1. Create a 2x2 cell array, where one of the cells contains: 
  - a scalar (i.e. a single numeric value) e.g. ```cell1{1,1} = 99;```
  - a character array e.g. ```cell1{1,2} = 'bottles of beer on the wall';```
  - a matrix
  - a NaN

#### Structure arrays
1. Enter the following
- ```student(1).name = 'John';```
- ```student(1).age = 23;```
- ```student(2).name = 'Sabrina';```
- ```student(2).age = 24;```
2. Create a new type of category for both students named 'grade' and give each student a value.

### B5. Running your newly-created script
- In the command window, clear all variables from the workspace with the ```clearvars;``` command 
- Run your script using the 'play' button. Note that you will be required to save it. Save it to the same directory as the rest of your work.

### B6. Control structures and indexing 
- Create a new blank script

#### For loops
- Loops are handy when you need to repeat a process many times, such as when reading through many rows or columns of data, or running a process iteratively. 
- The **for** function allows you to do this. Learn more by typing into the command window: ```doc for;```
1. In your new script, create a for loop that increments **i** from 1 to 100 by 1. 
- within the loop, assign 

#### If statements
- An 'if' statement evaluates if a condition is met (true) or not met (false), and allows the user to perform different functions based on the outcome.  
  - If the statement is true (condition is met) Matlab will execute whatever commands are below it.  
  - If it is untrue, it will execute any commands that are below the 'else' statement.
  - Just like 'for' loops, 'if' statements have to be closed with an 'end'
1. 

#### Indexing and the 'find' function

### B7. Functions
A function is similar to a script in that it is a list of commands to be executed.  Where it differs, however, is that functions run within their own personal Workspace (called a 'stack').  By default, internal variables will not be placed in the Workspace, and functions will not be able to 'see' any existing variables in your Workspace.  

You pass data into and out of functions using the function declaration statement at the top of the function. 
- It looks something like ```function [output1 output2] = name_of_function(input1 input2 input3)```

Functions can have any number of input and output variables, and can be named mostly anything (as long as they don't have a special character or a space in them).

Functions are useful when you are interested in only select output variables in a set of commands.  You can also run a function inside of a script (or another function), which makes it a very space and time-saving way to run many commands.  

Functions are called by using their name and the output/input format specified above (see below example). For example, the operation 'mean' is a function.  
- It is called by, e.g. ```[average] = mean(values);``` where 'average' is the output, 'mean' is the function name, and 'values' are the input. 

1. Open \Scripts\isleapyear.m. 
- What does it do? How can we use it? 
2. Figure out how to use isleapyear from the command line. 







- ```Calgary = importdata(<path to file>);```
  - This will load a structure variable with three fields
    - Calgary.data is the numeric values from the table
    - 

- Q1. In Toronto during July of 2005, how many days had a maximum temperature above 25 degrees? 
- Q2. How much snow 












## C. Introduction to [git](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) and Github
### C1. Setting up your git account ([git documentation](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)):
- Set your name: ```git config --global user.name "John Doe"```
- Set your email address: ```git config --global user.email johndoe@example.com```
- Check your settings ```git config --list```

### C2. How git works
![alt text](https://git-scm.com/book/en/v2/images/lifecycle.png "git workflow")

### C3. Cloning a repository (from Github)
- Find a repository of interest on Github; Click the **Clone or download** button; Copy the url provided
- In git, navigate to the directory where you want to clone (download) the repository contents.
- Clone a repository: ```git clone https://github.com/3IE1/SciComp-2019.git``` (replace with proper url)

### C4. Checking status, adding and committing changes
- Check status (i.e. what's been modified): ```git status```
- Add items to the list of tracked files (individually): ```git add <filename>```
  - OR Add all items to this list of tracked files: ```git add --all```
- Commit changes to git (i.e. record changes): ```git commit -m '<enter info on what has changed>'```
  - OR add and commit all at once: ```git commit -a -m '<enter info on what has changed>'```
  
### C5. Push changes to a Github repository
- Ensure that you have permissions to write to the Github repository (must be done in Github)
- Push changes to a connected Github repository: ```git push origin master```
  - In this example -- which is the default case -- **origin** specifies the remote (i.e. Github) repository that is the target of your 'push'. **master** specifies the branch of the git repository that you're working on as the source data.
- Check if there are connected remote repositories: ```git remote -v```

### C6. Pull changes 
- If others have pushed changes to the Github repository, you need to **pull** the changes to sync your local directory
- Pull changes: ```git pull origin master```
  - git **pull** actually runs two processes: **fetch** (get changes) and **merge** (place in your directory) 
- You can check changes (before merging them) with: ```git fetch``` ```git diff origin master```

## D. Learning through examples

## E. Data analysis challenge

## F. Project wrap-up
