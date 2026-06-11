<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> 🔊 SETTING UP SOUND </h1>

---

To route audio natively from your uxdroid PRoot environment directly to your Android device's speakers, you need to configure a PulseAudio network loopback channel between the Termux host and the guest OS container.

---

## 📱 Step 1: Termux Host Configuration

Before initializing your Linux desktop session, you must set up and launch the audio server daemon inside the raw Termux application.

1. Open a fresh Termux terminal (do not log into uxdroid yet) and install the PulseAudio package:
```bash
   pkg update && pkg install pulseaudio -y
   ```

2. Force-start the PulseAudio server configured to listen to local TCP connections natively while ignoring idle exit timeouts:
```bash
   pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
   ```

---

## 🐧 Step 2: Guest OS Configuration (Inside uxdroid)

Now, bridge your uxdroid distribution environment to point to the background server socket you just opened on the host.

1. **Log into your distribution environment:**
```bash
   uxdroid login jammy:xfce4
   ```

2. **Expose the audio environment variable:**  
   Inside your active uxdroid terminal context, export the audio loopback address:
```bash
   export PULSE_SERVER=127.0.0.1
   ```

3. **Verify Connection Quality:**  
   Install the native sound utilities package to verify if the client correctly handshakes with the Android driver layer:
```bash
   sudo apt update && sudo apt install pulseaudio-utils -y
   pactl info
   ```

---

## ⚡ Automation Shortcut

To prevent having to manually export the sound server token every time you log into your container, you can append it directly to your shell's layout profile.

Run this command **inside your uxdroid terminal** to automate the process for future logins:

```bash
echo "export PULSE_SERVER=127.0.0.1" >> ~/.bashrc
```

---

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code><strong>Next Page:</strong> <a href="../md/installation.md">Installation & Usage</a></code>