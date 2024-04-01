dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

useradd expense

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip

cp backend.service /etc/systemd/system/backend.service
systemctl daemon-reload

rm -rf /app
mkdir /app
cd /app
unzip /tmp/backend.zip
npm install

systemctl enable backend
systemctl start backend

dnf install mysql -y
mysql -h 172.31.1.85 -uroot -pExpenseApp@1 < /app/schema/backend.sql
