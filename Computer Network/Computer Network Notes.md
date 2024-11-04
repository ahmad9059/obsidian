## Computer Network
A **computer network** is a system that connects multiple computers and devices to share resources, data, and applications. Networks allow for communication between devices, and they’re fundamental to both small-scale setups (like local area networks in offices) and large-scale systems (like the internet).
### 1. Major Components of a Computer Network are:

- **NIC(Network Interface Card) :**  network interface card is a piece of hardware that allows computers to communicate with other devices on a network. It can also be called an Ethernet card, LAN card, or network adaptor. There are two types of NIC.
1. *Wired NIC:* The Wired NIC is present inside the motherboard. Cables and connectors are used with wired NIC to transfer data.
2. *Wireless NIC:* The wireless NIC contains the antenna to obtain the connection over the wireless network. For example, laptop computer contains the wireless NIC.
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
### 5. Computer Network Types
A computer network is a group of interconnected computers that allows them to communicate with each other and share resources, data, and applications. Computer networks can be categorized by their size and geographical scope, primarily into four types:

1. *LAN(Local Area Network)*
2. *MAN(Metropolitan Area Network)*
3. *WAN(Wide Area Network)*
4. *PAN(Personal Area Network)*
###### LAN(Local Area Network):
Local Area Network is a group of computers connected to each other in a small area such as building, office. LAN is used for connecting two or more personal computers through a communication medium such as twisted pair, coaxial cable, etc. It is less costly as it is built with inexpensive hardware such as hubs, network adapters, and Ethernet cables. The data is transferred at an extremely faster rate in Local Area Network. Local Area Network provides higher security.
###### PAN(Personal Area Network):
Personal Area Network is a network arranged within an individual person, typically within a range of 10 meters. Personal Area Network is used for connecting the computer devices of personal use is known as Personal Area Network. Thomas Zimmerman was the first research scientist to bring the idea of the Personal Area Network. Personal Area Network covers an area of 30 feet. Personal computer devices that are used to develop the personal area network are the laptop, mobile phones, media player and play stations.

###### MAN(Metropolitan Area Network):
A metropolitan area network is a network that covers a larger geographic area by interconnecting a different LAN to form a larger network.
Government agencies use MAN to connect to the citizens and private industries. In MAN, various LANs are connected to each other through a telephone exchange line. The most widely used protocols in MAN are RS-232, Frame Relay, ATM, ISDN, OC-3, ADSL, etc. It has a higher range than Local Area Network(LAN).
###### WAN(Wide Area Network):
A Wide Area Network is a network that extends over a large geographical area such as states or countries. A Wide Area Network is quite bigger network than the LAN. A Wide Area Network is not limited to a single location, but it spans over a large geographical area through a telephone line, fibre optic cable or satellite links. The internet is one of the biggest WAN in the world. A Wide Area Network is widely used in the field of Business, government, and education.

| **Basis**               | **PAN (Personal Area Network)**                                | **LAN (Local Area Network)**                                  | **MAN (Metropolitan Area Network)**                          | **WAN (Wide Area Network)**                                  |
|-------------------------|----------------------------------------------------------------|---------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------|
| **Geographic Span**     | Operates within a few meters, typically in a single room or small area (e.g., around a person). | Operates in small areas, like within a building or campus.    | Covers larger areas, such as a city.                         | Covers vast areas, such as a country or continent.           |
| **Ownership**           | Owned and controlled by an individual.                         | Usually privately owned by a single organization.             | Can be privately or publicly owned.                          | Typically not owned by a single organization; managed by telecom companies. |
| **Transmission Speed**  | Generally low; suitable for short-range communication.         | Generally high-speed due to short distances and dedicated infrastructure. | Moderate speed; often depends on the network setup and distance. | Lower transmission speed due to long-distance connections and diverse infrastructures. |
| **Propagation Delay**   | Minimal delay due to the short distances involved.             | Short propagation delay due to the limited distance.          | Moderate propagation delay due to wider geographic spread.    | Higher propagation delay due to vast distances and diverse link types. |
| **Congestion**          | Minimal congestion as it's limited to personal devices.        | Minimal congestion due to limited scope and control over the network. | Moderate congestion, often depending on urban traffic density. | Higher congestion levels due to shared, large-scale use.     |
| **Design & Maintenance** | Simple to design and maintain, with limited setup required.   | Easier design and maintenance; requires limited resources.    | More complex to design and maintain than LAN.                | Complex to design and maintain; often requires specialized skills and resources. |
| **Fault Tolerance**     | Generally high fault tolerance due to limited devices.         | Higher fault tolerance; issues are easier to isolate and resolve. | Lower fault tolerance than LAN, depending on infrastructure. | Lower fault tolerance, as failures can affect extensive regions. |

### 6. Network Topologies
Topology defines the structure of the network of how all the components are interconnected to each other. There are two types of topology: physical and logical topology.

#### Types of Network Topology
1. *Bus Topology*
2. *Ring Topology*
3. *Star Topology*
4. *Tree Topology*
5. *Mesh Topology*
6. *Hybrid Topology*
##### Bus Topology:
In a bus topology, all nodes are connected to a single communication line, often a coaxial or twisted-pair cable, that runs through the network. Each device on the network taps into this central bus.
![[Pasted image 20241105003958.png]]
##### Ring Topology
In a ring topology, each node is connected to exactly two other nodes, forming a circular path for signals to travel.
![[Pasted image 20241105004006.png]]
##### Star Topology
In a star topology, all nodes are connected to a central hub or switch. The hub acts as a repeater, managing data transmission between devices.
![[Pasted image 20241105004024.png]]
##### Tree Topology
Tree topology combines characteristics of both star and bus topologies. It has a hierarchical structure with root nodes that branch out to form a tree-like structure.
![[Pasted image 20241105004041.png]]
##### Mesh Topology
In a mesh topology, every node is connected to every other node, either directly or through intermediary nodes, creating multiple paths for data.
![[Pasted image 20241105004051.png]]
##### Hybrid Topology
A hybrid topology is a combination of two or more different types of topologies, chosen based on specific network needs.
![[Pasted image 20241105004058.png]]

