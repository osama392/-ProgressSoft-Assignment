# Linux Assignment Tasks

## Task 1: System Information Script
The script `os_info.sh` was created to display the OS information and resource usage.
```bash
#!/bin/bash

echo "System Information"
echo "• Executed By: $(whoami)"
echo "• Hostname: $(hostname)"
echo "• Server IP: $(hostname -I | awk '{print $1}')"
echo "• Public IP: $(curl -s ifconfig.me || echo 'Not connected')"
echo "• OS Type and Version: $(source /etc/os-release && echo $PRETTY_NAME)"
echo "• Kernel Version: $(uname -r)"
echo "• Architecture: $(uname -m)"
echo "• Virtualization: $(hostnamectl | grep Virtualization | awk '{print $2}' || echo 'VirtualBox')"
echo "• Server Time: $(date)"
echo "• Timezone: $(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')"
echo "• Uptime: $(uptime -p | sed 's/up //')"
echo ""
echo "Resource Usage"
echo "• Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "• Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " / " $2}')"
echo "• Swap Usage: $(free -h | awk '/^Swap:/ {print $3 " / " $2}')"
echo "• CPU Cores: $(nproc)"

##Task 2: Create User and Groups

#!/bin/bash
sudo groupadd PSgroup
sudo groupadd dba
sudo useradd -m -g PSgroup -G dba -s /bin/bash PS
sudo passwd PS

##Task 3: Modify Root Password
sudo passwd root


##Task 4: Install MySQL DB Engine and HAProxy
sudo apt update
sudo apt install mysql-server haproxy -y


##Task 5: Firewall Rules (TCP/UDP port 3306)
Configured UFW to allow traffic only on port 3306 for MySQL, and enabled the firewall.
sudo ufw enable
sudo ufw allow 3306/tcp
sudo ufw allow 3306/udp
sudo ufw allow 22/tcp

##Task 6: Copy file using SCP 
Installed SSH server (required for SCP on Ubuntu Desktop), created a test file, and transferred it to the VM using scp.

sudo apt install openssh-server -y
sudo systemctl enable --now ssh

touch test_file.txt
echo "Hello ProgressSoft" > test_file.txt
scp test_file.txt PS@127.0.0.1:/home/PS/
