![CheckConn Logo](https://github.com/KD5FMU/Check-Connection-Script-File/blob/main/CheckConn1%20.png)

# Check Connection Script File for AllStarLink Version 3

This is a script file for ASL 3 to check for a specific node connection and if it is not present the server will re-connect to it.

As I have said before, I like to put all of my script files in the /etc/asterisk/local folder, But ASL3 does not come with that folder by default so you can create the directory by running this command:

```
sudo mkdir /etc/asterisk/local
```

Once the folder has been created we need to go to it by using this command:
```
cd /etc/asterisk/local
```


To get the script file downloaded onto your node just use this command:
```
sudo wget https://raw.githubusercontent.com/KD5FMU/Check-Connection-Script-File/refs/heads/main/check_connection.sh
```

Once the file has been downloaded we need to make a few customizations. For example we need to edit in your node number and the target node number you want to stay connected to. You can so that by using the following command:
```
sudo nano check_connection.sh
```

Remove the X's on the line that starts with "MY_NODE" and replace them with your node number. Then remove the X's on the line beginning with TARGET_NODE and replace them with the node number you wish to stay connected to. Then save the file (if you are using nano then hit CTL + X and then Y to save and enter to exit). 

Now the script file needs to be made executable, this can be done with this command:
```
sudo chmod +x check_connection.sh
```

Now we need to set a crontab job so that your node can periodically run the script file and check to make sure your node is still connected. I like to set mine for every 2 minuets and this can be achieved with this crontab entery. To open this crontab editor go to the command like and execute this command:
```
sudo crontab -e
```

Once in the crontab you can enter this line and then next available space in the file:
```
*/2 * * * * /etc/asterisk/local/check_connection.sh >/dev/null 2>&1
```


Once it is entered you can hit CTL + X then Y to save and enter exit. 

You can adjust this timing as you wish. You can use the website of https://crontab.guru/ for more details on your crontab entries.

Use this video for reference. 

https://youtu.be/yv-3tZggcGU?si=YyIE37h2PTFEM_Bv

It is my hope that you get a good use from this script file. 

73 DE KD5FMU

"Ham On Y'all!" 
