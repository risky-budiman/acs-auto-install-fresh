#!/bin/bash

#proses install mongoDB
#update repository
apt-get update && sudo apt-get upgrade -y

#info proses install mongodb telah selesai
echo "Update dan upgrade repository selesai"

# Delay selama 5 detik
sleep 5

#install mongodb
apt-get install mongodb -y
#proses enable start dan cek status mongodb
systemctl enable mongodb
systemctl start mongodb

#info proses install mongodb telah selesai
echo "MongoDB Telah Seleai Di Install"

# Delay selama 5 detik
sleep 5

#install node js
#update repository
apt update
#install curl
cd ~
apt install curl -y

#info 
echo "Curl Telah Berhasil di Install"

# Delay selama 5 detik
sleep 5

#download isntalasi nodejs
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

#info data telah di hapus
echo "Selesai Mendownload Paket NodeJs"

# Delay selama 5 detik
sleep 5

#install nodejs
bash nodesource_setup.sh
sudo apt install nodejs -y

#info data telah di hapus
echo "NodeJs Selesai di Install"

# Delay selama 5 detik
sleep 5

#install npm
?apt update
?apt install npm -y
npn -v

#info data telah di hapus
echo "Paket npm Telah Selesai di Install"

# Delay selama 5 detik
sleep 5

#install genieACS
npm install -g genieacs@1.2.9
useradd --system --no-create-home --user-group genieacs

#info data telah di hapus
echo "GenieACS Anda Telah berhasil di install"

# Delay selama 5 detik
sleep 5

#menambahkan dir genieacs
mkdir /opt/genieacs
mkdir /opt/genieacs/ext
chown genieacs:genieacs /opt/genieacs/ext

# Menambahkan konfigurasi ke file genieacs.env
echo "GENIEACS_CWMP_ACCESS_LOG_FILE=/var/log/genieacs/genieacs-cwmp-access.log
GENIEACS_NBI_ACCESS_LOG_FILE=/var/log/genieacs/genieacs-nbi-access.log
GENIEACS_FS_ACCESS_LOG_FILE=/var/log/genieacs/genieacs-fs-access.log
GENIEACS_UI_ACCESS_LOG_FILE=/var/log/genieacs/genieacs-ui-access.log
GENIEACS_DEBUG_FILE=/var/log/genieacs/genieacs-debug.yaml
NODE_OPTIONS=--enable-source-maps
GENIEACS_EXT_DIR=/opt/genieacs/ext" > /opt/genieacs/genieacs.env

# Menampilkan pesan bahwa pengisian file selesai
echo "File /opt/genieacs/genieacs.env telah diisi."

#membuat console.log
node -e "console.log(\"GENIEACS_UI_JWT_SECRET=\" + require('crypto').randomBytes(128).toString('hex'))" >> /opt/genieacs/genieacs.env
chown genieacs:genieacs /opt/genieacs/genieacs.env
chmod 600 /opt/genieacs/genieacs.env

#menambahkan folder baru
mkdir /var/log/genieacs
chown genieacs:genieacs /var/log/genieacs

# Menentukan konten unit
cat <<EOF > /etc/systemd/system/genieacs-cwmp.service
[Unit]
Description=GenieACS CWMP
After=network.target

[Service]
User=genieacs
EnvironmentFile=/opt/genieacs/genieacs.env
ExecStart=/usr/bin/genieacs-cwmp

[Install]
WantedBy=default.target
EOF

# Mengedit file selesai
echo "File genieacs-cwmp.service telah diisi."

# Menentukan konten unit
cat <<EOF > /etc/systemd/system/genieacs-nbi.service
[Unit]
Description=GenieACS NBI
After=network.target

[Service]
User=genieacs
EnvironmentFile=/opt/genieacs/genieacs.env
ExecStart=/usr/bin/genieacs-nbi

[Install]
WantedBy=default.target
EOF

# Mengedit file selesai
echo "File genieacs-nbi.service telah diisi."


# Menentukan konten unit
cat <<EOF > /etc/systemd/system/genieacs-fs.service
[Unit]
Description=GenieACS FS
After=network.target

[Service]
User=genieacs
EnvironmentFile=/opt/genieacs/genieacs.env
ExecStart=/usr/bin/genieacs-fs

[Install]
WantedBy=default.target
EOF

# Mengedit file selesai
echo "File genieacs-fs.service telah diisi."


# Menentukan konten unit
cat <<EOF > /etc/systemd/system/genieacs-ui.service
[Unit]
Description=GenieACS UI
After=network.target

[Service]
User=genieacs
EnvironmentFile=/opt/genieacs/genieacs.env
ExecStart=/usr/bin/genieacs-ui

[Install]
WantedBy=default.target
EOF

# Mengedit file selesai
echo "File genieacs-ui.service telah diisi."

# Menambahkan konfigurasi logrotate ke file
echo "/var/log/genieacs/*.log /var/log/genieacs/*.yaml {
    daily
    rotate 30
    compress
    delaycompress
    dateext
}" > /etc/logrotate.d/genieacs

# Menampilkan pesan bahwa pengisian file selesai
echo "File /etc/logrotate.d/genieacs telah diisi."

# Enable dan start GenieACS CWMP
sudo systemctl enable genieacs-cwmp
sudo systemctl start genieacs-cwmp

#info data telah di hapus
echo "Selesai"

# Delay selama 5 detik
sleep 5

# Enable dan start GenieACS NBI
sudo systemctl enable genieacs-nbi
sudo systemctl start genieacs-nbi

#info data telah di hapus
echo "Selesai"

# Delay selama 5 detik
sleep 5

# Enable dan start GenieACS FS
sudo systemctl enable genieacs-fs
sudo systemctl start genieacs-fs

#info data telah di hapus
echo "Selesai"

# Delay selama 5 detik
sleep 5

# Enable dan start GenieACS UI
sudo systemctl enable genieacs-ui
sudo systemctl start genieacs-ui

#info data telah di hapus
echo "Selesai"

# Delay selama 5 detik
sleep 5

# Hapus paket iputils-ping
sudo apt remove --purge iputils-ping -y

#info data telah di hapus
echo "PING Tools Telah di uninstall"

# Delay selama 5 detik
sleep 5

# Instal ulang paket iputils-ping
sudo apt install iputils-ping -y

#info data telah di hapus
echo "PING Tools Telah di uninstall"

# Delay selama 5 detik
sleep 5

# Tampilkan pesan bahwa reinstall selesai
echo "Behasil di install ketik http://<ip-address:3000/ untuk membuka GenieACS pada browser."