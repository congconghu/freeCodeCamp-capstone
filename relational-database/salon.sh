#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){

  # print the message when return to main menu
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  # get service info
  read SERVICE_ID_SELECTED
  SERVICE_AVAILABILITY=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  # if service not found 
  if [[ -z $SERVICE_AVAILABILITY ]]
  then
    # return to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else

    # get customer phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # get customer info
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # if customer info not found
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get customer name 
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # put customer info in database
      INSET_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # get sppointment time
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
    # get custimr id 
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # add appointment to database
    INSER_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}



MAIN_MENU