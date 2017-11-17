#!/bin/bash
mkdir /home/poseidon/indices
touch /home/poseidon/indices/sorry
echo "Pas d'indices pour l'instant..." > /home/poseidon/indices/sorry
touch /var/tmp/indice1.sh
echo "echo \"Indice 1) Vous avez un mail non lu\" > /home/poseidon/indices/indice1" > /var/tmp/indice1.sh
touch /var/tmp/indice2.sh
echo "echo \"Indice 2) CourrierIMAP ça peut être utile\" >> /home/poseidon/indices/indice2" > /var/tmp/indice2.sh
crontab -l > crontab
echo "*/5 * * * * bash /var/tmp/indice1.sh" > crontab
echo "*/10 * * * * bash /var/tmp/indice2.sh" >> crontab
crontab crontab
rm crontab
