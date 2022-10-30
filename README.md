# wificraK

A tool created for the automation of (WPA/WPA2 - PSK) attacks. This tool is designed to obtain passwords.

This tool has been tested in:

    - Kali Linux
    - Parrot OS

It will probably also work on Ubuntu and other linux distros without problems.

The first attack mode is the most classic wifi attack, consists of capturing the password using **de-auth** packets and then cracking the password using aircrack-ng. The **PMKID** attack, takes advantage of routers that have roaming feature enabled or present are vulnerable, so we dont need clients connected to the **Access Point**.

## How to use it?

Just execute the tool like this:

```bash

┌─[root@parrot]─[~/Desktop]
└──╼ $ ./wificracK.sh


``` 
