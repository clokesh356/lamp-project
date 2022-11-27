LAMP Project steps
1.Install apache server in ec2 machine
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo systemctl status httpd

2. Install mariadb server
    yum install mariadb-server -y
    systemctl start mariadb
    systemctl enable mariadb
    systemctl status mariadb
By default mariadb server log in to root user, which is risky so set a password
    mysql_secure_installation
    mysql -u root -p