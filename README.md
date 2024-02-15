# Welcome to My Mastermind
***

## Task
Implement Mastermind, a game composed of 9 pieces of different colors. Four distinct pieces make up a secret code. The player has 10 attempts to find the secret code.

After each input, the game indicates to the player the number of well placed pieces and the number of misplaced pieces. The player wins if the code is found.

It is required to read the player's input from the standard input and take in the parameters -c and -t.

-c allows the player to specify the secret code. If no code is specified, a random code will be generated.

-t allows the player to specify the number of attempts. By default, the game allows 10 attempts.

Must handle the sequence Ctrl + d (End Of File).

## Description
Mastermind was implemented using 3 different files. The main.c file calls the function that prompts the user for input and is the entry point of the program. 

The utilities.c file contains helper functions that are called to help the initialization of the game's settings and data management. 

The game_logic.c file contains the implemented core logic of the game, such as the initialization of the game settings depending on which flag is passed in from the standard input. 

The function rand() is used to generate a random 4 digit code as the secret code. If the -c flag is used, the user's specified code will be set as the secret code.

If the -t flag is not used, the number of allowed attempts is set to 10 by default. Otherwise, the user's specified number of attempts will be used to initialize the attempts for the game.

User input is read a byte at a time from the standard input using the read() syscall. This input is passed to checkGuessValidity to ensure it's a valid code. If the read syscall returns 0, the program exits. If the input is not a 4 digit number, they are prompted again to type in a code. If it is valid, the code is then compared to the secret code. 

While iterating through the code with a loop, if the user's input contains a digit in the secret code that is not in the correct index, the number of misplaced pieces will be updated by 1. 

The number if well placed pieces is checked by looping through both strings and incrementing the number of well placed pieces by 1 if the numbers at the index match in both strings. An array, called pieces, tracks whether the number at each index has already been marked as well placed (1), misplaced (0), or neither (-1) and is used to prevent the same number from being incremented as well placed or misplaced more than once. If the user gets 4 well placed pieces, they win and the game ends.

The number of misplaced pieces is checked using a similar method as well placed pieces. Using the pieces array, if a number has already been marked as well placed it will not consider it as misplaced. The digits in the user input are tracked in a frequency array that is decremented if the digit at an index is already marked as well placed or misplaced. This is used alongside the pieces array and an array that tracks the frequency of each digit in the secret code so that if the user has input two of the same digit and that digit has already been marked as misplaced, then it will ignore any other instances of that digit and will not mark it as misplaced more than once. So if the digit's frequency at a certain index is greater than 0, pieces has not been marked (-1), and it matches the digit in the secret code all at the same index, the number of mispalced pieces will be incremented by 1. This prevents the program from incrementing the number of misplaced pieces too many times.

## Installation
You can clone the project repository from GitHub using the following command:
```
git clone https://github.com/atay3/my_mastermind.git
```

Users can compile the program using the provided Makefile. Once the repository is cloned, navigate to the project directory and run the following command:
```
make
```

To remove the compiled executable and object files use the following:
```
make clean
```

To completely clean the project directory, removing all compiled files and the executable, use the following:
```
make fclean
```

To recompile the program from scratch after making changes to the source code use the following:
```
make re
```

## Usage
To play the game with default number of attempts and a randomized code, use: 
```
./my_mastermind
```

To play the game with a specified secret code, use the -c flag and write the desired code: 
```
./my_mastermind -c "1234" 
```

To play the game with a specified number of attempts, use the -t flag and write the desired number of attempts: 
```
./my_mastermind -t 15
```

### The Core Team


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
