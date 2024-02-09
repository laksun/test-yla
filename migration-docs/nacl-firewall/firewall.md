Creating a firewall request table is a common practice in network management, ensuring that access controls are clearly documented before implementing changes in the firewall to allow or block traffic. Here is an example of a simple firewall request table format that includes the necessary details like source, destination, ports, protocols, and reasons for the request:

| Request ID | Source IP/Network        | Destination IP/Network   | Ports        | Protocol | Reason for Request                                |
|------------|--------------------------|--------------------------|--------------|----------|---------------------------------------------------|
| 001        | 10.1.2.0/24              | 192.168.5.10             | 443          | TCP      | Secure web access to the internal application    |
| 002        | 172.16.4.100             | 10.2.3.0/24              | 80, 443      | TCP      | Web and secure web access for reporting tool     |
| 003        | 192.168.1.0/24           | 172.20.4.20              | 22           | TCP      | SSH access for system administration             |
| 004        | 10.5.6.7                 | 8.8.8.8                  | 53           | UDP      | DNS resolution from internal server to Google DNS|
| 005        | 172.16.0.0/16            | 192.168.10.50            | 3389         | TCP      | Remote desktop access for IT support team        |
| 006        | 10.1.2.5                 | 10.8.9.10                | 21, 20       | TCP      | FTP access for file transfer between servers     |
| 007        | Any                      | 10.10.10.0/24            | 123          | UDP      | NTP synchronization for all network devices      |

This table serves as a documentation tool that helps network administrators and security teams review, approve, and implement firewall rules efficiently. Each request includes:

- **Request ID**: A unique identifier for each request to track and manage firewall changes.
- **Source IP/Network**: The IP address or network range that initiates the traffic.
- **Destination IP/Network**: The IP address or network range that receives the traffic.
- **Ports**: The specific port numbers required for the application or service to communicate.
- **Protocol**: The transport layer protocol used for the communication (e.g., TCP, UDP).
- **Reason for Request**: A brief explanation of why the access is needed, providing context for the request which aids in the decision-making process.

This format can be adapted or expanded based on the organization's specific requirements, including adding columns for additional details such as requestor name, date requested, approval status, and implementation date.