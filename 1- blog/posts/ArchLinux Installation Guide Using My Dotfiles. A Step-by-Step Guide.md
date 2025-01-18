---
title: ArchLinux Installation Guide Using My Dotfiles. A Step-by-Step Guide
draft: false
date: 2025-01-15
description: ArchLinux Installation Guide Using My Dotfiles. A Step-by-Step Guide
categories:
  - tech 👨🏻‍💻
tags:
  - tech
  - "#arch"
  - linux
Author: Ahmad Hassan
---

I recently uploaded a video showcasing my Arch Linux (btw) setup just for fun, and to my surprise, it went viral within the Linux community! Since then, I’ve received numerous messages asking about the installation process. Although I wanted to make a detailed video tutorial, my laptop's older specs make it difficult to handle both recording and installation simultaneously. So, I’ve decided to write this article to guide you through the installation process using my dotfiles and the installation script from Ja.Kool.It. Below, you’ll find a step-by-step guide to get started.

## 1. Install ArchLinux With Minimal Configuration

- ### Make a Bootable USB

1. First Download ArchLinux ISO from official site : [Download Link](https://archlinux.org/download/)
2. Second Download for Your Operating System [Ventoy](https://github.com/ventoy/Ventoy/releases)
3. Extract the Ventoy Folder and Write it on your USB.
4. Copy ArchLinux ISO into USB.
if you Don't Know how to use ventoy read this [article](https://itsfoss.com/use-ventoy/) 

- ### Boot From USB

1. Restart Your Computer and Press the Boot Menu key according to your Computer.
2. In Boot Menu Select Your USB 
3. It will open ventoy and show you all ISO file available in USB
4. Select the ArchLinux ISO and Open in Normal Mode.

- ### Connect to Internet

1. For wired internet you don't need to do anyting
2. For wireless Command Given Below

```bash
$ iwctl

[iwd]#
```

From the [iwd]# prompt you will need figure out your device name. Then, assuming you know the SSID (service set identifier) of your wireless network, go ahead and connect like so:

```bash
[iwd]# device list

# You should see something like this:
#
#                            Devices
# -------------------------------------------------------------
#   Name          Address          Powered    Adapter    Mode
# -------------------------------------------------------------
#   wlan0         ...              on         ...        ...

[iwd]# station YOURDEVICE connect YOURSSID
```

For a secured wireless network, you will be prompted for the WiFi password. Once you enter the correct password, you’ll be off to the races!

- ### Making Partition Ready for Archinstall
for that first we will use the `cfdisk` to make partitions and then `mfks` for formatting that
```bash
$ lsblk
```

if will show your all partitions and there information

![](Pasted%20image%2020250115122943.png)

```bash
$ cfdisk
```

it show you all of your information about your drives

![](Pasted%20image%2020250115121651.png)

You have to make 3 partitions
1. EFI boot Partition - Type Must be EFI System
2. Swap Partition - Type Must be Swap Partition
3. Root Partition - Type Must be Linux File System

after Make Partitions write and exit the cfdisk and Run these commands and just change paths

```bash
$ mkfs.ext4 /path/to/root/partition
$ mfks.vfat -F 32 /path/to/efi/partition
$ mkswap /path/to/swap/partition
```

Next, we’ll mount the partitions:

```bash
$ mkdir /mnt/archinstall
$ mount /path/to/root/partition /mnt/archinstall
$ mkdir /mnt/archinstall/boot
$ mount /path/to/efi/partition/ /mnt/archinstall/boot
$ swapon /path/to/swap/partition
```

now we are done with partitioning the partitions 

- ### Update System and Run ArchInstall

```bash
$ pacman -Sy archinstall archlinux-keyring

$ archinstall
```

- ### The Actual Installation Process

After running the `archinstall` command it will show you something like this.

![](Pasted%20image%2020250115123422.png)

1. **Locales :** In locales select your *keyboard layout*, *locale language*, and *endcoding*
2. **Mirrors :** In Mirrors select best mirror region according to your location
3. **Disk Configuration :** ->Partitioning->Pre-mounted Configuration-> Enter `/mnt/archinstall`
4. **Swap :** Enable it if you made the swap partition
5. **Boot Loader :** Select which boot loader do you need like `grub`, `system-d-boot` 
6. **Unified kernel images :** Enable if you want
7. **Hostname :** Select your hostname what you want
8. **Root Password :** Enter Your Root Password
9. **User account :** make a account for normal user
10. **Profile :** Select->Type->Minimal
11. **Audio :** Select->Pipewire
12. **Kernels :** Select one or many according your need. if don't know don't touch it
13. **Network configuration :** Select->Use NetworkManager
14. **Additional packages :** git vim
15. **Optional repositories :** Enable additional repos if you want like `multilib`
16. **Timezone :** Select timezone according to your location
17. **Automatic time sync (NTP) :** Leave Enabled

after that just press the `install` and wait for installation to be finished

![](Pasted%20image%2020250115130012.png)

Congratulations🎉!! You have successfully installed the ArchLinux and now you can say that *I use Arch btw*
