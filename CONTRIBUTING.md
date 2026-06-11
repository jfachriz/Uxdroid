<div align="center">
  
  <h1 style="font-family: 'Bebas Neue', Arial, sans-serif; font-size: 2rem; letter-spacing: 2px; margin-bottom: 0;">UXDROID CONTRIBUTION GUIDELINES</h1>
  <p><strong>copyright</strong> <code>jfachriz</code></p>
</div>


---

> Welcome! You have successfully reached the contribution guide. This document outlines the standards, procedures, and ecosystem structure for contributing to UXDROID and its sub-repositories.

---

## Code of Conduct

This project and all participant interactions are governed by the official [Code of Conduct](https://github.com/jfachriz/uxdroid/blob/modified/CODE_OF_CONDUCT.md). By participating, you are expected to uphold these standards.

Please report any unacceptable behavior directly to: **fachrizj@gmail.com**

### Questions and General Discussion
For inquiries, troubleshooting, or general development conversations, please reach out via our community channels:
*   **Discord Server:** Join the community on our [Official Discord](https://discord.gg/3ZTT83tH9Z) for real-time chat with developers.
*   **GitHub Discussions:** Participate in community threads and text forums via [GitHub Discussions](https://github.com/jfachriz/uxdroid/discussions).

---

## Repository Ecosystem

The UXDROID project is split across several sub-repositories. Understanding where your changes belong helps streamline the review process.

### 1. Main Repository (uxdroid)
This repository serves as the entry point. It focuses on providing a desktop-like experience on Android while managing PRoot limitations. It handles custom Ubuntu tarballs with pre-installed applications, the main installer scripts, foundational markdown guides, and preview media.
*   [UXDROID Core Repository](https://github.com/jfachriz/uxdroid)

### 2. Filesystem Manager (fs-manager-uxdroid)
Contains the core configuration scripts responsible for managing the underlying environment, along with code snippets for installing and configuring common application suites.
*   [FS-Manager Repository](https://github.com/jfachriz/fs-manager-uxdroid)

### 3. Documentation (uxdroid-wiki)
Houses all official documentation, deployment instructions, and technical setup guides written by developers and contributors.
*   [Wiki Repository](https://github.com/jfachriz/uxdroid-wiki)

### 4. Build Tools (ux-cook)
The most active repository in the ecosystem. Its primary goal is to simplify the Linux compilation and rootfs assembly process, making it easier to build and ship optimized Linux tarballs to end-users.
*   [UX-Cook Repository](https://github.com/jfachriz/ux-cook)

---

## How to Contribute

If you are new to GitHub or open-source contributions, you can review the basic GitHub [Hello World Guide](https://docs.github.com/en/get-started/quickstart/hello-world) to get started.

### Submitting Pull Requests
*   **Clear Context:** Ensure your pull request includes a descriptive title and a comprehensive summary of the changes made.
*   **Visual Documentation:** The use of screenshots, diagrams, or layout images is highly encouraged when modifying user interfaces or visual configurations.

### Commit Message Standards
Always write clear and structured log messages for your commits. Short, single-line messages are acceptable for minor tweaks, but larger changes must follow a multi-line format:

```bash
git commit -m "A concise summary of the commit

A detailed paragraph describing exactly what changed, why it was changed, and its overall impact on the environment."
```

---

## Coding Conventions

To keep the codebase maintainable and uniform, please follow these core development rules:

*   **Indentation:** Use 4 to 6 spaces for formatting Bash and shell scripts. Do not use hard tabs.
*   **Directory Structure:** Strictly follow established file path rules. All media assets must be placed inside designated directories named `assets` or `img`.
*   **Code Quality:** Utilize code formatters and linting/beautification tools before committing to ensure optimal layout and scannability.
*   **Readability Focus:** Write code with the next reviewer in mind. Treat open-source development like driving a car: when driving alone you might enjoy sharp turns, but with passengers on board, the goal is to make the ride as smooth and comfortable as possible.

---

<h6 align="center">Thanks to all users and contributors | UXDROID Contribution Guidelines v0.1</h6>

<code><h3 align="center"><a href="../README.md">Return to Main Directory</a></h3></code>
