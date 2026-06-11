<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> 📖 INSTALLATION & USAGE </h1>

---

## 🛠️ Prerequisites

Before proceeding with the installation, make sure you have the necessary applications configured on your Android device:

1. **Terminal Emulator:** Download and install **Termux** [F-Droid](https://f-droid.org/en/packages/com.termux/). Do not use the version from the Google Play Store, as it is deprecated and no longer updated.
2. **Display Client:** To access the Linux graphical user interface (GUI), download one of the following display apps from the Play Store or F-Droid:
   * **VNC Viewer**
   * **XServer XSDL**
   * **Termux:X11** (Highly recommended for hardware acceleration and low-latency performance)

---

## 🚀 Automated Installation

This single-line script automates the full process by installing required packages, verifying dependencies, and deploying the developer-recommended default Linux distribution.

Run the following command inside Termux:

```bash
. <(curl -Ls https://bit.ly/uxdroid-installer)
```

---

## 🏗️ Manual Installation

If you prefer to build the environment or manage the underlying installation scripts directly from the source repository, execute the commands below:

```bash
# Update local repositories and install git
apt update && apt install git -y

# Clone the official Uxdroid File System Manager repository
git clone https://github.com/jfachriz/fs-manager-uxdroid)
cd fs-manager-uxdroid

# Execute the local setup script
bash install.sh
```

### Selecting a Custom Suite
After executing the manual install script, you can query available distributions:
```bash
uxdroid list
```
This displays a structured table containing the available OS suites and desktop variations (e.g., `jammy:xfce4`). To install a specific system from that list, run:
```bash
uxdroid install <suite_name>
#e.g uxdroid install jammy:xfce4
```

---

## 🖥️ Management & Login Examples

Below are standard deployment and access workflows for some of the most popular desktop variations.

### Option A: XFCE4 Desktop (Lightweight & Fast)
```bash
# Install the XFCE4 distribution environment
uxdroid install jammy:xfce4

# Launch and log into the XFCE4 desktop session
uxdroid login jammy:xfce4
```

### Option B: GNOME Desktop (Modern & Feature-Rich)
```bash
# Install the GNOME distribution environment
uxdroid install jammy:gnome

# Launch and log into the GNOME desktop session
uxdroid login jammy:gnome
```

---

## 🧹 Removing a Distribution

If you want to free up device space or start fresh, you can safely strip out installed suites and purge cached downloads.

```bash
# Completely erase an installed distribution environment
uxdroid remove jammy:xfce4

# Purge downloaded installation archives to maximize available device storage
uxdroid --clear-cache
```

---

<code><h3>➡️ <strong>Next Page:</strong> <a href="./display.md">Display Configuration</a></h3></code>
