# file Commands:
1. touch => create file
2. mkdir name => directory creation
3. mv name name => change name and move files other folder
4. cp name name => copy files to another directroy
5. rm -rf web => remove directory
6. cat file => viewing the file context
7. chmod 777 file => permissions set to files
8. chown -R ubuntu:ubuntu file_name => change ownership to file 

# disk space commands:
df -h => space is root level human readble format
du -sh * -c => files and directory disk space

# text editors and viewing commands:
grep => searching command
less => viewing command
more => viewing
head => starting 10 lines
tail => ending 10 lines
awk => text processing tool
cut => extracts a specific filds
sed => this used to substiuting and deleting.
vi => editor for files
nano => editor for files
find => searching files and directories

# memory and cpus commands:
free -h => check cpus and memory

# process management
ps aux  => check all running process
top => real time system statastics and cpus and memory
htop => advanced version of top
uname -a => system information

# service management
systemctl/service status/restart/stop nginx

# network management
netstat -tulpn  => display network connections, routing tables, interface statistics, and other network-related information
ifconfig/ip a => showing configuration interfaces
nslookup => The nslookup command is used to query DNS (Domain Name System) to obtain domain name or IP address mapping, or other DNS records
