<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> 🖥️ DISPLAY CONFIGURATION </h1>

---

Options and protocols to view and control your Uxdroid / Termux PRoot Desktop Environment.

---

## 🌐 1. Setting up VNC (Virtual Network Computing)

A VNC server comes pre-installed in most suites. While helper commands like `startvnc` are provided automatically, you can also spin up and customize a TigerVNC server manually.

### Local Device Display
Run the following command inside your environment to start a manual VNC server configured for a 1080p ultra-wide display running XFCE4:

```bash
tigervncserver -geometry 2560x1080 -xstartup /usr/bin/xfce4-session -listen tcp :1
```

### Display over Other Devices (Remote Access)
If you want to view your desktop from a different device (like a PC, tablet, or another phone), ensure both devices are connected to the **same local network or Wi-Fi hotspot**. 

Start the server manually with local hosting disabled:

```bash
tigervncserver -geometry 2560x1080 -localhost no -xstartup /usr/bin/xfce4-session -listen tcp :1
```

#### Connecting:
1. Find your Android device's local IP address by opening a separate Termux session and running:
```bash
   ip a
   ```
2. Locate your network adapter IP (usually starts with `192.168.x.x`).
3. Open your VNC viewer app on the remote device and connect to `YOUR_IP_ADDRESS:1` (or port `5901`).

---

## 🪟 2. Setting up xRDP (Remote Desktop Protocol)

RDP is an excellent alternative to VNC. It typically handles dynamic resolutions and touch/mouse inputs much more fluidly on mobile and desktop clients. 

> ⚠️ **Note:** xRDP utilizes a VNC backend inside PRoot, which may occasionally trigger minor visual artifacts or rendering bugs.

### Installation & Configuration

Follow these steps to set up xRDP:

```bash
# 1. Install the xRDP package
sudo apt install xrdp -y

# 2. Define your default desktop session environment
echo "xfce4-session" > ~/.xsession

# 3. Modify the startup script configuration
nano /etc/xrdp/startwm.sh
```

Inside the `startwm.sh` file, **clear out the existing content** and replace it with the following startup initialization block:

```bash
#!/bin/sh
if [ -r /etc/default/locale ]; then
    . /etc/default/locale
    export LANG LANGUAGE
fi

xfce4-session
```

### Initializing the Service
Save and exit the text editor (`Ctrl+O`, `Enter`, `Ctrl+X`), then spin up the service:

```bash
sudo service xrdp start
```

Open your preferred Microsoft Remote Desktop client app on any device and target your session using `localhost:3389`.

---

<code><h3>➡️ <strong>Next Page:</strong> <a href="./tips-and-tricks.md">👩🏻‍🔧 Tips & Tricks</a></h3></code>
