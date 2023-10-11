#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_GUESS(){
  echo "Enter your username:"
  read USERNAME

  USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
  # if user do not exist
  if [[ -z $USER_INFO ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    # add new user
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
    USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
  else
    echo "$USER_INFO" | while IFS='|' read GAME_PLAYED BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi

  # get a random number between 1 and 1000
  SECRET_NUMBER=$((RANDOM % 1000 + 1))
  # get initial guess
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  NUM_GUESSES=1

  while [[ ! $SECRET_NUMBER == $GUESS ]]
  do
    # if the input is not a number
    if [[ ! "$GUESS" =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    # if the input is larger than the secret number
    elif (( $GUESS > $SECRET_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    # if the input is smaller than the secret number
    elif (( $GUESS < $SECRET_NUMBER ))
    then
        echo "It's higher than that, guess again:"
    fi
    read GUESS
    (( NUM_GUESSES++ ))
  done

  # when guess correctly
  echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  # add result to database
  # get user info
  echo "$USER_INFO" | while IFS='|' read GAME_PLAYED BEST_GAME
  do
    (( GAME_PLAYED++ ))
    if [[ $BEST_GAME == 0 || $BEST_GAME > $NUM_GUESSES ]]
    then
      BEST_GAME=$NUM_GUESSES
    fi
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = $GAME_PLAYED, best_game = $BEST_GAME WHERE username = '$USERNAME'") 
  done
}


NUMBER_GUESS
