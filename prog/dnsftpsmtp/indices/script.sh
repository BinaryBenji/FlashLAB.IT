#!/bin/bash
touch /home/poseidon/indices
echo "Pas d'indices pour l'instant..." > /home/poseidon/indices
touch /var/tmp/indice1.sh
echo "echo \"Indice 1) Vous avez un mail non lu\" > /home/poseidon/indices" > /var/tmp/indice1.sh
touch /var/tmp/indice2.sh
echo "echo \"Indice 2) CourrierIMAP ça peut être utile\" >> /home/poseidon/indices" > /var/tmp/indice2.sh
crontab -l > indices/crontab
crontab indices/crontab
rm indices/crontab