cd ~
Set-ExecutionPolicy -Scope CurrentUser
RemoteSigned
Get-ExecutionPolicy -List

$script = New-Object Net.WebClient
$script | Get-Member
$script.DownloadString("https://chocolatey.org/install.ps1")
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey

choco install wireshark
choco upgrade wireshark

choco install -y nano

choco install -y python3
refreshenv
python -V
python -m pip install --upgrade pip

pip3 install scapy-python3

mkdir Environments
cd Environments
python -m venv my_env
exit
#my_env\Scripts\activate