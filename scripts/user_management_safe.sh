#!/bin/bash
# Simple user management simulation

USER_LIST="user_list.txt"      # file with usernames
CREDENTIALS="credentials.txt"  # output file

> "$CREDENTIALS"  # empty the credentials file

while read -r username; do
  # skip empty lines
  [ -z "$username" ] && continue

  # generate random password
  password=$(openssl rand -base64 12)

  # simulate user creation
  echo "Creating user: $username with password: $password"

  # save username and password
  echo "$username : $password" >> "$CREDENTIALS"

done < "$USER_LIST"

echo "All done. Credentials saved in $CREDENTIALS"

