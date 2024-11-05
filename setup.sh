sudo docker system prune

sudo apt install git

sudo rm -r tradelog_server

git clone https://lyte-manager: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@github.com/LYTE-studios/tradelog_server

cd tradelog_server

git checkout release/1.0.0/feature/extra-trade-calls

sudo touch config/passwords.yaml
sudo touch config/google_client_secret.json

sudo cp ../passwords.yaml config/passwords.yaml
sudo cp ../google_client_secret.json config/google_client_secret.json

sudo docker compose up -d --build
