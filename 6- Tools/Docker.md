Docker is an open-source platform that enables developers to build, package, and distribute applications in a standardized way using containerization. It simplifies application deployment by ensuring consistency across different environments.

## Containerization

Containerization is a lightweight virtualization method where applications and their dependencies are bundled together in isolated environments called containers. These containers share the same OS kernel but run independently, ensuring consistency and portability.

## What Problem Does Docker Solve?

Docker solves the **"works on my machine"** problem by ensuring applications run the same across development, testing, and production environments. It eliminates dependency conflicts, simplifies deployment, improves resource efficiency, and enhances scalability.

## Docker VS Virtualization

|Feature|Docker (Containers)|Virtualization (VMs)|
|---|---|---|
|**Isolation Level**|Process-level isolation (containers share OS kernel).|Full OS-level isolation (each VM runs its own OS).|
|**Performance**|Lightweight, faster startup, less resource-intensive.|Heavier, slower startup, consumes more resources.|
|**OS Dependency**|Containers share the host OS kernel.|Each VM has its own OS, independent of the host.|
|**Resource Usage**|Uses less CPU, RAM, and storage.|Requires more CPU, RAM, and storage.|
|**Boot Time**|Starts in seconds.|Takes minutes to boot.|
|**Use Case**|Ideal for microservices, cloud-native apps, and CI/CD.|Suitable for running different OS environments on the same hardware.|
|**Flexibility**|Can only run apps compatible with the host OS kernel.|Can run any OS (Windows, Linux, etc.) on the same machine.|

- **Use Docker (Containers)** when you need lightweight, fast, and scalable environments for applications.
- **Use Virtual Machines (VMs)** when you need to run different operating systems with complete isolation.

![](6-%20Tools/assets/img.png)


## Install Docker in ArchLinux(BTW)

To install Docker on Arch Linux, follow these steps:

1. **Install Docker:**

```bash
sudo pacman -S docker
```

2. **Enable and Start Docker:**

```bash
sudo systemctl enable --now docker
```

3. **Add User to Docker Group (Optional, for non-root usage):**

```bash
sudo usermod -aG docker $USER
newgrp docker
```

4. **Verify Installation:**

```bash
docker --version
docker run hello-world
```


