# Search-Chain-in-Syslog
Script which is looking for a chain in log directory

So exhausted when my sys admin came to me, and ask me : I've got some packets DROP by your firewall. Could you check if my server is allowed ?
... So I code a program which is gonna check quickly in my rsyslog server of course in real time. 

My script is made for this kind of path /data/log/res-f-01-01-2015/*.log or *.gz  (But of course you're free to change and adap) and ask you which item you are looking for plus the day when happened. 

I used "zcat -f"  as you know it can read both *.log and *.gz files. 

Manual : 
- Just execute the script : ./lycos.sh 
- I've set as well an arg for a quick search : ./lycos.sh 10.0.0.1 will looking for firewall logs with the current day. 
  - tips : 

PIC :
![script_fw2](https://cloud.githubusercontent.com/assets/9777077/12153807/3c15a2d6-b4bc-11e5-8dd6-867414ef54ff.png)
![error2](https://cloud.githubusercontent.com/assets/9777077/12153806/390f7b48-b4bc-11e5-8a77-2229a2ff0f73.png)


Enjoy
