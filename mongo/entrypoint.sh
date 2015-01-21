#!/bin/bash
#
# entrypoint.sh
#
# Copyright (c) 2015 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
set -m
mongod --auth &
sleep 5

cat <<EOF > admin.js
var has_user = false
var users = db.getUsers()
for(var i = 0; i < users.length; ++i){

  if(users[i]["user"] == "$USER"){
    
    has_user = true
    break

  }

}

if(!has_user){

  db.createUser(
    {
      user: "$USER",
      pwd: "$PASSWORD",
      roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    }
  )

}
EOF

mongo admin admin.js
fg

