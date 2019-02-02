mat3 = [1 2; 45 -12; 33 19; -10 23; 9 9];
char1 = 'This is my first character array';
char2 = 'This is not my last.';
temp = char1(1,5:10);
char3 = [char1 '. ' char2];
disp(char3);
%% Create a cell array
cell1 = {34,'thanks'}
cell1{2,1} = NaN;
cell{2,2} = NaN;

%% Structure Arrays 
student(1).name = 'John';
student(1).age = 23;
student(2).name = 'Sabrina';
student(2).age = 27;
student(2).grade = 87;

%% Calling isleapyear
a = isleapyear(2022,1)
b = isleapyear(2000)

%% 

