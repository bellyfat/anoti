#!/bin/bash
echo "SMTP_USERNAME=$SMTP_USERNAME" >> /etc/environment
echo "SMTP_PASSWORD=$SMTP_PASSWORD" >> /etc/environment
echo "SELLER_CENTRAL_ACCESS_KEY_ID=$SELLER_CENTRAL_ACCESS_KEY_ID" >> /etc/environment
echo "SELLER_CENTRAL_SECRET_KEY=$SELLER_CENTRAL_SECRET_KEY" >> /etc/environment
echo "RECEIVER_EMAIL=$RECEIVER_EMAIL" >> /etc/environment
source venv/bin/activate
cd /root/app

python migrate.py
crontab schedule
service cron start
exec "$@"
