**Task 1: Understand OSI & TCP/IP Models**

Learn about the OSI and TCP/IP models, including their layers and purposes.

### OSI Model Layers and Examples:

**1. Application Layer (Layer 7)**
- Provides protocols that allow apps to transmit data.
- Examples: HTTP, HTTPS, FTP, SMTP, DNS.
- **Example:** When you visit a website, your browser uses HTTP/HTTPS to communicate with the web server.

**2. Presentation Layer (Layer 6)**
- Prepares data for the application layer.
- Handles encryption, compression, and formatting.
- **Example:** SSL/TLS encrypts data for secure communication.

**3. Session Layer (Layer 5)**
- Manages and maintains communication sessions.
- **Example:** Online banking keeps your session active until you log out.

**4. Transport Layer (Layer 4)**
- Ensures reliable data transfer using TCP or UDP.
- **Example:** TCP is used for downloading a file to ensure all parts arrive correctly.

**5. Network Layer (Layer 3)**
- Determines the best route for data.
- Uses IP addresses for delivery.
- **Example:** When sending an email, IP ensures it reaches the right recipient.

**6. Data Link Layer (Layer 2)**
- Manages data transfer between two directly connected devices.
- Uses MAC addresses.
- **Example:** Your Wi-Fi router sends data to your laptop using MAC addressing.

**7. Physical Layer (Layer 1)**
- Handles raw data transmission via physical media.
- **Example:** Ethernet cables and Wi-Fi signals transmit data.

### OSI Model Protocols and Data Units:
| OSI Layer | Protocol Examples | Data Unit |
|-----------|------------------|-----------|
| Physical (L1) | Ethernet, Wi-Fi | Bits |
| Data Link (L2) | MAC, PPP | Frames |
| Network (L3) | IP, ICMP, ARP | Packets |
| Transport (L4) | TCP, UDP | Segments |
| Session (L5) | RPC, PPTP | Data |
| Presentation (L6) | SSL/TLS, JPEG | Data |
| Application (L7) | HTTP, FTP, DNS | Data |

---

**Task 2: Protocols and Ports for DevOps**
- Learn about essential protocols and their port numbers used in DevOps.
- Examples:
  - **SSH (Port 22):** Secure access to servers.
  - **HTTP (Port 80) & HTTPS (Port 443):** Web traffic.
  - **FTP (Port 21):** File transfers.
  - **DNS (Port 53):** Resolving domain names.
  
---

**Task 3: AWS EC2 and Security Groups**
### Steps to Create a Security Group:
1. Open the **Amazon VPC console** and click **Security Groups**.
2. Click **Create security group**.
3. Provide a **name and description**, and select a **VPC ID**.
4. Add security group rules (optional).
5. Click **Create security group**.
6. Your security group is successfully created!

---

**Task 4: Hands-On with Networking Commands**
### Useful Networking Commands:

**1. ping** – Check if a host is reachable.
- Example: `ping google.com`

**2. traceroute / tracert** – Show the path packets take.
- Example: `traceroute google.com`

**3. netstat** – Show active network connections.
- Example: `netstat -tulpn`

**4. curl** – Fetch data from a URL.
- Example: `curl https://example.com`

**5. dig / nslookup** – Query DNS records.
- Example (Linux): `dig google.com`
- Example (Windows): `nslookup google.com`


