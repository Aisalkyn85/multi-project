1. simple script
2. echo cmd without new line
3. string concatenation with echo
4. string with continuation charector
4. echo with tab
5. echo with newline
7. shell with debug mode -x
8. print ' and "
9. create a file with script
10. override a file and append a file
11. comments & multi line comment
12. variable and quotes combinations
13. home, user, host, and print $HOME
14. create as sh file and make it executable
15. arthimatic ops, incremennt and decrement var=$((var+=1))
16. same with expr
17. variables, special variables $0 $1 $2 S@ S* S#, Env variables, shell variables,
18. opeartors + - * / %, = == !=, -eq -gt -lt -ge -le -ne, ! -o -a. 
19. if condition, while, until, for, switch case, loop control
20. functions

#!/bin/bash

echo "Example using a while loop:"
counter_while=0

while [ $counter_while -lt 5 ]; do
    echo "While loop: Counter is $counter_while"
    ((counter_while++))
done


echo -e "\nExample using an until loop:"
counter_until=0

until [ $counter_until -ge 5 ]; do
    echo "Until loop: Counter is $counter_until"
    ((counter_until++))
done


Check if the current user is root and print a message accordingly:
#!/bin/bash
if [ $USERID -eq 0 ]; then
  echo "The current user is root"
else
  echo "The current user is not root"
fi


#!/bin/bash
i=1
while [ $i -lt 6 ]
do
  echo $i
  i=$((i+1))
done


#!/bin/bash
i=1
while [ $i -lt 6 ]
do
  echo $i
  if [ $i -eq 3 ]
  then
    break
  fi
  i=$((i+1))
done


#!/bin/bash
i=0
while [ $i -lt 6 ]
do
  i=$((i+1))
  if [ $i -eq 3 ]
  then
    continue
  fi
  echo $i
done


#!/bin/bash
echo "Choose an option: 1) Option A, 2) Option B, 3) Option C: "
read option
case $option in
  1) echo "You selected Option A"
  2) echo "You selected Option B"
  3) echo "You selected Option C"
esac


This script creates a backup of specified directories and compresses them.
#!/bin/bash
tar -czvf backup_$(date +"%Y%m%d").tar.gz /path/to/directory


This script rotates log files to prevent them from consuming too much disk space.
#!/bin/bash
mv /path/to/logfile /path/to/logfile_$(date +"%Y%m%d").log
touch /path/to/logfile


This script deletes files older than a certain number of days.
#!/bin/bash
find /path/to/files -type f -mtime +7 -exec rm {} \;


This script adds a new user with specified permissions.
#!/bin/bash
useradd -m -d /home/newuser -s /bin/bash newuser


This script checks if a website is reachable.
#!/bin/bash
if curl -s --head http://www.gamutgurus.com | grep "200 OK" > /dev/null; then
    echo "Website is up!"
else
    echo "Website is down!"
fi


This script generates a random password.
#!/bin/bash
echo "$(date +%s | sha256sum | base64 | head -c 16)"



This script calculates the size of a directory.
#!/bin/bash
du -sh /path/to/directory

This script takes a backup of a MySQL database.
#!/bin/bash
mysqldump -u username -p password dbname > backup.sql


This script updates a Docker Compose file with the latest version of services.
#!/bin/bash
sed -i 's/image: old_version/image: latest_version/' docker-compose.yml
docker-compose up -d

This script analyzes log files, extracts relevant information, and generates a report.
#!/bin/bash
grep "error" /var/log/app.log | awk '{print $4, $5, $9}' > error_report.txt


This script automatically cleans up old and unused resources to optimize system resources.
#!/bin/bash
docker system prune -a -f


This script copies SSH keys to multiple servers for passwordless login.

#!/bin/bash
ssh-copy-id user@server1
ssh-copy-id user@server2


ssh -i "serverkeys.pem" user@host-ip

rsync -avz -e "ssh -i /path/to/your/key.pem" /path/to/your/local/.next ec2-user@your-ec2-instance-ip:/path/to/remote/directory

