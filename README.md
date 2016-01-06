# Search-Chain-in-Syslog
Script which is looking for a chain in log directory

So exhausted when my sys admin came to me, and ask me : I've got some packets DROP by your firewall. Could you check if my server is allowed ?
... So I code a program which is gonna check quickly in my rsyslog server of course in real time. 

My script is made for this kind of path /data/log/res-f-01-01-2015/*.log or *.gz 
But you're free to change and adap

I used "zcat -f"  as you know it can read both *.log and *.gz file. 

I've set as well an arg for a quick search : ./lycos.sh 10.0.0.1 will looking for firewall logs with the current day. 

Enjoy
