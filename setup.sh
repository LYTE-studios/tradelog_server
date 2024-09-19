sudo apt install git

sudo rm -r tradelog_server

git clone https://lyte-manager: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@github.com/LYTE-studios/tradelog_server

cd tradelog_server

git checkout acceptance

sudo touch config/passwords.yaml

sudo cp ../passwords.yaml config/passwords.yaml

sudo docker compose up -d --build

sudo rm /etc/nginx/certificate.crt
sudo rm /etc/nginx/private.key

sudo touch /etc/nginx/certificate.crt
sudo touch /etc/nginx/private.key

sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp ../certificate.crt /etc/nginx/certificate.crt
sudo cp ../private.key /etc/nginx/private.key

sudo systemctl daemon-reload

sudo systemctl restart nginx
sudo systemctl status nginx