<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> 📖 INSTALLATION & USAGE </h1>

---

## 🛠️ Prerequisites

Before proceeding with the installation, make sure you have the necessary applications configured on your Android device:

1. **Terminal Emulator:** Download and install **Termux** from [Termux.com](https://termux.com/) or [F-Droid](https://f-droid.org/). Do not use the version from the Google Play Store, as it is deprecated and no longer updated.
2. **Display Client:** To access the Linux graphical user interface (GUI), download one of the following display apps from the Play Store or F-Droid:
   * **VNC Viewer** (Standard remote desktop client)
   * **XServer XSDL** (X11 server for Android)
   * **Termux:X11** (Highly recommended for hardware acceleration and low-latency performance)

---

## 🚀 Quick Automated Installation

This single-line script automates the full process by installing required packages, verifying dependencies, and deploying the developer-recommended default Linux distribution.

Run the following command inside Termux:

```bash
. <(curl -Ls [https://bit.ly/udroid-installer](https://bit.ly/udroid-installer))
```

---

## 🏗️ Manual Installation (From Source)

If you prefer to build the environment or manage the underlying installation scripts directly from the source repository, execute the commands below:

```bash
# Update local repositories and install git
apt update && apt install git -y

# Clone the official Udroid File System Manager repository
git clone [https://github.com/RandomCoderOrg/fs-manager-udroid](https://github.com/RandomCoderOrg/fs-manager-udroid)
cd fs-manager-udroid

# Execute the local setup script
bash install.sh
```

### Selecting a Custom Suite
After executing the manual install script, you can query available distributions:
```bash
udroid --list
```
This displays a structured table containing the available OS suites and desktop variations (e.g., `jammy:xfce4`). To install a specific system from that list, run:
```bash
udroid install <suite_name>
```

---

## 🖥️ Management & Login Examples

Below are standard deployment and access workflows for some of the most popular desktop variations.

### Option A: XFCE4 Desktop (Lightweight & Fast)
```bash
# Install the XFCE4 distribution environment
udroid install jammy:xfce4

# Launch and log into the XFCE4 desktop session
udroid login jammy:xfce4
```

### Option B: GNOME Desktop (Modern & Feature-Rich)
```bash
# Install the GNOME distribution environment
udroid install jammy:gnome

# Launch and log into the GNOME desktop session
udroid login jammy:gnome
```

---

## 🧹 Removing a Distribution

If you want to free up device space or start fresh, you can safely strip out installed suites and purge cached downloads.

```bash
# Completely erase an installed distribution environment
udroid remove jammy:xfce4

# Purge downloaded installation archives to maximize available device storage
udroid --clear-cache
```

---

<code><h3>➡️ <strong>Next Page:</strong> <a href="./display.md">🖥️ Display Configuration</a></h3></code>
