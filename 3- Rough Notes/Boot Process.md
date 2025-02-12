
## Step 1 - BIOS/UEFI Initialization

When the system is powered on, the BIOS (Basic Input/Output System) or UEFI (Unified Extensible Firmware Interface) firmware is loaded from non-volatile memory. It then executes the Power-On Self-Test (POST).

## Step 2 - Hardware Detection

BIOS/UEFI detects the connected devices, including CPU, RAM, and storage drives.

## Step 3 - Boot Device Selection

The system selects a boot device to load the operating system from. This can be a hard drive, network server, or CD-ROM.

## Step 4 - Boot Loader Execution

BIOS/UEFI runs the boot loader (e.g., GRUB), which provides a menu to choose the OS or kernel functions.

## Step 5 - Kernel Initialization

After the kernel is loaded, the system switches to user space. The kernel starts `systemd` as the first user-space process, which manages system processes and services, probes hardware, mounts filesystems, and initializes the desktop environment.

## Step 6 - systemd Activation

`systemd` activates the default target unit when the system boots. Other system units required for the boot process are executed as well.

## Step 7 - Startup Scripts Execution

The system runs a set of startup scripts to configure the environment.

## Step 8 - User Login

The login window is presented to the user, indicating that the system is now ready for use.

#### Diagram

![](3-%20Rough%20Notes/assets/calcul.png)