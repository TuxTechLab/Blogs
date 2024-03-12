# **Ports**

## **Introduction**

- Port number is a 16-bit numerical value that ranges from 0 to 65535. Well-known port (0-1023), registered port (1024-49151), and dynamic port is three types of port number space. (49152-65535).

- These ports can be opened and used by software applications and operating system services to send and receive data over networks (LAN or WAN) that employ certain protocols (eg TCP, UDP).

- To conclude, a port is a logical form to identify system activities or various network services used to create local or network-based communications.

- For example, we use 80 for HTTP-web-based plain-text surfing and 443 for HTTPS-web-based encrypted websites in our daily work.

---

## **What are the functions of ports?**

- When interacting over the Internet, TCP and UDP protocols make connections, recompile data packages after the transfer, and then deliver them to applications on the recipient’s device.

- For this handover to work, the operating system must install and open the gateway for the transfer.

- Each door has a unique code number. After transmission, the receiving system uses the port number to determine where the data should be sent. The port numbers of the sender and receiver are always included in the data packet.

- Ports are assigned sequential numbers from 0 to 65535. Some of these codes are standardized, meaning they are assigned to certain uses. Since code numbers are universally recognized and permanently assigned, these standard ports are also known as well-known ports.

- Registered ports are those that organizations or software developers have registered for their applications. Registration is handled by the Internet Assigned Numbers Authority (IANA). A diverse selection of dynamically assigned port numbers is also available. For example, when viewing websites, browsers use these ports. After that, the phone number is free again.

---

## **Why is it important to know these ports?**

- Any security researcher, bug bounty hunter, or anyone working with service configuration would benefit from this.

- Knowing how to do more thorough scans such as version detection or known vulnerabilities for ancient services that are still operating in the infrastructure, especially when using tools like Nmap, is handy when getting to know these protocols and services.

---

## **The most 50 significant ports are listed here:**

The following are some of the most common service names, transport protocol names, and port numbers used to differentiate between specific services that employ TCP, UDP, DCCP, and SCTP.

| **Port Number** | **Service Name** |**Protocol Name/ Transport protocol**| **Desctriptin** |
|----:|:----|:----|:----|
| `7` | Echo | TCP, UDP | Echo Service |
| `20` | FTP-data | TCP, SCTP | File Transfer Protocol data transfer |
| `21` | FTP | TCP, UDP, SCTP | File Transfer Protocol (FTP) control connection |
| `22` | SSH-SCP | TCP, UDP, SCTP |  Secure Shell, secure logins, file transfers (scp, sftp), and port forwarding |
| `23` | Telnet | TCP | Telnet protocol—unencrypted text communications |
| `25` | SMTP | TCP | Simple Mail Transfer Protocol, used for email routing between mail servers |
| `53` | DNS | TCP, UDP |  Domain Name System name resolver |
| `69` | TFTP | UDP | Trivial File Transfer Protocol |
| `80` | HTTP | TCP, UDP, SCTP | Hypertext Transfer Protocol (HTTP) uses TCP in versions 1.x and 2. HTTP/3 uses QUIC, a transport protocol on top of UDP |
| `88` | Kerberos | TCP, UDP | Network Authentication System, |
| `102` | Iso-trap | TCP | ISO Transport Service Access Point (TSAP) Class 0 protocol |
| `110` | POP3 | TCP | Post Office Protocol, version 3 (POP3) |
| `135` | Microsoft EMAP | TCP,UDP | Microsoft EPMAP (End Point Mapper), also known as DCE/RPC Locator service, used to remotely manage services including DHCP server, DNS server, and WINS. Also used by DCOM|
| `137` | NetBIOS-ns | TCP, UDP | NetBIOS Name Service, used for name registration and resolution |
| `139` | NetBIOS-ssn | TCP, UDP | NetBIOS Session Service |
| `143` | IMAP4 | TCP, UDP | Internet Message Access Protocol (IMAP), management of electronic mail messages on a server |
| `381` | HP Openview | TCP, UDP | HP data alarm manager |
| `388` | HP Openview | TCP, UDP | HP data performance collector |
| `443` | HTTP over SSL | TCP, UDP, SCTP | Hypertext Transfer Protocol Secure (HTTPS) uses TCP in versions 1.x and 2. HTTP/3 uses QUIC, a transport protocol on top of UDP. |
| `464` | Kerberos | TCP, UDP | Kerberos Change/Set password |
| `465` | SMTP over TLS/SSL, SSM | TCP | Authenticated SMTP over TLS/SSL (SMTPS), URL Rendezvous Directory for SSM (Cisco protocol) |
| `587` | SMTP | TCP | Email message submission |
| `593` | Microsoft DCOM | TCP, UDP | HTTP RPC Ep Map, Remote procedure call over Hypertext Transfer Protocol, often used by Distributed Component Object Model services and Microsoft Exchange Server |
| `636` | LDAP over TLS/SSL | TCP, UDP | Lightweight Directory Access Protocol over TLS/SSL |
| `691` | MS Exchange| TCP | MS Exchange Routing |
| `902` | VMware Server | unofficial | VMware ESXi |
|  `989` | FTP over SSL | TCP, UDP | FTPS Protocol (data), FTP over TLS/SSL |
|  `989` | FTP over SSL | TCP, UDP | FTPS Protocol (data), FTP over TLS/SSL |
|  `993` | IMAP4 over SSL | TCP | Internet Message Access Protocol over TLS/SSL (IMAPS) |
| `995` | POP3 over SSL | TCP, UDP | Post Office Protocol 3 over TLS/SSL |
| `1025` | Microsoft RPC | TCP | Microsoft operating systems tend to allocate one or more unsuspected, publicly exposed services (probably DCOM, but who knows) among the first handful of ports immediately above the end of the service port range (1024+). |
| `1194` | OpenVPN | TCP, UDP | OpenVPN |
| `1337` | WASTE | unofficial | WASTE Encrypted File Sharing Program |
| `1589` | Cisco VQP | TCP, UDP | Cisco VLAN Query Protocol (VQP) |
| `1725` | Stream | UDP | Valve Steam Client uses port 1725 |
| `2082` | cPanel | unofficial | cPanel default |
| `2083` | radsec, cPanel | TCP, UDP | cPanel default |
| `2483` | Oracle DB | TCP, UDP | Oracle database listening for insecure client connections to the listener, replaces port 1521 |
| `2484` | Oracle DB | TCP, UDP | Oracle database listening for SSL client connections to the listener |
| `2967` | Symantec AV | TCP, UDP | Symantec System Center agent (SSC-AGENT) |
| `3074` | XBOX Live | TCP, UDP | Xbox LIVE and Games for Windows – Live |
| `3306` | MySQL | TCP |  MySQL database system |
| `3724` | World of Warcraft | TCP, UDP | Blizzard games, Unofficial Club Penguin Disney online game for kids |
| `3389` | MS wbt-server | TCP | Microsoft Remote Desktop Protocol |
| `4664` | Google Desktop | unofficial | Google Desktop Search |
| `5432` | Postgres SQL | TCP | PostgreSQL database system |
| `5900` | RFB/VNC Server| TCP | virtual Network Computing (VNC) Remote Frame Buffer (RFB) protocol |
| `6665-6669` | IRC | TCP | Internet Relat Chat |
| `6881` | BitTorrent | unofficial | BitTorrent is part of the full range of ports used most often |
| `6970` | Quicktime | unofficial | QuickTime Streaming Server |
| `6999` | BitTorrent | unofficial | BitTorrent is part of the full range of ports used most often |
| `8086` | Kaspersky AV | TCP | Kaspersky AV Control Center |
| `8087` | Kaspersky | UDP | Kaspersky AV Control Center |
| `8222` | VMware Server | TCP, UDP | VMware Server Management User Interface (insecure Web interface). |
| `9100` | PDL | TCP | PDL Data Stream, used for printing to certain network printers. |
| `10000` | BackupExec | unofficial | Webmin, Web-based Unix/Linux system administration tool (default port) |
| `12345` | NetBus | unofficial | NetBus remote administration tool (often Trojan horse). |
| `27374` | Sub7 | unofficial | Sub7 default |
| `31337` | Back Orifice | unofficial | Back Orifice 2000 remote administration tools |

---

## **Miscellaneous**

- To read about VMware Port read in the website click on [**ports.esp.vmware.com**](https://ports.esp.vmware.com)
