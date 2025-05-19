#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?"
  fi

  echo -e "\n1) Cut\n2) Color\n3) Style\n4) Trim\n5) Exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in 
    1) SERVICES "$SERVICE_ID_SELECTED" ;;
    2) SERVICES "$SERVICE_ID_SELECTED" ;;
    3) SERVICES "$SERVICE_ID_SELECTED" ;;
    4) SERVICES "$SERVICE_ID_SELECTED" ;;
    5) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

SERVICES() {
  SERVICE_ID_SELECTED=$1

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_SEARCH_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_SEARCH_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_INFO_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

    echo -e "\nWhat time would you like your $(echo "$SERVICE_NAME" | sed -r 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    echo -e "\nI have put you down for a $(echo "$SERVICE_NAME" | sed -r 's/^ *| *$//g') at $(echo "$SERVICE_TIME" | sed -r 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed -r 's/^ *| *$//g')."

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    INSERT_APPOINTMENTS_INFO_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_SEARCH_ID'")

    echo -e "\nWhat time would you like your $(echo "$SERVICE_NAME" | sed -r 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    echo -e "\nI have put you down for a $(echo "$SERVICE_NAME" | sed -r 's/^ *| *$//g') at $(echo "$SERVICE_TIME" | sed -r 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed -r 's/^ *| *$//g')."

    INSERT_SERVICES_INFO_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_SEARCH_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  fi
}

EXIT() {
  echo -e "\nThank you for stopping in!\n"
}

MAIN_MENU