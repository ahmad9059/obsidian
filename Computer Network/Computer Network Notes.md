## Computer Network
A **computer network** is a system that connects multiple computers and devices to share resources, data, and applications. Networks allow for communication between devices, and they’re fundamental to both small-scale setups (like local area networks in offices) and large-scale systems (like the internet).
### 1. Major Components of a Computer Network are:

- **NIC(Network Interface Card) :**  network interface card is a piece of hardware that allows computers to communicate with other devices on a network. It can also be called an Ethernet card, LAN card, or network adaptor.
- ![[client-server-model.png]]

- **Hub**: A hub is a basic networking device that connects multiple computers within a network. When one computer sends data, the hub receives it and broadcasts it to all other connected devices, regardless of the intended receiver. Hubs operate at the physical layer (Layer 1) of the OSI model and are sometimes referred to as "repeaters" because they amplify the signal to ensure it reaches all connected devices.
- ![[Pasted image 20241104155523.png]]
- 
- **Switch**: A switch is a network device that connects multiple devices and directs data only to the intended receiver using MAC addresses, enhancing efficiency and reducing network congestion. It operates primarily at the data link layer (Layer 2) of the OSI model.
- ![[Pasted image 20241104155710.png]]
- 
- **Cable**: Cable is a transmission medium used to carry communication signals. There are three main types of cables:
1.  *Twisted Pair Cable*: This cable consists of pairs of twisted wires and is commonly used for Ethernet networks. It can support data transmission speeds up to 1 Gbps or more, depending on the type.
2.  *Coaxial Cable*: Coaxial cable resembles TV cable and is more expensive than twisted pair cable. It provides higher transmission speeds and better shielding from interference.
3.  *Fiber Optic Cable*: This high-speed cable transmits data using light signals, offering much faster transmission speeds than other cables. Although more expensive, it’s often used in high-capacity networks, such as those operated by governments and large organizations. 

- **Router**: A router is a network device that connects multiple networks and directs data packets between them. It determines the best path for data to travel from the source to the destination by analyzing IP addresses, ensuring efficient communication. Routers operate at the network layer (Layer 3) of the OSI model and are essential for enabling internet connectivity in homes and businesses.
- ![[Pasted image 20241104160113.png]]

- **Modem** (modulator-demodulator) is a device that converts digital data from a computer into an analog signal for transmission over telephone lines or cable systems and vice versa. It enables internet connectivity by modulating digital signals for transmission and demodulating incoming signals back into digital form. Modems can be integrated with routers to provide both internet access and network connectivity.
- ![[Pasted image 20241104160230.png]]
### 2. Uses Of Computer Network
1. Resource Sharing
2. Client-Server Model
3. Communication Medium
4. E-Commerce
### 3. Features Of Computer Network
1. Communication Speed
2. File Sharing 
3. Backup and Roll Back
4. Hardware and Software Sharing
5. Security
6. Scalability
7. Reliability
### 4. Computer Architecture
Computer Network Architecture is defined as the physical and logical design of the software, hardware, protocols, and transmission medium. Simply we can say that how computers are organized and how tasks are allocated to the computer.
###### Client-Server Architecture
In **client-server architecture**, the network is divided into two main roles: clients and servers. Clients request services or resources, while servers provide them. This model centralizes resources and management, allowing for efficient data handling and security, making it ideal for applications like web services and databases.
![[Pasted image 20241104154849.png]]
###### Peer-to-Peer (P2P) Architecture
In **peer-to-peer (P2P) architecture**, each device (peer) can act as both a client and a server. Peers share resources directly with each other without a centralized server. This decentralized approach enhances scalability and resource sharing, commonly used in file-sharing networks and collaborative applications.
![[Pasted image 20241104154858.png]]

## Difference b/w Client-Server vs Peer-to-Peer

| **Aspect**             | **Client-Server**                                  | **Peer-to-Peer**                                             |
| ---------------------- | -------------------------------------------------- | ------------------------------------------------------------ |
| **Basic**              | Multiple clients connect to a central server.      | Each computer acts as a server or client.                    |
| **Service**            | Clients request services, and the server responds. | Each computer can request or provide services.               |
| **Focus**              | Emphasis on information sharing.                   | Focus on connectivity.                                       |
| **Data**               | Stored and managed centrally.                      | Each computer manages its own data.                          |
| **Traffic Bottleneck** | Multiple client requests may cause bottlenecks.    | Less likely, as services come from multiple peers.           |
| **Expense**            | Setup can be expensive.                            | Setup costs are lower.                                       |
| **Scalability**        | Adding a new client is easy.                       | Network may suffer with more computers.                      |
| **Usage**              | Common in enterprise networks.                     | Found in homes, small businesses, and file-sharing networks. |
