# Wisec 

## Overview
This tool automates various WiFi penetration testing tasks, making it easier to identify vulnerabilities in wireless networks.

![](WiSec.png)

## Features
- **Network Scanning**: Automatically detects nearby WiFi networks.
- **Deauthentication Attacks**: Sends deauth packets to disconnect clients.
- **Handshake Capture**: Captures WPA/WPA2 handshakes for password cracking.
- **Evil Twin Attack**: Creates a fake access point to trick users.
- **Automated Wordlist Attack**: Uses a dictionary to attempt password cracking.
- and others...

## Requirements
- Linux-based OS (Kali Linux recommended)
- Aircrack-ng suite
- Wireless network adapter with monitor mode support

## Installation
```sh
# Clone the repository
git clone https://github.com/j4ckrisz/WiSec.git
cd WiSec/
```

## Usage
### Scan for WiFi Networks
```sh
sudo ./WiSec.sh -n <wireless-interface>
```

## Legal Disclaimer
This tool is intended for educational and authorized security testing purposes only. Unauthorized use is illegal.

## Contribution
Feel free to submit issues and pull requests to improve the tool.

## License
MIT License
