# Blackeye
Multi-Phishing Tool
Welcome to Multi-Phishing Tool v1.0, a customizable, multi-site phishing simulation tool inspired by frameworks like Zphisher.
This tool is designed strictly for ethical hacking courses, penetration testing labs, and cybersecurity awareness training.

🚀 Features
🎯 Multi-option phishing targets (Instagram, Google)

🌐 Live phishing links via Ngrok or Cloudflared tunnels

🖥️ Real-time credential capture and monitoring

🎨 Terminal-based colorful interface

🔁 Auto-restarting loop and multi-session handling

⚙️ Dependency auto-installer

📂 Folder Structure
text
Copy
Edit
PhishingTool/
├── phishingtool.sh           # Main bash script
├── instagram/                # Instagram phishing page files
│   ├── index.html
│   ├── login.php
│   └── credentials.txt
├── google/                   # Google phishing page files
│   ├── index.html
│   ├── login.php
│   └── credentials.txt
├── README.md                 # Project guide
└── ngrok                     # Ngrok executable (auto-downloads if missing)
⚙️ Installation
📥 Clone the Repository
bash
Copy
Edit
git clone https://github.com/yourusername/multi-phishing-tool.git
cd multi-phishing-tool
chmod +x phishingtool.sh
🖥️ Usage
Run the tool:

bash
Copy
Edit
./phishingtool.sh

Follow the on-screen menu to:

Select phishing targets

Start tunnels with Ngrok or Cloudflared

Monitor captured credentials in real-time

💡 Requirements
Linux-based system (Kali, Ubuntu, Parrot OS)

Apache2

PHP

Curl

Unzip

Ngrok (auto-installed if missing)

Cloudflared (optional)

🔒 Disclaimer
This tool is for educational purposes only.

Unauthorized phishing is illegal.

Only use this tool in authorized lab environments with proper consent.

The creator is not responsible for any misuse or illegal activity.

✅ Credits
Inspired by tools like Zphisher, built from scratch to support ethical hacking education and personal skill development.
