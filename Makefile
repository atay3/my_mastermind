CC=gcc
CFLAGS=-Wall -Wextra -Werror
DEPS= my_mastermind.h
TARGET= my_mastermind
OBJ= main.o game_logic.o utilities.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

my_mastermind: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f *.o

fclean: clean
	rm -f $(TARGET)

re: fclean $(TARGET)