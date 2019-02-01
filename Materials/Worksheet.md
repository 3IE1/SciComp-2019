# Worksheet

## A. Course introduction
Follow along with Jay's introductory presentation to the course.

## B. Introduction to Matlab
1. Complete short introductory presentation
2. Explore the interface layout. Know the name of each panel, and briefly describe what they do.
### B.1. Basic command window operation
1. Create numeric variables using the command window
-- Assign custom names to variables
2. Create row vectors, column vectors and matrices
 ***hint***: *use brackets [ ] to generate vectors and matrices, commas or spaces to separate values in the same row, and  semi-colons to indicate new rows.*
-- Create an **m x 1** column vector (e.g. [4; 3; 1; 3; 1])
-- Create a **1 x n** row vector
-- Create an **m x n** matrix
3. Create a new vector or matrix that contains a not-a-number (NaN) value to indicate a missing (or null) value.  
***note:*** The value NaN is a special character recognized by MATLAB as a null value. Any normal operations that are carried out on variables containing NaNs will result in NaN.
4.  Use indexing to create a variable that consists of sub-elements of an existing matrix
***example***: ```d = matrix1(2,3)``` creates a variable *d* containing the value in the second row and third column of *matrix1*  
***example2***: ```e = matrix1(:,3)``` creates a variable *e* containing all values in the third column of *matrix1*
### B.2. Types of MATLAB variables
MATLAB provides for a number of different variable types to be used. Typically, the most appropriate variable type depends on the nature of your data and your desired processes and outcomes. Here are the MATLAB  variable types:

- **integer** arrays (of varying length, signed/unsigned)
- **numeric** arrays (real numbers)
- **logical** arrays (values of 1 or 0, representing true and false)
  - e.g. ```f = [12 -3 NaN 7];``` ```list_nans = isnan(f)```
- **character** arrays (strings stored as vectors of characters)
- **cell** arrays (array of indexed cells, each capable of storing an array of different dimension and type; think of Excel spreadsheets, if each cell could contain countless more cells inside of it)
- **structure** arrays (expandable tree of variables, which can each be of different size and type)
- **objects** (user classes and java classes)  

Below, you'll learn a bit more about basic array types.
####Numeric arrays
You've already been introduced to numeric arrays through your work with scalars, vectors and matrices. 

1. Create a character array using a string of characters. example: 
```str1 = 'Hello.'```
2. 
#### Character arrays

## C. Introduction to Github

## D. Learning through examples

## E. Data analysis challenge

## F. Project wrap-up