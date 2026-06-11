<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> 🚀 TERMUX-X11 SETUP </h1>

---

Termux-X11 is the gold standard for accessing a Linux GUI inside PRoot. Unlike standard VNC solutions, Termux-X11 runs via a native Android application canvas, providing massive performance increases, hardware acceleration support, and a near-native desktop experience.

---

## 📱 Step 1: Host Device Configuration

Before launching your environment, you must set up the display server framework directly within the Termux host environment.

1. **Install the Companion Application:**  
   Download and install the latest **Termux-X11 APK** directly from the official [Termux-X11 GitHub](https://github.com/termux/termux-x11). 

2. **Install Packages on Termux Host:**  
   Open a raw Termux window (do *not* log into Uxdroid yet) and run the following commands to initialize the X11 package repositories:
```bash
   pkg update -y
   pkg install x11-repo -y
   pkg install termux-x11-nightly -y
   ```

---

## ⚡ Step 2: Initialize the Display Server

You must spin up the server container inside the Android background environment before starting your session.

1. Launch the display server in the background of your Termux application:
```bash
   termux-x11 :1 &
   ```
2. Open the **Termux-X11 Android Application** on your device. You will notice a blank or waiting screen—this is expected. Keep it open or split-screened.

---

## 🐧 Step 3: Connect and Launch inside Udroid

Now, bridge your Udroid distribution environment to the active Termux-X11 canvas.

1. **Log into your distribution environment:**
```bash
   uxdroid login jammy:xfce4
   ```

2. **Expose the display context:**  
   Inside your Uxdroid prompt, set up your display target to watch the host communication channel:
```bash
   export DISPLAY=:1
   ```

3. **Fire up your Desktop Environment:**  
   Execute the startup command for your respective desktop suite. For an XFCE4 setup, use:
```bash
   dbus-launch --exit-with-session xfce4-session
   ```

Switch over to your open Termux-X11 app window; your graphical desktop interface will render automatically with active touch tracking.

---

## 🛠️ Optimizations & Troubleshooting


1. **Virtual GPU Acceleration (VirGL):**  
   If you want to play low-end Linux games or run 3D applications, install the `virglrenderer-android` package on the **Termux host**, run `virgl_test_server_android &` prior to login, and prep your environment launch inside Uxdroid via:
```bash
   GALLIUM_DRIVER=virpipe mesa_glthread=true dbus-launch --exit-with-session xfce4-session
   ```

2. **Resolution and Scaling Adjustments:**  
   If your desktop font or menus look microscopic, swipe from the left edge inside the Termux-X11 app, open the **Preferences** menu, and customize the **Display Resolution** or adjust the UI display scaling factors directly.

---


<code><a href="../md/display.md">Previous Page: Display</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../md/audio.md">Next Page: Audio</a></code>