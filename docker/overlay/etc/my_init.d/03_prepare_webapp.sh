#!/usr/bin/env bash

cd /home/app/webapp
su app -c "bin/rake assets:precompile RAILS_ENV=production" || echo 'Failed'

echo
echo
echo -e "\e[32m*****************************************"
echo -e "\e[32m*                                       *"
echo -e "\e[32m*  \e[0m👉 Now open http://localhost:3119 👈 \e[32m*"
echo -e "\e[32m*                                       *"
echo -e "\e[32m*****************************************"
echo -e "\e[0m"
echo
echo