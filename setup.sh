sudo docker system prune

sudo apt install git

sudo rm -r tradelog_server

git clone https://github.com/LYTE-studios/tradelog_server

cd tradelog_server

sudo touch config/passwords.yaml
sudo touch config/google_client_secret.json

sudo cp ../passwords.yaml config/passwords.yaml
sudo cp ../google_client_secret.json config/google_client_secret.json

sudo docker compose up -d --build
