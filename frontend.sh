dnf install ngnix -y
systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/ngnix/html/*

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

cd /usr/share/nginx/html/
unzip /tmp/frontend.zip

systemctl restart ngnix
systemctl status nginx