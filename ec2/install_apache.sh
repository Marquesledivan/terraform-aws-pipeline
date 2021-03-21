#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
rm -rf /etc/httpd/conf.d/welcome.conf
sudo systemctl start httpd
sudo systemctl enable httpd
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
curl https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install -o install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start