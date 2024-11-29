# file Commands:
1. touch => create file
2. mkdir name => directory creation
3. mv name name => change name and move files other folder
4. cp name name => copy files to another directroy
5. rm -rf web => remove directory
6. cat file => viewing the file context
7. chmod 777 file => permissions set to files
8. chown -R ubuntu:ubuntu file_name => change ownership to file 

- => This is the regular file
d => directory
for files usually 1 as most files have only one hard link
for directory is different
=> ubuntu:ubuntu => starting is owner and second is user
=> regular file
   rw- => first set is User(owner)
   r-- => second set is group
   r-- => third set is others

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
- netstat -tulpn  => display network connections, routing tables, interface statistics, and other network-related information
- ifconfig/ip a => showing configuration interfaces
- nslookup => The nslookup command is used to query DNS (Domain Name System) to obtain domain name or IP address mapping, or other DNS records
- ip -v => showing exact iproute package version.
- ip addr show => The primary use of the ip addr command is used to view the IP addresses assigned to network interfaces on the system
- ip route => This command variation is used to display the current IP routing table
- dig domain_name => The dig (Domain Information Groper) is used to get information about domains and IP addresses from DNS servers.
- example -> dig -x 9.9.9.9
-            dig dns9.quad9.net
- nslookup => The nslookup command is similar to the dig command.
- syntax -> nslookup [target domain] [DNS server]
- traceroute => The traceroute is a simple command that tracks the route of a packet to a specific destination
- syntax -> traceroute [options] [hostname/IP (required)]
- tracepath => The tracepath command is used to trace the path(s) of a packet to a destination. 
- syntax -> tracepath [target IP address/hostname]
- ping => ping is much more than a simple network connectivity checker.
- host => host command when you need to quickly find the mapped IP address or the domain name.
- syntax -> host dns9.quad9.net
- 
- ss -ta => ss command is a versatile utility to display important network performance statistics in the terminal.
- route => The route command simply shows the IP routing table.
- arp => The arp command is used to display the IPv4 network neighbor cache table
- whois => It is the go-to command for discovering information about domains and IP addresses.
- mtr google.co => 
- tcpdump => tcpdump is often used in security-related scenarios where you need to capture and view network packets in real time.

difference between dig and nslookup:
- dig (Domain Information Groper):
- A powerful and flexible DNS querying tool.
- Primarily used by system administrators and DNS specialists for in-depth DNS troubleshooting.
- Offers a detailed output with full DNS response headers, making it suitable for advanced use cases.

- nslookup (Name Server Lookup):
- A simpler, user-friendly DNS query tool.
- Best suited for quick lookups of domain-to-IP mappings or vice versa.
- Provides concise, human-readable output, making it easier for casual users.


### logs monitoring
tail
less
more
dmesg

### streass and dd is the same
dd if=/path/to/image.iso of=/dev/sdX bs=4M status=progress

## files and folder
main files and fodlers are located by /etc folder


# difference between ps aux and top and htop
- ps aux: Displays a snapshot of all running processes with details like user, CPU/memory usage, and commands but is  static and does not update automatically.

- top: A dynamic, real-time view of system processes, refreshing automatically, showing CPU/memory usage, and allowing basic process management.

- htop: An enhanced, interactive version of top with a user-friendly interface, better visual representation, and easier process management (e.g., kill processes with keypress).

Option	Description
-d <delay>	Set the delay in tenths of a second between screen updates (e.g., -d 10 for 1 second).
-C	Start in monochrome mode (no colors).
-u <user>	Show only the processes owned by a specific user.
-p <pid>[,pid...]	Monitor specific processes by PID (comma-separated list).
-s <column>	Sort the processes by a specific column (e.g., -s cpu).
-t	Show processes in a tree view.
--tree	Same as -t, shows the process hierarchy as a tree.
-h or --help	Display help information for htop.
--version	Display the version of htop.

# Difference between ifconfig and ip addr and ip a
- ifconfig: Legacy command to display or configure network interfaces; it’s deprecated and lacks support for modern features.
- ip a: Shortcut for ip addr, part of the newer iproute2 suite, providing more detailed and flexible network interface information.
- ip addr: Full version of ip a, offering the same functionality with modern support for advanced networking features (e.g., IPv6).

# Host is exactly doing
The host command is used to perform DNS lookups, converting domain names into IP addresses or querying specific DNS records (e.g., A, MX, TXT). It provides information about domain names and IP address associations, making it useful for network troubleshooting.

# scp -i /c/Users/rajnages/Downloads/server.ppk Linux-Master ubuntu@<ip_address>:/home/ubuntu
# scp: Simple and secure for individual files.
# rsync: More efficient, especially for large or incremental transfers.
# sftp: Interactive mode for secure file transfer over SSH.
# ftp: Used for non-SSH connections, but less secure.
# scp -r -i local_pem_file <local_file> ubuntu@<ip_address>/home/ubuntu
# sftp -i file.pem ubuntu@<ip_address>
  get -r <remote file> <localfilepath>
  put -r <remote file> <localfilepath>