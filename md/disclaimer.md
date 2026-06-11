<h1 align="center" style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 4rem; letter-spacing: 2px; margin-bottom: 0;"> ⚠️ DISCLAIMER </h1>

---

## 📝 Pre-Installation Notes

Before setting up your environment, please keep the following requirements and system expectations in mind:

*   **Storage & Network:** Ensure you have a **stable internet connection** and at least **5–6 GB of free internal storage** for a seamless, error-free installation.
*   **Instant Access:** Because the environment comes heavily pre-configured, you can log in and begin working immediately after the deployment script finishes.
*   **Performance Scaling:** This environment runs inside Termux via software rendering. Performance directly correlates to your device's **CPU, RAM, and storage read/write speeds**.
*   **Resource Management:** Avoid running heavy or resource-intensive applications unless you are using a modern, high-end device.
*   **Feedback & Issues:** If you encounter bugs or want to suggest features, please open an issue directly on the [UXDROID Issue Tracker](https://github.com/jfachriz/uxdroid/issues).

---

## ⚖️ Project Disclaimers & Limitations

*   **Affiliation:** This project is completely independent. It is **not** affiliated with, authorized, or endorsed by Ubuntu, Canonical, or any third-party upstream organizations.
*   **How it Works:** UXDROID operates strictly within the boundaries of Android's SELinux security framework. Its purpose is to provide a seamless, rootless Linux experience on Android using `PRoot`.
*   **Functional Limitations:** Because the environment relies on `ptrace()` (low-level kernel access) and must respect strict Android security policies, the installed Linux system is **not fully functional** compared to native hardware. This architecture results in:
    *   No direct access to physical hardware components.
    *   Potential fluctuations or failures in certain background system services.
    *   Inherent performance overhead.
    *   Occasional environment-specific limitations with `sudo` configurations.
*   **Graphics Performance:** Graphical rendering over standard VNC setups can experience latency due to `PRoot` translation overhead. 
    *   💡 *Optimization:* To achieve a significantly smoother and faster desktop session, follow the official [XWayland in PRoot Guide](https://github.com/jfachriz/uxdroid/wiki/XWayland-in-proot).
*   **No Warranty:** This project is provided "as-is", without warranties or data protection guarantees of any kind. Use it at your own discretion.

---

## 🖥️ Display & Access

Managing and controlling your Desktop Environment can be accomplished through various display protocols (such as VNC or XWayland clients). For step-by-step instructions on configuring your graphics server, please proceed to the setup guide.

<code><h3>➡️ <strong>Next Page:</strong> <a href="../md/installation.md">Installation & Usage</a></h3></code>