function [leapflag] = isleapyear(input_yr,verbose_switch)
%%% This function checks if a given input year is a leapyear.
% Inputs: input_yr (the year to check); verbose_switch (if ==1, will display outcome)  
% Output: leapflag is 1 if year is a leapyear, and 0 otherwise
% usage: [leapflag] = isleapyear(input_yr, verbose_switch)
% e.g. leapcheck = isleapyear(2012,1);
% Created 9 Feb, 2009 by JJB:
% Modified 01 Feb, 2019 by JJB.

% if only input_yr is given, assume we want the function to be verbose
if nargin == 1; 
    verbose_switch = 1;
end

% If input_yr has been given as a character arraw, convert to a number
if ischar(input_yr)
    input_yr = str2num(input_yr);
end

%%%%%%%%%%%%%%%%%%% Check for leap year
if mod(input_yr,400)==0
    leapflag = 1;
    
elseif mod(input_yr,4) ==0
    leapflag = 1;
    
else 
    leapflag = 0;

end

%%%%%%%%%%%%%%%% Output the result to the screen (if set):
if verbose_switch == 1
    switch leapflag
      case 0
      disp([num2str(input_yr) ' is not a leap year']);
      case 1
      disp([num2str(input_yr) ' is a leap year']);
    end
end