#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/react-raid-tracker-frontend/deploy.log

echo 'cd /home/ec2-user/react-raid-tracker-frontend/react-raid-tracker' >> /home/ec2-user/react-raid-tracker-frontend/deploy.log
cd /home/ec2-user/react-raid-tracker-frontend/react-raid-tracker >> /home/ec2-user/react-raid-tracker-frontend/deploy.log

echo 'npm install' >> /home/ec2-user/react-raid-tracker-frontend/deploy.log 
npm install >> /home/ec2-user/react-raid-tracker-frontend/deploy.log