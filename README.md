# WiFi Pentesting Automation Tool

## Overview
WiSec is an advanced WiFi penetration testing automation tool designed to simplify and enhance security assessments of wireless networks.

![WiSec Interface](WiSec.png)

## Features
- **Handshake Capture**: Captures WPA/WPA2 handshakes for password cracking.
- **Passive Handshake Capture**: Listens for handshake packets without active deauthentication.
- **PMKID Attack**: Extracts PMKID from routers vulnerable to this attack.
- **Offline Cracking**: Uses wordlists and cracking techniques to recover passwords.
- **Constant Deauth Attack**: Jamming attack that disconnects clients.
- **Beacon Flood Attack**: Generates fake APs to flood WiFi networks.
- **WPS Brute-force & Null Pin Attack**: Attempts to brute-force WPS-enabled networks.
- **Pixie Dust Attack**: Exploits WPS vulnerabilities to retrieve the key.
- **Caffe Latte Attack**: Targets WEP-based networks.
- **Authentication DoS**: Overwhelms networks with authentication requests.
- **ChopChop Attack**: Decrypts WEP packets by analyzing packet fragments.
- **MAC Changer**: Spoofs MAC address for anonymity.
- **Evil Twin Attack**: Creates a fake AP to intercept credentials.

## Requirements
- Linux-based OS (Kali Linux recommended)
- Aircrack-ng suite
- Wireless network adapter with monitor mode support

## Installation
```sh
# Clone the repository
git clone https://github.com/j4ckrisz/wisec.git
cd wisec
```

## Usage
### Launch WiSec
```sh
sudo ./WiSec.sh -n <wireless-interface>
```

## Legal Disclaimer
This tool is intended for educational and authorized security testing purposes only. Unauthorized use is illegal.

## Contribution
Feel free to submit issues and pull requests to improve the tool.

## License
MIT License
