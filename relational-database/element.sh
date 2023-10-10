#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"



if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # get element info 
    ATOMIC_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius \
                        FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)\
                        WHERE atomic_number = $1")
  else
    NUM_CHAR=$(echo -n $1 | wc -m)
    # if input is the symbol (length <= 2)
    if (( $NUM_CHAR <= 2 ))
    then
      ATOMIC_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius \
                        FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)\
                        WHERE symbol = '$1'")
    else
    # input is the name of the atom
      ATOMIC_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius \
                        FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)\
                        WHERE name = '$1'")
    fi
  fi
  # if info not found
  if [[ -z $ATOMIC_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ATOMIC_INFO" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi


