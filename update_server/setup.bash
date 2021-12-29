# Just some ideas
SERVER_ADDRESS=root@<%= ip %>
nocheck=" -o StrictHostKeyChecking=no "
ssh $nocheck $SERVER_ADDRESS << 'EOSSH'
touch /.cloud-warnings.skip
which git || (
  apt-get update
  apt-get -y install git
)

echo '
0 5 * * * root bash -l -c "rm -rf /landscapeapp || true; git clone https://github.com/web3land/web3-landscapeapp /landscapeapp; cd /landscapeapp; bash landscapes.sh"
55 4 * * * root bash -l -c "sudo reboot"
' > /etc/cron.d/updater
ls "landscapes.env" 2>/dev/null || (
    echo "Creating a file with private settings, /root/landscapes.env,
please fill it with proper keys and tokens"
    echo '
)
EOSSH

