#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

USERNAME_SEARCH=$($PSQL "SELECT username FROM number_guess WHERE username='$USERNAME'")

if [[ $USERNAME_SEARCH ]]
then
  GAMES_PLAYED=$($PSQL "SELECT COUNT(games_played) FROM number_guess WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(games_played) FROM number_guess WHERE username='$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

echo "Guess the secret number between 1 and 1000:"
read NUMBER

COUNTER=0

while [[ $NUMBER -ne $RANDOM_NUMBER ]]
do
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $NUMBER -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $NUMBER -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
  
  read NUMBER
  ((COUNTER++))
done
((COUNTER++))

INPUT_VALUES=$($PSQL "INSERT INTO number_guess(username, games_played) VALUES('$USERNAME', $COUNTER)")

echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
