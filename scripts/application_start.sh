#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/react-raid-tracker-frontend/deploy.log
# nodejs-app is the same name as stored in pm2 process
echo 'pm2 restart nodejs-app' >> /home/ec2-user/react-raid-tracker-frontend/deploy.log
pm2 restart nodejs-express-app >> /home/ec2-user/react-raid-tracker-frontend/deploy.log