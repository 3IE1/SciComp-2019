function [] = isleapandprime(year_in)

% test is yr is prime and a leap year
    if isprime(year_in)==1 && isleapyear(year_in,0)==1
        disp('is prime and a leap year!');
    elseif isprime(year_in)==1 && isleapyear(year_in,0)==0
        disp('is prime but not a leap year')
    else
        disp('is not prime nor a leap year')
    end