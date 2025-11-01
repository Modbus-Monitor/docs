

# Modbus Monitor XPF - User Guide

**A practical guide for controls engineers and technicians**

<!-- [TOC] -->

## 1. Introduction

**Modbus Monitor XPF** is a versatile Windows application for facilitating communication between a Windows-based PC and Modbus Client or Server devices. It handles both Client (Master) and Server (Slave) operations and supports all common Modbus variants: TCP/IP, Serial RTU, Serial ASCII, and RTU/ASCII over TCP.

![Modbus Monitor XPF Main Interface](../../assets/screenshots/xpf-main-interface.png){ .screenshot-shadow }

**One of the standout features** of Modbus Monitor XPF is its **dual functionality** - it encompasses both a Modbus Client and a Modbus Server **within a single application, running simultaneously**. This dual capability, combined with support for both Modbus Serial and Modbus TCP protocols, makes it an invaluable tool for various Modbus communication needs.

**What you can do with it:**

- Monitor live data from PLCs, drives, meters, and other Modbus devices
- Write values to registers and coils for testing or control
- Simulate Modbus devices for testing your own equipment
- Scan unknown devices to discover their register maps
- Log data for analysis and troubleshooting
- Validate register values against expected ranges
- **Run Client and Server modes simultaneously** on one PC

**Who this is for:**

- Controls engineers commissioning systems
- Maintenance technicians troubleshooting communications
- System integrators testing device compatibility  
- Equipment manufacturers validating Modbus implementations
- SCADA developers needing device simulation without physical hardware

### What Makes This Different

Most Modbus tools are either simple monitors or complex SCADA packages. XPF sits in the middle - it's powerful enough for serious work but simple enough to use quickly. The key advantages:

1. **Runs both Master and Slave simultaneously** - Test client-server interactions on one PC without physical devices
2. **Pre-built device maps** - Download factory-validated maps or community-contributed maps for common equipment
3. **Built-in data validation** - Automatic pass/fail testing with color coding
4. **Professional logging** - Proper timestamped records for troubleshooting
5. **Cross-platform protocol support** - Mix Modbus TCP, RTU, ASCII in the same session

### Learning Resources

Beyond this user guide, additional resources are available:

- **[YouTube Tutorials](https://www.youtube.com/@ModbusMonitor/videos)** - Short demonstrations of features and workflows
- **[Online Help](https://quantumbitsolutions.com/xpf-help/)** - Comprehensive web-based documentation
- **[Community Forum](https://quantumbitsolutions.com/forums/)** - User discussions and troubleshooting help

## 2. Installation & Activation

### System Requirements

=== "Quick Reference"

    **Minimum Requirements:**
    
    - Windows 10 or 11 (64-bit recommended)
    - .NET Framework 4.8 or later
    - 4GB RAM minimum, 8GB recommended
    - 100-500 MB free disk space
    - Serial ports (USB-to-serial adapters work fine)
    - Network access for TCP/IP communications

=== "64-bit Version (Recommended)"

    | Component | Minimum | Recommended | Notes |
    |-----------|---------|-------------|--------|
    | **OS** | Windows 10 x64 | Windows 11 x64 | Most modern systems |
    | **RAM** | 4 GB | 8 GB+ | More memory = better performance |
    | **Storage** | 100 MB | 500 MB | Depends on log file size |
    | **.NET** | Framework 4.8+ | Latest Version | Usually pre-installed |
    | **Ports** | USB or Ethernet | Multiple adapters | For Modbus connections |

=== "32-bit Version"

    | Component | Minimum | Recommended | Notes |
    |-----------|---------|-------------|--------|
    | **OS** | Windows 10 x86 | Windows 11 x86 | Older or embedded systems |
    | **RAM** | 2 GB | 4 GB | 32-bit limit is ~3.5 GB total |
    | **Storage** | 100 MB | 200 MB | Smaller footprint |
    | **.NET** | Framework 4.8+ | Latest Version | Same as 64-bit |
    | **Ports** | USB or Ethernet | Multiple adapters | Full feature compatibility |

=== "Field Laptop Setup"

    **Recommended for field work:**
    
    - Rugged laptop with Windows 10/11
    - USB-to-serial adapter (FTDI chipset recommended)
    - Ethernet port for Modbus TCP
    - 8GB RAM for smooth operation
    - **Portable version** - No installation needed, runs from USB drive
    
    !!! tip "Field Technician Tip"
        Keep the portable version on a USB drive alongside your serial adapters. You can run it on any Windows machine without installation rights.

### Getting the Software

=== "Microsoft Store (Recommended)"

    **Install via Microsoft Store - Easiest Method**
    
    Search for "Modbus Monitor XPF" directly in the Microsoft Store on your Windows Desktop. Once installed, the application can be accessed from the Start Menu.
    
    **Benefits:**
    - **Automatic updates** and license management
    - **No admin rights** needed for installation
    - **Universal binary** - Works on both 32-bit and 64-bit Windows
    - **License per user** (not per machine) - follows your Microsoft Account
    - **Automatic cloud licensing** - Purchase and activate through Store
    
    [:material-microsoft-windows: Get from Microsoft Store](ms-windows-store://pdp/?productid=9PG862WL5HSM){ .md-button .md-button--primary }
    
    Or visit the web store: [Microsoft Store Product Page](https://www.microsoft.com/store/apps/9PG862WL5HSM)

=== "Direct Download from Web"

    **Install from the Web - Portable or Installer Options**
    
    Visit QuantumBitSolutions.com Download or Shop pages to download or purchase the application.
    
    **Portable Version:**
    - The software is a **portable version**, meaning it can be **run from any location without requiring installation**
    - **First launch note:** Slight delay is normal as the application unpacks files to a temporary location
    - Perfect for USB drives or systems without admin rights
    - Keep it with your field equipment for on-site troubleshooting
    
    **Choose your architecture and installation type:**

    | Architecture | Installer (Permanent Setup) | Portable (No Install) |
    |-------------|------------------------------|------------------------|
    | **64-bit** *(Recommended for modern systems)* | [:material-download: x64 Installer](https://quantumbitsolutions.com/download/ModbusMonitor_XPF_x64_Installer.zip){ .md-button } | [:material-download: x64 Portable](https://quantumbitsolutions.com/download/Modbus_Monitor_XPFx64.zip){ .md-button } |
    | **32-bit** *(Older systems only)* | [:material-download: x86 Installer](https://quantumbitsolutions.com/download/ModbusMonitor_XPF_x86_Installer.zip){ .md-button } | [:material-download: x86 Portable](https://quantumbitsolutions.com/download/Modbus_Monitor_XPFx86.zip){ .md-button } |

    **Additional Download Locations:**
    - [:material-download: Download Page](https://quantumbitsolutions.com/purchase/) - All versions available
    - [:material-cart: Shop Page](https://quantumbitsolutions.com/shop/) - Purchase with download links
    
    **What's the difference?**
    
    - **Installer:** Creates shortcuts, integrates with Windows, faster startup
    - **Portable:** No installation needed, run from USB drives, good for field work
    - **64-bit:** Works on modern Windows (2010+), handles large datasets better  
    - **32-bit:** Only needed for older Windows systems or embedded PCs

=== "Enterprise Purchase"

    **Volume licensing and site deployments**    
    - **Multiple machine licenses** available
    - **Offline licensing** for air-gapped networks
    - **Volume discounts** for large deployments
    - **Purchase orders** and invoice billing accepted
    
    [:material-email: Enterprise Sales](https://quantumbitsolutions.com/contact-us/){ .md-button }
    [:material-cart: Browse License Options](https://quantumbitsolutions.com/shop/){ .md-button }

!!! note "Which Version Should I Choose?"
    **Most users:** Choose the **64-bit version** - it works on modern Windows systems and handles large datasets better.
    
    **Use 32-bit version if:**
    - Running on older Windows systems (pre-2010)
    - Using embedded/industrial PCs with 32-bit OS
    - Company policy requires 32-bit applications
    
    **Installer vs Portable:**
    - **Installer:** Better for permanent desk setups, adds shortcuts and file associations
    - **Portable:** Better for field work, USB drives, or systems without admin rights

### License Activation

This section walks you through activating the license for your Modbus Monitor XPF software. The License window provides several buttons and fields to help you navigate the activation process.

**First Launch Experience:**

When you launch Modbus Monitor XPF for the first time, the **License window appears automatically**. This window displays:

- **UID (User Identification)** - Your unique identifier for license purchases
- **License Information Panel** - Shows current license status (Trial or Licensed)
- **Hardware ID (HWID)** - Used for certain license types
- **Licensing Buttons** - Store, Shop, Activate, Load, Trial, Exit

**Licensing Buttons Overview:**

| Button | Purpose | When to Use |
|--------|---------|-------------|
| **Store** | Microsoft Store purchase & activation | Purchase through Microsoft Store or activate Store license |
| **Shop** | Online shop page | Opens web browser to quantumbitsolutions.com/shop |
| **Activate** | Enter license key | After purchasing online key-based license |
| **Load** | Load license file | For `.lic` files (enterprise/offline licenses) |
| **Trial** | Start trial mode | Begin evaluation period with full features |
| **Exit** | Close license window | Exit the application |

!!! info "Trial Version - Full Featured Evaluation"
    **Free trial with ALL features unlocked** - No credit card required. Perfect for testing before purchase.
    
    **Starting Trial Mode:**
    1. Launch XPF for the first time
    2. License window appears automatically
    3. Click **"Trial"** button to begin evaluation period
    4. License Information Panel shows how many days are left in your evaluation period
    5. Start using the application immediately with limited functionality. Runtime and some features are restricted and requires full license.

**Main Steps to Activate the Software:**

1. **Purchase License** - Click "Store" or "Shop" button to visit licensing store and complete purchase
2. **Load or Enter Key** - After purchase, load license file (enterprise) or enter license key (online purchase)
3. **Verify Activation** - License Information Panel confirms activation status and trial mode is disabled

**Choose your activation method based on how you obtained the software:**

=== "Microsoft Store (Easiest)"

    **Automatic activation with Microsoft Account**
    
    The Microsoft Store version handles licensing automatically - no manual activation needed!
    
    **Purchase & Activation Flow:**
    
    1. **Open License Window**
       - Launch Modbus Monitor XPF
       - The license dialog appears automatically on first launch
       - Or go to **File Tab → About → Activate** button
    
    2. **Click "Store" Button**
       - Opens Microsoft Store purchase page
       - Your UID is automatically included in the purchase
    
    3. **Complete Purchase**
       - Sign in with your Microsoft Account
       - Complete payment in the Microsoft Store
       - Purchase is linked to your Microsoft Account
    
    4. **Activate License**
       - Return to XPF License window
       - **Click "Store" button again** to activate
       - System verifies purchase with Microsoft
       - Status changes to "Licensed" immediately
    
    **Benefits:**
    
    - No manual license key entry required  
    - Automatic renewal options available  
    - License tied to Microsoft Account (not individual PC)  
    - Easy reinstallation on any Windows device  
    - Can be used on new computers with same Microsoft Account
    
    !!! tip "Multi-Computer Usage"
        Microsoft Store licenses follow your Microsoft Account. Install on multiple devices and sign in with the same account - the Store button activates on each installation automatically!
    
    !!! note "License Window Location"
        Access the license window through: **File Tab → About section → Activate button**
    
    <!-- Screenshot placeholder: xpf-store-activation.png -->
    <!-- Shows: License window with Store button highlighted, UID field, License Information Panel -->

=== "Online Purchase (Direct)"

    **Manual activation with license key**
    
    For licenses purchased directly from quantumbitsolutions.com using online Shop or purchase buttons.
    
    **Step-by-Step Activation:**
    
    1. **Get Your UID (BEFORE Purchasing!)**
       - Launch Modbus Monitor XPF
       - Go to **File Tab → About → Activate** button
       - License window opens showing your **UID (User Identification)**
       - Format looks like: `ABC123-DEF456-GHI789` or similar alphanumeric code
       - **Click "Copy" button** next to the UID field
       - Save this UID - it's required for purchasing your license
    
    2. **Purchase License Online**
       - Click the **"Shop"** button in the License window (opens shop page)
       - Or visit [:material-cart: quantumbitsolutions.com/shop](https://quantumbitsolutions.com/shop/) directly
       - Select **Modbus Monitor XPF** license
       - **Enter your UID** in the order form (critical step!)
       - Complete payment through the online system
    
    3. **Receive License Key via Email**
       - Check your email inbox (usually arrives within minutes)
       - License key format: `XXXX-XXXX-XXXX-XXXX-XXXX` (5 groups separated by dashes)
       - **Save this email** - you'll need it for reinstallation on other computers
       - Note: Key is permanently tied to your UID
    
    4. **Activate in XPF**
       - Return to the License window (File Tab → About → Activate)
       - Click **"Activate"** button in the Licensing Buttons section
       - **Paste your complete license key** in the entry field
       - System verifies the key online
       - License Information Panel updates to show **"Licensed"** status
    
    !!! warning "Critical: Provide UID When Purchasing!"
        Your license key is permanently bound to your UID. If you purchase without providing your UID, the key won't work and you'll need to contact support for a replacement key.
    
    **License Window Components:**
    
    | Component | Description |
    |-----------|-------------|
    | **UID Field** | Displays your unique User Identification code |
    | **Copy Button** | Copies UID to clipboard for purchase form |
    | **License Information Panel** | Shows current license status (Trial or Licensed) |
    | **Activate Button** | Opens field to enter license key for activation |
    | **Shop Button** | Opens online shop to purchase license |
    
    **Troubleshooting:**
    
    - **"Invalid Key" error:** Verify you copied the entire key including all dashes, no extra spaces
    - **"UID Mismatch":** Key was purchased for different UID - contact support with both UID and key
    - **"Connection Error":** Activation requires internet connection - check firewall settings
    - **Key not working:** Ensure you're entering the key in the Activate dialog, not the Trial field
    
    ![License Activation Window](../../assets/screenshots/xpf-license-window.webp){ .screenshot-shadow }
    
    <!-- Additional screenshot needs:
         - xpf-license-dialog-annotated.png: Shows all buttons (Store, Shop, Activate, Load, Trial, Exit) with UID field and Copy button labeled
         - xpf-enter-key-dialog.png: Shows Activate dialog with license key entry field
         - xpf-activation-success.png: Shows License Information Panel with "Licensed" status
    -->

=== "Enterprise/Site License"

    **License file for multiple installations or air-gapped systems**
    
    For organizations needing multiple installations, offline activation, or centralized license management.
    
    **License Types:**
    
    | License Type | Use Case | Activation Method |
    |--------------|----------|-------------------|
    | **Site License** | Multiple PCs at one location | License file (`.lic`) or keys |
    | **Volume License** | Many installations, any location | Multiple keys or license files |
    | **Offline License** | Air-gapped networks, no internet | Special license file only |
    | **OEM License** | Bundled with equipment | Custom activation method |
    
    **Activation with License File (`.lic`):**
    
    1. **Contact Sales for Enterprise Licensing**
       - Email [:material-email: sales@quantumbitsolutions.com](mailto:sales@quantumbitsolutions.com)
       - Provide: Number of seats needed, deployment location(s), offline requirements
       - Discuss: Site license, volume pricing, offline activation needs
       - Receive: Quote and purchase order details
    
    2. **Receive License File**
       - Sales team provides special `.lic` license file after purchase
       - File contains all activation data embedded
       - **No internet connection required** for activation with license file
       - Can be used on multiple PCs (based on license terms)
    
    3. **Load License File on Each Computer**
       - Launch Modbus Monitor XPF
       - Open License window: **File Tab → About → Activate**
       - Click **"Load"** button in the Licensing Buttons section
       - File browser opens
       - Navigate to your `.lic` file location
       - Select the license file and click Open
       - License Information Panel immediately shows **"Licensed"** status
       - **No internet verification needed** - file contains authorization
    
    4. **Deploy to Multiple Systems**
       - Copy the same `.lic` file to all licensed computers (via USB, network share, etc.)
       - Install XPF on each system
       - Repeat Step 3 (Load License File) on each installation
       - All systems activate instantly with the same file
    
    **Alternative: Offline Key Activation**
    
    If you need to activate with a license key on air-gapped systems:
    
    1. **Generate Activation Request**
       - On offline PC: Open License window
       - Note your **UID** and **Hardware ID (HWID)** shown in License Information Panel
       - Provide these to support via email (from internet-connected PC)
    
    2. **Receive Offline License Key**
       - Support generates special offline key tied to your UID/HWID
       - Transfer key to offline system (USB drive, printed paper, etc.)
    
    3. **Enter Key on Offline System**
       - Click **"Activate"** button in License window
       - Enter the offline license key
       - System validates locally without internet
       - Status changes to "Licensed"
    
    **Enterprise Support Benefits:**
    
    - Priority email support response (24-hour guarantee)  
    - Optional phone support available  
    - Custom Service Level Agreements (SLAs)  
    - Dedicated account management  
    - Volume discount pricing  
    - Flexible deployment options (offline, network, etc.)  
    - Purchase order and invoice billing accepted
    
    !!! tip "Recommended for Industrial Environments"
        License files (`.lic`) are ideal for secure facilities, air-gapped networks, or environments where internet access is restricted for security reasons.
    
    [:material-email: Contact Enterprise Sales](https://quantumbitsolutions.com/contact-us/){ .md-button .md-button--primary }
    [:material-cart: View Volume License Options](https://quantumbitsolutions.com/shop/){ .md-button }
    
    <!-- Screenshot placeholder: xpf-load-license-file.png -->
    <!-- Shows: License window with Load button highlighted, file browser dialog with .lic file selected -->

=== "Troubleshooting"

    **Common installation and activation issues**
    
    ### Installation Problems
    
    **Application won't start or crashes immediately:**
    
    - Install latest .NET Framework from Microsoft
    - Right-click XPF → "Run as Administrator"
    - Check Windows Defender isn't blocking the application
    - Verify system meets minimum requirements (Windows 10/11)
    
    **Serial ports not showing in interface:**
    
    - Install drivers for your USB-to-serial adapter
    - Check Device Manager for COM port assignments
    - Some generic adapters need specific drivers (FTDI, Prolific, etc.)
    - Try different USB ports if adapter not recognized
    
    **Network connection problems:**
    
    - Windows Firewall may block Modbus TCP (port 502)
    - Add firewall exception: Control Panel → Windows Defender Firewall → Allow an app
    - Corporate networks sometimes block non-standard ports
    - Verify IP address and subnet configuration
    
    ### Activation Issues
    
    **"Invalid Key" error when activating:**
    
    - Verify you copied the complete license key (including all dashes)
    - Check for extra spaces at beginning or end of key
    - Ensure key matches the UID shown in License window
    - Contact support if key was purchased for different UID
    
    **"Connection Error" during activation:**
    
    - Check internet connection is active
    - Verify firewall isn't blocking XPF's internet access
    - Try temporarily disabling antivirus software
    - Some corporate proxies block activation - contact IT
    
    **Microsoft Store activation not working:**
    
    - Ensure you're signed in with correct Microsoft Account
    - Check Microsoft Store app is updated to latest version
    - Try signing out and back in to Microsoft Account
    - Restart XPF after completing purchase
    
    **License shows "Expired" unexpectedly:**
    
    - Verify system clock is set correctly (wrong date can cause this)
    - Check if subscription renewal payment failed
    - Contact support to verify license status
    
    ### Performance Issues
    
    **Slow startup or sluggish performance:**
    
    - Close unnecessary applications consuming RAM
    - Check for Windows updates pending installation
    - Disable communication logging when not needed
    - Reduce number of monitor points being polled
    
    **High memory usage:**
    
    - Disable Event Log if not needed (major memory consumer)
    - Limit chart buffer size (set Samples value instead of unlimited)
    - Clear log files periodically
    - Reduce poll rate for large register lists
    
    ### Still Having Issues?
    
    **Email Support:** support@quantumbitsolutions.com  
    **Community Forum:** [quantumbitsolutions.com/forums](https://quantumbitsolutions.com/forums/)  
    **Knowledge Base:** [Technical Resources](../../technical/index.md)

**License Comparison:**

| Feature | Trial | Standard | Enterprise |
|---------|-------|----------|------------|
| **Duration** | Time-limited | Perpetual | Perpetual |
| **Full Features** | Yes | Yes | Yes |
| **Updates** | During trial | 1 year included | Custom terms |
| **Installations** | 1 PC | 1 PC per license | Multiple PCs |
| **Support** | Community forum | Email support | Priority support |
| **Offline Use** | Yes | Yes | Yes (special activation) |
| **Price** | Free | [View pricing](https://quantumbitsolutions.com/shop/) | Contact sales |

## 3. Understanding the Interface

### Application Window

The main application window of Modbus Monitor XPF is organized into several key sections that work together to provide a comprehensive Modbus communication interface.

![XPF Application Window with numbered annotations showing Quick Access Toolbar, Ribbon Tabs, Command Groups, Dialog Launcher, and Window Portal Area](../../assets/screenshots/xpf-application-window-annotated.png){ .screenshot-shadow }
*Figure 3.1: Main application interface showing five key areas (1, 2, 3, 4, 5)*

**Interface Component Structure:**

```mermaid
graph TB
    QAT["1 Quick Access Toolbar<br/>Customizable one-click commands<br/>Save • Open • Read • Start • Show"]
    TABS["2 Ribbon Tabs<br/>File • Home • Client • Server • IoT"]
    GROUPS["3 Command Groups<br/>Clipboard • Modbus Wizard • List<br/>Filter • Evaluate • Log"]
    LAUNCHER["4 Dialog Launcher<br/>Small arrows in group corners<br/>Access extended options"]
    PORTAL["5 Window Portal Area<br/>Monitor Points • Log • Chart • Online Maps"]
    
    QAT -.-> TABS
    TABS -.-> GROUPS
    GROUPS -.-> LAUNCHER
    GROUPS -.-> PORTAL
    
    style QAT fill:#e3f2fd,stroke:#1976d2,stroke-width:2px
    style TABS fill:#fff3e0,stroke:#f57c00,stroke-width:2px
    style GROUPS fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px
    style LAUNCHER fill:#ffebee,stroke:#c62828,stroke-width:2px
    style PORTAL fill:#e8f5e9,stroke:#388e3c,stroke-width:2px
```

**The application window contains five main areas:**

!!! tip "Cross-Reference with Screenshot and Diagram"
    Each numbered section (**1, 2, 3, 4, 5**) in the annotated screenshot and the diagram above corresponds to the detailed descriptions below. Use these visual guides to quickly locate features in the actual application.

#### 1. Quick Access Toolbar

Located at the very top, this toolbar provides one-click access to frequently used commands. **You can customize which buttons appear** by right-clicking the toolbar.

**Available Quick Access Toolbar Buttons:**

| Button | Function | Description |
|--------|----------|-------------|
| **Save** | Save configuration | Quickly save your current Modbus map configuration to CSV file |
| **Open** | Open file | Load previously saved configuration |
| **Chart** | Open chart view | Switch to Chart visualization window |
| **Read** | Read once | Poll all monitoring points once and stop |
| **Write** | Write once | Write selected monitor point value once |
| **Client** | Modbus Client | Start/Stop continuous polling of all monitoring points |
| **Server** | Modbus Server | Start/Stop Modbus Server |
| **Show** | Show log | Toggle Event Log / Communication Log view |
| **Start** | Log Controls| Start/Stop Communication events captures |
| **Clear** | Clear logs | Clear all entries from Communication Log window |

**Customization Options:**

- **Show Below the Ribbon**: Position toolbar below ribbon tabs instead of above
- **Checkmarks**: Indicate which buttons are currently visible on toolbar
- **Right-click**: Access customization menu any time
- **Add/Remove**: Click any button name to toggle its visibility

!!! tip "Recommended Quick Access Setup"
    **For daily operations**, most technicians keep these buttons visible:
    
    - **Save** - Quick configuration saves during field work
    - **Read** - Single poll to check current values
    - **Start/Stop** - Control polling quickly
    - **Show** - Toggle between Monitor Points and Log views
    - **Clear** - Clear logs between test runs
    
    This provides instant access to 90% of common operations without navigating through ribbon tabs.

#### 2. Ribbon Tabs

Below the Quick Access Toolbar, you'll find multiple tabs that organize all application features:

**Standard Tabs (Always Visible):**

- **File** - Backstage view with file operations, licensing, settings, support, and links
- **Home** - Most frequently used commands (copy/paste, Modbus Wizard, list management)
- **Client** - Modbus Client (Master) operations (interface config, polling, scanner, charts)
- **Server** - Modbus Server (Slave) operations (interface config, Modbus TCP Server, Modbus RTU Server )
- **IoT** - IoT integration (ThingSpeak cloud logging, MQTT messaging for cloud/device communication)

**Contextual Tabs (Appear When Features Active):**

- **Log Options** - Appears when Event Log is active (filter, export, auto-scroll controls)
<!-- - **Chart Options** - Appears when Chart view is open (axis config, samples, data export)
- **Server Options** - Appears when Server mode is running (traffic capture, simulation settings) -->

The active tab is highlighted, making it easy to see which commands are currently available.

#### 3. Command Groups (Ribbon Commands)

In the middle section of each ribbon tab, you'll find groups of related command buttons:

- **Add Device** - Add new monitor points to your list
- **Delete Device** - Remove selected monitor points
- **Offset ID** - Change address base or Unit ID for all points
- And many more, organized by function

Buttons are accompanied by icons and arrows indicating their functions and options.

#### 4. Dialog Launcher

Small buttons in the corner of command groups that open additional settings or options:

| Feature | Location | Purpose |
|---------|----------|---------|
| **Arrow Icon** | Bottom-right of command groups | Opens extended dialogs |
| **Advanced Options** | Context-specific dialogs | Access detailed settings |
| **Extended Settings** | Beyond ribbon display | Configure advanced parameters |

#### 5. Window Portal Area

The main workspace at the bottom displays different information depending on the selected mode:

| View | Trigger | Display Content |
|------|---------|-----------------|
| **Monitor Points List** | Default view | Table showing all Modbus monitoring points with Name, Address, Unit ID, Value, and register details |
| **Log Window** | Log button toggled | Communication events and Modbus traffic history |
| **Chart Window** | Chart button active | Time-series data visualization and trend analysis |
| **Online Maps Navigator** | Online button toggled | Browse and download pre-built Modbus maps from factory/community |

Each view provides relevant information for the specific task being performed.

#### Ribbon Tabs Overview

The standard Modbus Monitor XPF ribbon contains the following tabs, from left to right:

**Standard Tabs (Always Visible):**

| Tab | Purpose | Key Features |
|-----|---------|--------------|
| **File** | Backstage view | File operations, licensing, theme settings, recent files, online resources, exit |
| **Home** | Main Operations | Copy/paste, Modbus Wizard, list management, filtering, evaluation |
| **Client** | Modbus Client (Master) | Interface selection, timeouts, write functions, scanner, charts, poll controls |
| **IoT** | Cloud integration | ThingSpeak logging, MQTT messaging, cloud-to-device communication |

**Contextual Tabs (Appear Dynamically):**

| Tab | Trigger | Key Features |
|-----|---------|--------------|
| **Log Options** | Event Log active | Filter errors, export logs, auto-scroll, timestamp format, clear history |
<!-- | **📈 Chart Options** | Chart view open | Axis configuration, sample buffer size, fit to view, export chart data, clear buffer | -->


!!! note "How Contextual Tabs Work"
    Contextual tabs (also known as Option Tabs) appear only when you activate specific features, providing relevant controls without cluttering the interface.
    
    **Examples:**
    - Click **Show** button in Home tab → Log group → **Log Options** tab appears
    
    When you deactivate the feature (close log, close chart), the contextual tab automatically disappears.

#### Key Concepts

```mermaid
graph TB
    MAP["MODBUS MAP / LIST<br/><i>Complete collection of all Monitor Points</i>"]
    
    subgraph TABLE["Monitor Points Table"]
        direction TB
        HEADER["<b>NAME | ADDRESS | UNIT ID | GAIN | OFFSET | DATA TYPE | SWAP TYPE | VALUE</b>"]
        ROW1["Motor Speed | 400001 | 1 | 1.00000 | 0.00000 | UINT16 | ABCD_BE | 1450"]
        ROW2["Line Voltage | 400002 | 1 | 1.00000 | 0.00000 | INT16 | ABCD_BE | 230"]
        ROW3["Pump Status | 100001 | 1 | 1.00000 | 0.00000 | BIT | ABCD_BE | 1"]
        ROW4["Temperature SP | 000001 | 1 | 1.00000 | 0.00000 | BIT | ABCD_BE | 1"]
        
        HEADER -.-> ROW1
        HEADER -.-> ROW2
        HEADER -.-> ROW3
        HEADER -.-> ROW4
    end
    
    ENGINE["XPF POLLING ENGINE<br/><i>Handles: Polling • Writing • Retries<br/>Data Conversion • Byte Swap • Display Formatting</i>"]
    
    MAP ==> TABLE
    TABLE ==> ENGINE
    
    NOTE1["The entire table = <b>Modbus Map/List</b>"]
    NOTE2["Each row = One <b>Monitor Point</b>"]
    
    TABLE -.-> NOTE1
    TABLE -.-> NOTE2
    
    style MAP fill:#e3f2fd,stroke:#1976d2,stroke-width:3px,color:#000
    style TABLE fill:#f5f5f5,stroke:#666,stroke-width:2px
    style HEADER fill:#2196f3,stroke:#1565c0,stroke-width:2px,color:#fff
    style ROW1 fill:#fff,stroke:#90caf9,stroke-width:1px
    style ROW2 fill:#fff,stroke:#90caf9,stroke-width:1px
    style ROW3 fill:#fff,stroke:#90caf9,stroke-width:1px
    style ROW4 fill:#fff,stroke:#90caf9,stroke-width:1px
    style ENGINE fill:#c8e6c9,stroke:#388e3c,stroke-width:3px,color:#000
    style NOTE1 fill:#fff9c4,stroke:#f57f17,stroke-width:2px
    style NOTE2 fill:#fff9c4,stroke:#f57f17,stroke-width:2px
```

**Modbus Map / List:** The Modbus Map (or Monitor Points List) is the complete collection of data points you want to communicate with on a Modbus device. Think of it as your “register shopping list” — a centralized view showing all Modbus addresses you plan to read or write. Each entry in this list includes its address, function code, data type, and optional pre- or post-processing settings. Together, these entries form a dictionary of Modbus data that defines what the XPF application will handle. XPF then automatically manages polling, writing, retries, data conversions, byte-swapping, and display formatting across the entire list.

**Monitor Point:** A Monitor Point is a single data entry within the Modbus Map — representing one Modbus register or coil you want to read or write. You configure its details (address, function code, data type, scaling, and optional pre/post-processing). Each Monitor Point operates as an independent tag, allowing you to precisely define what data you want and how it should be processed. XPF then performs all background operations for that point: polling, retrying, converting, swapping bytes if needed, and displaying formatted values.

!!! example "Modbus Map and Monitor Points - Practical Example"
    **Understanding the relationship between Modbus Map and Monitor Points:**
    
    | NAME | ADDRESS | UNIT ID | GAIN | OFFSET | DATA TYPE | SWAP TYPE | VALUE |
    |------|---------|---------|------|--------|-----------|-----------|-------|
    | Motor Speed | `400001` | 1 | 1.00000 | 0.00000 | UINT16 | ABCD_BE | 1450 |
    | Line Voltage | `300001` | 1 | 1.00000 | 0.00000 | INT16 | ABCD_BE | 230 |
    | Pump Status | `100001` | 1 | 1.00000 | 0.00000 | BIT | ABCD_BE | 1 |
    | Coil Register | `000001` | 1 | 1.00000 | 0.00000 | BIT | ABCD_BE | 1 |
    
    **Key Points:**
    
    - The **entire table above** represents your **Modbus Map/List**
    - **Each row** (e.g., Motor Speed, Line Voltage) represents one **Monitor Point**
    - Each Monitor Point has all 8 columns: NAME, ADDRESS (6-digit), UNIT ID, GAIN, OFFSET, DATA TYPE, SWAP TYPE, VALUE
    - Address format: `4xxxxx`=Holding Reg | `3xxxxx`=Input Reg | `1xxxxx`=Discrete Input | `0xxxxx`=Coil
    - XPF automatically handles all polling, conversions, and formatting for every Monitor Point in the list

**Client vs Server Mode:** 

- **Client (Master)** - You initiate communication, continuously polling remote devices for data
- **Server (Slave)** - You simulate a Modbus device, responding to requests from other masters
- **Simultaneous Operation** - Both modes can run at the same time on different interfaces 

**XPF Functionality Architecture:**

=== "Client Mode (Master)"

    **XPF initiates communication to read/write data from remote Modbus devices**

    ```mermaid
    graph LR
        subgraph MAPLIST["Modbus Map"]
            direction TB
            ADDR1["40001 | Read Holding | INT16<br/>Motor Speed RPM"]
            ADDR2["40002 | Read Holding Reg | FLOAT32<br/>Line Voltage V"]
            ADDR3["00001 | Read Coil | BOOL<br/>Pump Running Status"]
            
            ADDR1 ~~~ ADDR2 ~~~ ADDR3
        end
        
        subgraph XPF["XPF - CLIENT MODE"]
            direction TB
            MAPLIST
            ENGINE["Polling Engine"]
        end
        
        PLC["PLC<br/>Holding Registers<br/>192.168.1.10 or RTU"]
        VFD["VFD Drive<br/>Speed Control<br/>192.168.1.10 or RTU"]
        METER["Energy Meter<br/>Power Data<br/>192.168.1.10 or RTU"]
        
        XPF -->|"(1) Send Read Request<br/>Modbus TCP"| PLC
        PLC -->|"(2) Return Data<br/>Register Values"| XPF
        
        XPF -->|"(1) Send Read Request<br/>Modbus RTU"| VFD
        VFD -->|"(2) Return Data<br/>Speed, Status"| XPF
        
        XPF -->|"(1) Send Read Request<br/>Modbus TCP"| METER
        METER -->|"(2) Return Data<br/>Voltage, Current"| XPF
        
        style XPF fill:#e3f2fd,stroke:#1976d2,stroke-width:4px
        style MAPLIST fill:#fff,stroke:#1976d2,stroke-width:2px
        style ADDR1 fill:#f5f5f5,stroke:#90caf9,stroke-width:1px
        style ADDR2 fill:#f5f5f5,stroke:#90caf9,stroke-width:1px
        style ADDR3 fill:#f5f5f5,stroke:#90caf9,stroke-width:1px
        style ENGINE fill:#bbdefb,stroke:#1976d2,stroke-width:2px
        style PLC fill:#fff9c4,stroke:#ff6f00,stroke-width:2px
        style VFD fill:#fff9c4,stroke:#ff6f00,stroke-width:2px
        style METER fill:#fff9c4,stroke:#ff6f00,stroke-width:2px
    ```

    **Client Mode Flow:**
    
    1. **Configure Monitor Points** - Define which registers/coils to read/write
    2. **XPF sends requests** - Polls devices according to configured timing
    3. **Devices respond** - Send back register values, coil states
    4. **XPF processes data** - Apply scaling, byte swapping, display formatting
    5. **Log communication** - Track all transactions for troubleshooting

    **Use Cases:** Monitor PLCs, read sensor data, control VFDs, commissioning systems

=== "Server Mode (Slave)"

    **XPF responds to requests from external Modbus masters (SCADA, HMI, PLC)**

    ```mermaid
    graph RL
        subgraph XPF["XPF - SERVER MODE"]
            direction TB
            LISTEN["Server Listener"]
            SVRDATA            
        end
        
        subgraph SVRDATA["Modbus Map"]
            direction TB
            REG1["40001 | Holding | INT16<br/>Process Value 1"]
            REG2["40002 | Holding | FLOAT32<br/>Temperature C"]
            REG3["00001 | Coil | BOOL<br/>Alarm Status"]
            
            REG1 ~~~ REG2 ~~~ REG3
        end
        
        SCADA["SCADA System<br/>TCP Client<br/>192.168.1.100"]
        HMI["HMI Panel<br/>RTU Client<br/>COM2"]
        PLCM["PLC Master<br/>TCP Client<br/>192.168.1.50"]
        
        SCADA -->|"(1) Send Read Request<br/>Modbus TCP"| XPF
        XPF -->|"(2) Return Data<br/>From Data Table"| SCADA
        
        HMI -->|"(1) Send Read Request<br/>Modbus RTU"| XPF
        XPF -->|"(2) Return Data<br/>Register Values"| HMI
        
        PLCM -->|"(1) Send Write Request<br/>Function 06/16"| XPF
        XPF -->|"(2) Confirm Write<br/>Update Data Table"| PLCM
        
        style XPF fill:#e8f5e9,stroke:#388e3c,stroke-width:4px
        style SVRDATA fill:#fff,stroke:#388e3c,stroke-width:2px
        style REG1 fill:#f5f5f5,stroke:#81c784,stroke-width:1px
        style REG2 fill:#f5f5f5,stroke:#81c784,stroke-width:1px
        style REG3 fill:#f5f5f5,stroke:#81c784,stroke-width:1px
        style LISTEN fill:#c8e6c9,stroke:#388e3c,stroke-width:2px
        style SCADA fill:#fce4ec,stroke:#c2185b,stroke-width:2px
        style HMI fill:#fce4ec,stroke:#c2185b,stroke-width:2px
        style PLCM fill:#fce4ec,stroke:#c2185b,stroke-width:2px
    ```

    **Server Mode Flow:**
    
    1. **Configure Server Data** - Set up registers, coils, and initial values
    2. **External master sends request** - SCADA/HMI asks for data
    3. **XPF processes request** - Validates function code, address range
    4. **XPF sends response** - Provides requested data or write confirmation
    5. **Log transaction** - Track all requests for analysis

    **Use Cases:** Simulate devices for testing, act as protocol gateway, development without hardware

!!! tip "Simultaneous Operation - Run Both Modes Together"
    **XPF can operate as Client AND Server at the same time:**
    
    - **Client mode** reads data from real PLCs (Modbus TCP on port 502)
    - **Server mode** provides that data to SCADA (Modbus RTU on COM1)
    - Each mode uses independent interface configuration
    - Perfect for protocol conversion, testing, or acting as a data bridge

**Magic Codes:** Special text you add to the **Name** field of monitor points to enable advanced features like custom poll rates, bit field access, string length control, and date/time conversion (covered in detail in Monitor Points section).

**Dual Functionality:** XPF can operate as both Client and Server simultaneously, making it ideal for testing client-server interactions on a single PC without physical devices. 

#### Navigation Tips

**Quick Access Toolbar Customization:**

| Action | Method | Details |
|--------|--------|---------|
| **Open Customization Menu** | Right-click anywhere on toolbar | Shows complete list of available buttons (11 options) |
| **Add/Remove Buttons** | Click button name in menu | Checkmark indicates button is currently visible |


**Customization Best Practices:**

- **Add buttons you use frequently** - Start, Stop, Read, Save, Show
- **Remove rarely-used buttons** - Keep toolbar uncluttered for faster access
- **Field work setup** - Save, Read, Start, Stop, Show (essential operations only)
- **Development setup** - Add Chart, Write for testing and analysis work
- **Position preference** - Below ribbon if you prefer buttons closer to data area

**Right-click Context Menus:**

| Feature | Usage | Behavior |
|---------|-------|----------|
| **Table Context Menus** | Right-click any table row | Relevant actions for selected item |
| **Field Context Menus** | Right-click input fields | Field-specific operations |
| **Adaptive Menus** | Context-sensitive | Options change based on selection |

**Keyboard Shortcuts:**

| Shortcut | Function | Usage |
|----------|----------|-------|
| `Ctrl+S` | Save configuration | Preserve current setup |
| `Ctrl+O` | Open configuration | Load saved file |
| `Ctrl+C` / `Ctrl+V` | Copy/paste | Works with Excel integration |
| `Ctrl+X` | Cut rows | Move selected items |
| `Shift+Click` | Select range | Sequential row selection |
| `Ctrl+Click` | Multi-select | Non-sequential rows |

**Window Portal Switching:**

| Feature | Method | Result |
|---------|--------|--------|
| **View Toggle** | Ribbon button clicks | Switch between Monitor Points, Log, Chart, Online Maps |
| **Shared Space** | Same screen area | Each view replaces previous in portal |
| **Data Persistence** | Background retention | Switching views doesn't lose data |

!!! tip "Workflow Best Practice"
    1. Set up your monitor points first (define what you want to read/write)
    2. Configure communication settings (TCP/Serial, timeouts)
    3. Save your configuration before starting polling
    4. Test with "Read Once" before enabling continuous polling
    5. Save frequently - especially before making major changes

### File Tab

The **File Tab** provides access to the backstage view containing essential file operations, application settings, license management, and resources. Click the **File** tab to enter this full-screen view.

#### Home Section

The Home section provides quick access to your file system and document management:

| Feature | Icon/Button | Description |
|---------|-------------|-------------|
| **Home** | Home button | Navigate to Documents folder |
| **Open** | Folder icon | Open folder in Windows Explorer |
| **Up** | Up arrow | Move up one level in directory tree |
| **Current Folder** | `<Documents>` | Displays current folder name |

#### Recent Section

Quick access to recently used Modbus maps and configurations:

| Button | Function | Description |
|--------|----------|-------------|
| **Refresh** | Update list | Refresh the recent files list |
| **Open Folder** | Show location | Opens folder containing selected file |
| **Open File** | Load map | Loads selected configuration in XPF |
| **Remove** | Delete entry | Remove selected file from recent list |
| **Delete** | Clear all | Deletes all entries from recent list |

!!! tip "Quick File Access"
    The Recent Files list is the fastest way to switch between different device configurations. Your most commonly used maps are always one click away.

#### About Section

Access version information, documentation, and support resources:

| Option | Description | Action |
|--------|-------------|--------|
| **Version** | Current application version | Displays installed version number |
| **Activate** | License activation | Opens license window for activation |
| **Submit Feedback** | User feedback | Direct feedback to developers |
| **Documentation** | Online help | Access comprehensive online help |
| **Videos** | Tutorial videos | Links to YouTube tutorials |
| **Contact Email** | Support contact | Email address for inquiries |
| **Privacy Policy** | Data handling | View privacy policy details |
| **EULA** | License agreement | End User License Agreement terms |

**Quick Actions:**

- **Need help?** Click **Documentation** for online guides
- **New to XPF?** Click **Videos** for visual tutorials  
- **License issues?** Click **Activate** to manage licenses
- **Feature requests?** Use **Submit Feedback**

#### Settings Section

Customize the application theme to match your environment:

| Theme | Description | Best For |
|-------|-------------|----------|
| **Light** | Bright interface | Well-lit environments, daytime use |
| **Dark** | Dark interface | Low-light environments, reduced eye strain |
| **System Default** | Follows Windows | Automatically matches Windows theme |


**Theme Selection:**

1. Click **File Tab** → **Settings**
2. Choose theme from dropdown
3. Theme applies immediately (no restart needed)

!!! tip "Field Work Preference"
    Many field technicians prefer **Dark theme** when working in dimly lit equipment rooms or cabinets.

#### Exit

**Exit** button safely closes the Modbus Monitor XPF application:

- **Saves** current window position and settings
- **Prompts** to save unsaved changes (if any)
- **Terminates** all active connections properly
- **Releases** serial ports and network resources

### Home Tab

The **Home Tab** contains the most frequently used commands for essential Operations - everything you need for working with Modbus maps and monitoring points.

![Home Tab Interface](../../assets/screenshots/xpf-home-tab.png)

#### File Group

**Import and Export Documents** - Manage Documents, Import and Export Modbus Maps in CSV format. Access pre-built Modbus Maps for common devices (VFDs, Energy Meters, PLCs) from factory-validated or community sources.

| Feature | Description | Details |
|---------|-------------|---------|
| **Save** | Save current document in CSV format | Preserves entire Modbus map configuration including monitor points, settings, and extended properties for reuse |
| **Save As** | Save As New document | Preserves entire Modbus map configuration including monitor points, settings, and extended properties for reuse |
| **Open** | Open previously saved file | Load saved XPF configuration files (CSV format) from any location |
| **Online** | Download Modbus Maps from online folder or community | Access pre-configured maps from (1) factory-released validated maps or (2) community-uploaded maps. See detailed explanation below. |

!!! note "CSV Format Benefits"
    XPF saves configurations as standard CSV files, making them easy to:
    
    - **Edit** in Excel or text editors for batch modifications
    - **Version control** using Git or other systems
    - **Share** with team members or across sites
    - **Document** device configurations for compliance

#### Clipboard Group

**Copy and Paste Operations** - Transfer data between XPF and external applications like Excel. Copy, paste, and cut monitor points for quick duplication or reorganization.

| Operation | Shortcut | Description |
|-----------|----------|-------------|
| **Paste** | `Ctrl+V` | Paste from clipboard from selected row(s) - either from the application or Microsoft Excel. Adds to end of list. |
| **Copy** | `Ctrl+C` | Copy selected single or multiple row(s) to clipboard. Multiple sequential rows can be selected with Shift+Click's first and last row. Multiple rows in any order using Control+Click. |
| **Cut** | `Ctrl+X` | Copy the content of the current item to clipboard and delete the item from the list. |

#### Modbus Wizard

The **Modbus Wizard** provides a streamlined interface for configuring monitor points without manually editing the table. Access it by clicking the **Dialog Launcher** (small arrow) in the Modbus Wizard group corner.

![Modbus Wizard Dialog](../../assets/screenshots/xpf-modbus-wizard.webp){ .screenshot-shadow }
*Modbus Wizard configuration interface*

**Configuration Fields:**

| Field | Purpose | Options/Format |
|-------|---------|----------------|
| **Register Name** | Descriptive identifier | Text field - name your monitor point |
| **Modbus Function** | Register type and access | See [Function Codes](#2-address-field-6-digit-format) reference below |
| **Sub-Function** | Function variant *(FC8 only)* | Appears for FC8 Diagnostics - e.g., "0 (0x0) Return Query Data" |
| **Device ID** | Device identification type *(FC43-14 only)* | Appears for FC43-14 - e.g., "01 Get Basic Device ID (stream)" |
| **Object ID** | MEI object identifier *(FC43-14 only)* | Appears for FC43-14 - Object number (00-FF hexadecimal) |
| **CustomQ** | Custom Modbus Packet | Add PDU part of the Modbus Command to send any command  |
| **Data Request** | Request address/value | Address or data value for the request |
| **Address** |  Modbus Address | Zero or One based Modbus Address (see [6-digit format](#2-address-field-6-digit-format)) |
| **Data Type** | Data interpretation | See [Data Types](#3-data-type-options) reference below |
| **Poll Rate Control** | Update frequency | NONE, SKIP, ONCE, INTERVAL (Adjust Poll Rate value) |
| **Bit Field** | Extract specific bit | 0-15 for 16-bit registers - selects individual bit |
| **Write Only** | Skip during reads | Checkbox - for write-only registers |

!!! info "Function-Specific Fields"
    The wizard dynamically displays additional fields based on the selected Modbus Function:
    
    - **FC8 Diagnostics**: Shows `Sub-Function` dropdown with diagnostic test options
    - **FC43-14 Read Device Identification**: Shows `Device ID` and `Object ID` fields for MEI object selection
    - These fields only appear when their corresponding function is selected

!!! tip "Quick Reference"
    For complete details on Function Codes, Data Types, and address formats, see the **[Monitor Points Configuration](#monitor-points-table-configuration)** section below.

**How to Use:**

1. **View Existing Point**: Click any row in Monitor Points table - Wizard displays current settings
2. **Edit Configuration**: 
   - Select row to edit
   - Change values in Wizard dropdowns/fields
   - Click **OK** to apply changes
3. **Add New Point**:
   - Click empty row or Add button
   - Fill in Register Name
   - Select Modbus Function from dropdown
   - Configure Data Type and optional settings
   - Click **OK** to create

**Common Scenarios:**

=== "Reading Device Information"

    **Setup:**
    - Register Name: `Device Model`
    - Modbus Function: `FC43 (0x2B) Encapsulated Interface Transport`
    - CustomQ: `28` (typical string length)
    - Data Type: `BIT` or `STRING`
    
    **Result:** Reads device identification strings (manufacturer, model, version)

=== "Temperature Sensor"

    **Setup:**
    - Register Name: `Water Temp`
    - Modbus Function: `FC04 (0x04) Input Registers`
    - Data Type: `INT16` or `FLOAT32`
    - Poll Rate Control: `NONE` (default polling)
    
    **Result:** Continuous monitoring of read-only temperature value

=== "Alarm Status Bit"

    **Setup:**
    - Register Name: `High Temp Alarm`
    - Modbus Function: `FC02 (0x02) Discrete Inputs`
    - Data Type: `BIT`
    - Bit Field: `5` (extracts bit 5)
    
    **Result:** Monitors specific alarm bit in status register

=== "Setpoint Control"

    **Setup:**
    - Register Name: `Target Speed`
    - Modbus Function: `FC03 (0x03) Holding Registers`
    - Data Type: `UINT16`
    - Write Only: `☐` (unchecked - read and write)
    
    **Result:** Bidirectional control - read current setpoint, write new values

!!! tip "Wizard Advantages"
    **Why use the Wizard instead of direct table editing:**
    
    - **Validation**: Ensures valid combinations of function codes and data types
    - **Guided Setup**: Dropdown menus prevent common configuration errors
    - **No Syntax Errors**: Automatically formats addresses and codes correctly
    - **Beginner Friendly**: Visual interface easier than memorizing Modbus specifications
    - **Quick Changes**: Faster than navigating table columns for adjustments

#### List Group

**Add and Remove Points** - Add, remove, or modify monitor points in bulk. Change addressing modes (0-based/1-based), swap Unit IDs globally, or set decimal precision for all numeric displays.

The **List Group** provides essential tools for managing your Monitor Points (also called Rows or Items) in the configuration table:

| Button | Function | Description |
|--------|----------|-------------|
| **Add** | Add new point | Creates new row with default values. Automatically **increments address by one** from the last row for quick sequential entry. |
| **Remove** | Delete selected point(s) | Removes selected monitor point(s) from the table. Select multiple with `Ctrl+Click` (non-sequential) or `Shift+Click` (range). |
| **Delete All** | Clear entire list | Removes **ALL monitor points** from the table. **Use with caution** - this action cannot be undone! |
| **Offset** | Toggle address base | Switch between **1-based** (1-65536) and **0-based** (0-65535) addressing for all addresses in the list. |
| **Swap ID** | Change Unit ID globally | Updates **Unit ID** (Slave/Station ID) for **all monitor points** at once. Useful when reconfiguring for a different device. |
| **Decimal Places** | Set display precision | Configure the number of decimal places for displaying numeric values throughout the application. |

!!! example "Typical Workflow"
    **Adding multiple consecutive registers:**
    
    1. Add first register at address 400001
    2. Click **Add (+)** - automatically creates 400002
    3. Click **Add (+)** again - creates 400003
    4. Continue as needed - each Add increments by one
    
    **Bulk ID changes:**
    
    - If you need to change all monitor points from Slave ID 1 to Slave ID 5
    - Simply click **ID** button and enter 5
    - All monitor points update immediately

#### Filter Group

**Search and Filter Monitor Points** - Search Name and Address fields to quickly locate specific monitor points. Filter large lists by text search or Unit ID to focus on relevant registers during troubleshooting or configuration.

![Filter Interface](../../assets/screenshots/xpf-home-filter.png){ .screenshot-shadow }

**Filter Components:**

| Label | Component | Description |
|-------|-----------|-------------|
| **1** | **Row Index**| Shows the **index of the currently selected row**. Especially useful when the list is filtered to know the true row number. -1 when none Selected.|
| **2** | **Filter Text Box** | Enter text to search. Filters all **Name** and **Address** fields that contain the entered text. |
| **3** | **Total Rows** | Shows the **total number of rows** in the current view (filtered or full list). |
| **4** | **Clear Filter**| Clears the text filter and shows all rows in the list. |
| **5** | **Clear ID** | Clears the ID filter and shows all rows in the list. |
| **6** | **ID Dropdown** | Select **Unit ID** (Slave ID or Station ID) to filter by device. Combine with text filter for precise results. |


!!! tip "How Filtering Works"
    **Text Search:**
    - Type any text in the filter box
    - Results show all monitor points where Name OR Address contains your search text
    - Case-insensitive search
    - Use partial matches (e.g., "temp" finds "Temperature", "temp_sensor", "Water Temp")
    
    **ID Filter:**
    - Select specific Unit ID from dropdown
    - Shows only monitor points for that device
    - Combine with text filter for double-filtering
    
    **Combined Example:**
    - Filter Text: `status`
    - ID: `3`
    - Result: Only status-related registers from Unit ID 3

!!! example "Common Filter Scenarios"
    **Finding all temperature sensors:**
    ```
    Filter Box: temp
    Result: Shows all points with "temp" in name or address
    ```
    
    **Working with specific device:**
    ```
    ID Dropdown: 5
    Result: Shows only Slave ID 5 registers
    ```
    
    **Precise targeting:**
    ```
    Filter Box: alarm
    ID Dropdown: 2
    Result: All alarm-related points from device 2 only
    ```

#### Evaluate Group

**Value Validation and Testing** - Validate register values against configurable limits with automatic color coding. Set pass/fail thresholds for quality control testing or equipment health monitoring.

Change the background colors of the Value cell based on the High, Low, and Nominal Limits. **Quickly validate the value from the Modbus device and test to see if it is within the valid range.**

![Evaluate Settings](../../assets/screenshots/xpf-evaluate-limits.webp){ .screenshot-shadow }

#### Evaluate Filter Area

| Button | Function | Description |
|--------|----------|-------------|
| **Show** | Extend toolbar | Click to extend the toolbar with more filtering options |
| **High** | Filter high values | Filter the list to show values that have **reached the High Limit** |
| **Nominal** | Show nominal values | Display monitoring points with **Nominal Values** (within acceptable range) |
| **Low** | Filter low values | Filter the list to show values that have **reached the Low Limit** |
| **Auto** | Automatic update | **Automatically update** the UI with selected filters after each scan |
| **Off** | Toggle evaluate mode | Toggle Evaluate (Test) Mode **on or off** for all monitoring points |

#### Evaluate Limits Settings (Per Monitor Point)

Fine-tune validation thresholds for individual monitor points. Each point can have custom limits and color coding independent of others in your list.

![Evaluate Settings](../../assets/screenshots/xpf-home-evaluate.png)

Click the **three dots (...)** button at the end of any monitor point row to open the Evaluate Limits dialog shown above.

|Label | Setting | Options | Description |
|------|---------|---------|-------------|
|**1**| **Three Dots (...)** | Button | Opens the Evaluate Limits settings dialog for this monitor point |
|**2**| **Evaluate** | Checkbox | Turn the Evaluate feature **on or off** for this specific monitor point |
|**3**| **Nominal Color** | Color picker | Choose a color for the **Nominal Value range**. The nominal range is calculated as values **between the Low Limit and High Limit**. |
|**4**| **Low Limit** | Value + Color | Choose a color to highlight the Value column when the value **equals or falls below the Low Limit**. The value can be **numerical or string** type. |
|**5**| **High Limit** | Value + Color | Choose a color to highlight the Value column when the value **equals or exceeds the High Limit**. The value can be **numerical or string** type. |
|**4 + 5**| **String Mode** | Same High/Low | For String Data Type, set the **same High and Low Limit** for exact string matching |

!!! example "Practical Applications"
    **Quality Control Testing:**
    
    - Set High Limit: 100, Low Limit: 0, Nominal: Green
    - Values 0-100 show green (pass)
    - Values outside range show red/yellow (fail)
    - Instant visual validation during production testing
    
    **Equipment Health Monitoring:**
    
    - Motor temperature: High=80°C (Red), Low=10°C (Blue), Nominal=Green
    - Pressure sensor: High=150 PSI (Red), Nominal=Green
    - Quick identification of out-of-spec conditions
    
    **String Validation:**
    
    - Device status should be "RUNNING"
    - Set High Limit = Low Limit = "RUNNING", Nominal Color = Green
    - Any other status shows as error color

#### Log Group

**Communication Monitoring and Logging** - View and record all Modbus communication traffic for troubleshooting. Filter errors, export logs to file, and timestamp all events for accurate diagnostics.

![Log Group Interface](../../assets/screenshots/xpf-home-log.png){ .screenshot-shadow }
*Four key areas: 1 Log Group (Home Tab), 2 Options Tab, 3 Quick Access Header (3a-3h), 4 Log Window*

**Complete Log Controls Reference:**

All log controls in one comprehensive table. Labels **1**, **2**, **3a-3h**, and **4** correspond to the screenshot above.

| Label | Control | Location | Type | Function |
|-------|---------|----------|------|----------|
| **1** | **Show** | Home Tab → Log Group | Toggle Button | Show/hide Event Log view. **Pressed**: Replaces Monitor Points table with log display, Options tab appears. **Released**: Returns to Monitor Points table. |
| **2** | **Log/Options Tab** | Contextual Ribbon | Dynamic Tab | Appears when log is active. Contains logging and filter controls. Disappears when log closed (logging continues in background if started). |
| **2** | **Filter** | Quick Access Header or Options Tab | Text Input Box | Real-time text search. Type to filter log entries, clear to show all. Case-insensitive search. |
| **2** | **Errors** | Options Tab | Toggle Button | **Checked**: Show errors only (timeouts, exceptions). **Unchecked**: Show all events (success + errors). |
| **3a or 2** | **Start/Stop** | Quick Access Header or Options Tab | Toggle Button | **Start**: Begin capturing events. **Stop**: Pause recording. Auto-resumes if saved while running. |
| **3b or 2** | **Auto Save** | Quick Access Header or Options Tab | Toggle Button | **ON**: Continuously writes log to Documents folder. **OFF**: Logs remain in memory only. |
| **3c or 2** | **Copy All** | Quick Access Header or Options Tab | Button | Export all visible log entries to clipboard (timestamp + details). Paste into Excel, email, or text editor. Click on any log entry to enable this button. |
| **3d  or 2** | **Clear** | Quick Access Header or Options Tab | Button | Delete all log entries from display. **Warning**: Cannot be undone. Save or copy important logs first. |
| **3e** | **Save** | Quick Access Header | Button | Save current log entries to a file in Documents folder. |
| **3f** | **Float** | Quick Access Header | Button | Float the Log window outside the application's main window as a separate window. |
| **3g** | **Expand** | Quick Access Header | Button | Expand log window to full screen or restore to normal size. |
| **3h or 2** | **Close** | Quick Access Header or Options Tab | Button | Close Log Window and return to Monitor Points (logging continues in background if started). |
| **4** | **Log Window** | Window Portal Area | Display Panel | Shows timestamped communication events. Replaces Monitor Points table when log is active. |

!!! tip "Quick Start Workflow"
    1. Click **Show** (1) → Log window appears (4), Options tab (2) opens
    2. Click **Start** (3a) → Begin recording Modbus traffic
    3. Optional: Toggle **Errors** (3f) or type in **Filter** (3g) to focus on specific events
    4. Click **Copy All** (3b) to export, or **Save** (3d) for continuous file backup
    5. Click **Clear** (3c) between test runs to remove old entries
    6. Click **Close** (3e) or **Show** (1) again to return to Monitor Points

##### Log Entries Display (Window Portal Area)

**Where Log Entries Appear** - When you click the **Show** button (1), the **Window Portal Area** (the main workspace below the ribbon) switches from showing the Monitor Points table to displaying the **Event Log**.

**Log Entry Display Characteristics:**

| Feature | Description | Details |
|---------|-------------|---------|
| **Location** | Window Portal Area | Same area where Monitor Points table normally displays |
| **Entry Format** | Timestamped rows | Each log entry shows: **Timestamp** • **Event Type** • **Details** • **Status** |
| **Timestamps** | UTC format | All events time-stamped with UTC for accurate correlation across time zones |
| **Auto-Update** | Real-time | New entries appear immediately as communication occurs (when logging is started) |
| **Scroll View** | Vertical scrolling | Older entries scroll up as new ones arrive at bottom |
| **Capacity** | Memory-based | Limited to 10000 entries before deleting old items (clear periodically for performance) |

**What Gets Logged:**

- **Modbus Requests**: Function code, address, unit ID, data sent
- **Modbus Responses**: Data received, byte count, success/failure status  
- **Communication Errors**: Timeouts, CRC errors, exception codes, connection failures
- **System Events**: Connection established/closed, configuration changes, poll cycle start/stop
- **Timestamps**: Precise timing for troubleshooting timing-related issues

!!! example "Sample Log Entries"
    **Complete Poll Cycle with System Events:**
    ```
    07:19:56:511585, Poll Once: True
    07:19:56:766466, Client-STARTING
    07:19:58:820433, Server Found 127.0.0.1:502
    07:19:58:825077, Client-RUNNING
    ```
    
    **Successful Read (Holding Registers):**
    ```
    07:19:58:833472, TCP TX, 00 01 00 00 00 06 01 03 00 00 00 01, Read Holding Registers, SID:1, FC:3, ADR:0, CNT:1
    07:19:58:861535, TCP RX, 00 01 00 00 00 05 01 03 02 00 00
    ```
    
    **Modbus Exception Error 1 - Illegal Function (Input Registers):**
    ```
    07:19:58:908104, TCP TX, 00 02 00 00 00 06 01 04 00 00 00 01, Read Input Registers, SID:1, FC:4, ADR:0, CNT:1
    07:19:58:923572, TCP RX, 00 02 00 00 00 03 01 84 01
    07:19:58:926070, Illegal Function, ERR:1, SID:1 FC:84, Sample Input Register, 300001, 1, 1, 0, INT16, ABCD_BE, 30001,,
    ```
    
    **Modbus Exception Error 1 - Illegal Function (Discrete Inputs):**
    ```
    07:19:58:955758, TCP TX, 00 03 00 00 00 06 01 02 00 00 00 01, Read Inputs Registers, SID:1, FC:2, ADR:0, CNT:1
    07:19:58:970172, TCP RX, 00 03 00 00 00 03 01 82 01
    07:19:58:970512, Illegal Function, ERR:1, SID:1 FC:82, Discrete Input Register, 100001, 1, 1, 0, BIT, ABCD_BE, 1,,
    ```
    
    **Modbus Exception Error 1 - Illegal Function (Coils):**
    ```
    07:19:59:001799, TCP TX, 00 04 00 00 00 06 01 01 00 00 00 01, Read Coils, SID:1, FC:1, ADR:0, CNT:1
    07:19:59:016788, TCP RX, 00 04 00 00 00 03 01 81 01
    07:19:59:017054, Illegal Function, ERR:1, SID:1 FC:81, Coil Register, 1, 1, 1, 0, BIT, ABCD_BE, 1,,
    ```
    
    **Client Stop:**
    ```
    07:20:00:052399, Client-STOPPED
    ```

**Viewing Tips:**

- **Recent entries appear at bottom** - Scroll down to see latest events
- **Filtering reduces clutter** - Use Errors toggle (4) to hide successful transactions
- **Text search narrows focus** - Type in Filter box (4) to find specific device, register, or error type
- **Copy for analysis** - Click Copy All (3) to export all visible entries to clipboard

##### Understanding Log View Toggle

| Control | Location | Function | State Indicator |
|---------|----------|----------|-----------------|
| **Show Button** | Home tab → Log Group | Toggles between Monitor Points and Event Log views | Button stays pressed/highlighted when Log view is active |
| **Quick Access** | Can add to Quick Access Toolbar | One-click access without navigating to Home tab | Recommended for frequent troubleshooting |

**View Behavior:**

- **Click Show**: Monitor Points table → Event Log display (button stays pressed)
- **Click Show Again**: Event Log → Monitor Points table (button released)
- **Shared Portal**: Both views occupy the same Window Portal Area
- **Data Preserved**: Switching views doesn't lose Monitor Points or Log data

!!! tip "Quick Access Recommendation"
    Right-click the **Show** button and add it to your Quick Access Toolbar for one-click switching during active troubleshooting sessions. 

##### Complete Interface Overview

**Visual relationship between all four labeled sections:**

```mermaid
graph TB
    HOME["1 LOG GROUP<br/>(Home Tab)<br/>─────────<br/>Show Button"]
    
    CLICK1[" Click Show "]
    
    OPTIONS["2 OPTIONS TAB<br/>(Contextual Ribbon)<br/>─────────<br/>Contains 3 and 4"]
    
    subgraph GROUPS["Options Tab Contains:"]
        direction LR
        LOG["3 LOG GROUP<br/>Start/Stop<br/>Copy All<br/>Clear<br/>Save"]
        
        FILTER["4 FILTER GROUP<br/>Errors Toggle<br/>Text Filter"]
    end
    
    WINDOW["WINDOW PORTAL AREA<br/>─────────<br/>Log Entries Display<br/>(timestamped events)"]
    
    HOME -->|Click| CLICK1
    CLICK1 -->|Opens| OPTIONS
    OPTIONS -.->|Contains| LOG
    OPTIONS -.->|Contains| FILTER
    LOG -->|Controls| WINDOW
    FILTER -->|Filters| WINDOW
    
    CLICK2[" Click Show Again "]
    OPTIONS -->|Close| CLICK2
    CLICK2 -->|Returns to| MONITOR["Monitor Points Table"]
    
    style HOME fill:#e3f2fd,stroke:#1976d2,stroke-width:3px,color:#000
    style OPTIONS fill:#fff3e0,stroke:#f57c00,stroke-width:3px,color:#000
    style LOG fill:#c8e6c9,stroke:#388e3c,stroke-width:2px,color:#000
    style FILTER fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px,color:#000
    style WINDOW fill:#fff9c4,stroke:#f57f17,stroke-width:3px,color:#000
    style GROUPS fill:#f5f5f5,stroke:#666,stroke-width:2px
    style CLICK1 fill:#bbdefb,stroke:#1976d2,stroke-width:1px
    style CLICK2 fill:#ffccbc,stroke:#d84315,stroke-width:1px
    style MONITOR fill:#e8f5e9,stroke:#388e3c,stroke-width:2px
```

**Key Relationships:**

- **Section 1** (Home Tab) triggers everything - click **Show** to begin
- **Section 2** (Options Tab) appears automatically and **contains sections 3 and 4**
- **Section 3** (Log Group in Options) provides **recording control buttons**
- **Section 4** (Filter Group in Options) provides **search and filter controls**
- **Both 3 and 4** affect what you see in the **Window Portal Area** (log entries display)

##### Practical Use Cases

!!! example "Troubleshooting Connection Issues"
    **Scenario:** Device not responding
    
    **Steps:**
    1. Click **Show** → Event Log appears
    2. Click **Start** in Options tab
    3. Click **Errors** toggle to filter errors only
    4. Type device name or address in **Filter** box
    5. Attempt connection from Client tab
    6. Review log entries for timeout/error messages
    7. Click **Copy All** to send to support team
    
    **Benefits:** Isolated error messages with exact timestamps

!!! example "Monitoring Communication Health"
    **Scenario:** Verify stable polling operation
    
    **Steps:**
    1. Start logging before beginning poll cycle
    2. Enable **Save** toggle for automatic file backup
    3. Run polling for extended period (hours/days)
    4. Periodically check **Errors** toggle to verify no issues
    5. Review saved log file for patterns or intermittent errors
    
    **Benefits:** Long-term reliability validation with automatic archival

!!! example "Protocol Analysis for Custom Devices"
    **Scenario:** Reverse-engineering unknown device behavior
    
    **Steps:**
    1. Enable logging and **Save** toggle
    2. Send test commands to device
    3. Use **Filter** to search for specific function codes
    4. Click **Copy All** → Paste into protocol analyzer
    5. Compare request/response patterns
    
    **Benefits:** Complete transaction history for protocol documentation

##### Best Practices

!!! tip "Logging Best Practices"
    **Optimize Your Workflow:**
    
    - **Save Before Logging**: Enable the **Save** toggle before starting long monitoring sessions
    - **Filter Proactively**: Use **Errors** toggle during troubleshooting to reduce noise
    - **Clear Regularly**: Click **Clear** between test runs to avoid confusion
    - **Text Search**: Use specific keywords (register address, function code, device name) for precise filtering
    - **Quick Access**: Add **Show** and **Clear** to Quick Access Toolbar for rapid access
    - **Project Auto-Start**: Saved projects remember logging state - automatically resumes if it was active

!!! warning "Performance Impact"
    **Resource Considerations:**
    
    - Event logging consumes **CPU cycles** and **memory** to capture high-speed communication
    - **High poll rates** (many registers per second) increase logging overhead significantly
    - **Disable logging** when not actively troubleshooting for optimal performance
    - **Clear logs periodically** during long sessions to free memory
    - **Text filtering** searches all entries in real-time - may slow down with thousands of entries
    
    **Recommendation:** Turn off logging during normal production operation unless you need historical records.

!!! info "Data Persistence"
    **What Gets Saved:**
    
    - **With Save Toggle ON**: Log file continuously updated in Documents folder
    - **With Save Toggle OFF**: Logs exist only in memory, cleared when:
        - You click **Clear** button
        - You close XPF application
        - You switch to another configuration file
    
    **File Location:** Check your Windows Documents folder for auto-saved log files (typically named with timestamp).

#### Online Maps

**Cloud-Based Modbus Maps** - View and Download Online Modbus Maps from either **(1) factory-released maps** by Modbus Monitor or **(2) community-uploaded maps** from users. Toggle the **Online** button in the File group located in the Home tab to activate this feature. **An internet connection is required** to use this feature.

![Online Maps Interface](../../assets/screenshots/xpf-home-file-online.webp)
*How to download pre-defined Modbus Map*

**Interface Components:**

| # | Icon/Button | Function | Description |
|---|-------------|----------|-------------|
| **1** | **Online** | Online Maps | Click the cloud button or Back button to toggle the Online Map navigator open or closed |
| **2a** | **X (Back)** | Close navigator | Click the cloud button or Back button to toggle the Online Map navigator open or closed |
| **2b** | **Factory** | Maps from Factory | Officially released and validated Modbus Maps |
| **2c** | **Community** | Community Maps | View maps shared by others in the user community |
| **2d** | **Share** | Upload | Upload your Modbus Map and share it with the online community |
| **2e** | **Download** | Download | Download selected Online Maps to your local system |
| **2f** | **Status** | Progress Indicator | Download or Upload status:<br>**Green Check mark**: Operation completed successfully<br>**Red Cross**: Error occurred. Download process was interrupted or there's an Internet connection issue. |
| **2g** | **Name** | File display | Name of the map just downloaded or currently selected |
| **3** | **Maps** | Online Maps | List of Online Maps available by Manufacturer, Model, and Type. Use the search filter to quickly filter the list by Manufacturer or Model.|

**Downloading Factory Maps:**

1. Click on the **Factory Icon [1]** and wait for the list to update from the cloud
2. Click on the **File Name** from the list of available devices; the file name appears in the text area **[6]**
3. Click on the **Download button [4]**
4. The Modbus Map of the devices **automatically opens** when the file successfully downloads after the **green check mark [5]** appears and the online button closes

!!! tip "Factory Maps Advantage"
    Factory maps are **officially validated** and tested. They're your best starting point for common industrial equipment like VFDs, meters, and PLCs from major manufacturers.

**Uploading Community Maps:**

Users can upload their own custom Modbus Maps to share with the community or store them in the cloud repository for backup and easy access across multiple installations. This collaborative feature helps build a comprehensive library of device configurations.

**[YouTube Video on using Online Maps](https://www.youtube.com/embed/7c_ZKHzH_ew)** - Short demonstrations of features and workflows

**Steps to Upload your Modbus Map:**

1. Click on **Community icon [2c]**
2. Click on the **Share Icon [2d]** and choose the local XPF Modbus Map data file from your computer
3. **Green Check** shows **[2f]** when the file is successfully uploaded to the cloud
4. Click on the **Community Files Maps icon [2c]** to refresh the list of files in the window and see your contribution

!!! example "Sharing Your Work"
    **When to share your maps:**
    
    - You've created a map for equipment without factory support
    - You've enhanced an existing map with additional registers
    - You've documented a custom or proprietary device
    - You want to help other users with the same equipment
    
    Your contributions help the entire community!

## Monitor Points Configuration

### Monitor Points Table Structure

Each row in the Monitor Points table represents a single Modbus register or group of registers to monitor:

| Column | Data Type | Example | Description |
|--------|-----------|---------|-------------|
| **Name** | String | `Water Temperature:16` | Descriptive name + magic codes |
| **Address** | Integer | `400001` | 6-digit Modbus address format |
| **Unit ID** | Byte (1-247) | `1` | Slave/Station ID |
| **Gain** | Float | `1.5` | Scaling multiplier (Y = mX + b) |
| **Offset** | Float | `100` | Value offset (Y = mX + b) |
| **Data Type** | Enum | `INT16` | Data interpretation format |
| **Swap Type** | Enum | `ABCD_BE` | Byte/word order for multi-register |
| **Value** | String/Number | `Solar Meter 123` | Current/set value |

### Detailed Field Descriptions

#### 1. Name Field - Enhanced with Magic Codes

The Name field supports special **Magic Key Codes** to enhance functionality:

##### String Length Control
```
Format: :xx
Usage: Water Temperature:16
Effect: Reads 16 continuous registers as string
```

##### Poll Rate Control  
```
Format: @xxxx (milliseconds)
Usage: Model Name@1000
Effect: Polls every 1000ms (1 second)
Special: @-1 = Poll once at start, @0 = Skip during polling
```

##### Bit Field Access
```
Format: .n (bit index 0-15)
Usage: Status Register.8  
Effect: Extracts bit 8 from 16-bit register
```

##### Date/Time Formats
```
Codes: DOS | EPOCH | EPOCHMS | DT2 | DT3 | DT4 | DT4P | DT6
Usage: Timestamp_DT6 + Data Type = DATETIME
Effect: Converts registers to date/time display
```

##### Multiple Magic Codes
```
Example: System_Status@-1:31.5
Effect: Poll once (@-1), 32 registers (:31), bit 5 (.5)
```

#### 2. Address Field - 6-Digit Format

The **6-digit addressing format** provides an explicit and standardized way to identify both the register type and its address in a single number. This format is used in XPF and many other Modbus tools to simplify configuration.

**Format Structure:**

```
[Type Prefix Digit] [5-Digit Register Address]
```

**Example: 400001 breaks down as:**
- **4** = Register Type Indicator (Holding Register)
- **00001** = Register Number (1)

!!! info "Prefix Digit ≠ Function Code"
    **Important:** The first digit is a **register type indicator**, not the Modbus function code itself (though they're related). 
    
    - **Type Prefix** → Tells you what kind of register (Coil, Discrete Input, Input Register, Holding Register)
    - **Function Code** → The actual Modbus command used to read/write that register type
    
    For example, address `400001` uses type prefix `4` (Holding Register), which is typically accessed using **Function Code 03** (Read) or **06/16** (Write).

**Register Type Prefix Table:**

| Prefix Digit | Register Type | Typical Function Codes | Address Range (6-Digit) | Access |
|--------------|---------------|------------------------|-------------------------|---------|
| **0xxxxx** | Coils | FC01 (Read) / FC05, FC15 (Write) | 000001–065536 | Read/Write |
| **1xxxxx** | Discrete Inputs | FC02 (Read) | 100001–165536 | Read Only |
| **3xxxxx** | Input Registers | FC04 (Read) | 300001–365536 | Read Only |
| **4xxxxx** | Holding Registers | FC03 (Read) / FC06, FC16 (Write) | 400001–465536 | Read/Write |

**Visual Breakdown:**

```mermaid
graph LR
    ADDR["400001"] -->|"Split into"| TYPE["4<br/>Holding Register"]
    ADDR -->|"Split into"| NUM["00001<br/>Register #1"]
    
    TYPE -.->|"Uses"| FC["Function Codes:<br/>03 (Read)<br/>06/16 (Write)"]
    NUM -.->|"Actual Address"| ZERO["Zero-based: 0<br/>One-based: 1"]
    
    style ADDR fill:#e3f2fd,stroke:#1976d2,stroke-width:3px,font-size:16px
    style TYPE fill:#fff3e0,stroke:#f57c00,stroke-width:2px
    style NUM fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px
    style FC fill:#e8f5e9,stroke:#388e3c,stroke-width:2px
    style ZERO fill:#ffebee,stroke:#c62828,stroke-width:2px
```

**Key Concepts:**

- **First digit (0, 1, 3, or 4)**: Indicates **register type** (not function code directly)
- **Last five digits (00000–65535)**: The **actual register address**
- **Zero-based vs One-based**: Devices may start counting from 0 or 1
  - **Zero-based:** First register = 0 (e.g., `400000`)
  - **One-based:** First register = 1 (e.g., `400001`)

!!! example "Address Examples - Understanding the Format"
    
    **Complete breakdown showing all components:**
    
    | 6-Digit Address | Type Prefix | Register # | Function Code | Physical Location | Zero-Based |
    |-----------------|-------------|------------|---------------|-------------------|------------|
    | `400001` | 4 (Holding) | 1 | FC03 (Read) | First holding register | 0 |
    | `400123` | 4 (Holding) | 123 | FC03 (Read) | 123rd holding register | 122 |
    | `300005` | 3 (Input) | 5 | FC04 (Read) | 5th input register | 4 |
    | `000013` | 0 (Coil) | 13 | FC01 (Read) | 13th coil | 12 |
    | `100008` | 1 (Discrete) | 8 | FC02 (Read) | 8th discrete input | 7 |

!!! tip "Converting from Other Modbus Tools"
    **If you're used to entering "Function Code + Address" separately (like Modbus Poll):**
    
    | Your Tool Shows | XPF 6-Digit Format | Conversion |
    |-----------------|-------------------|------------|
    | FC03, Address 123 | `400123` | Prefix `4` + `00123` |
    | FC04, Address 5 | `300005` | Prefix `3` + `00005` |
    | FC01, Address 13 | `000013` | Prefix `0` + `00013` |
    | FC02, Address 8 | `100008` | Prefix `1` + `00008` |
    
    **Quick Reference:**
    - **FC01/05/15** (Coils) → Prefix **0**
    - **FC02** (Discrete Inputs) → Prefix **1**  
    - **FC03/06/16** (Holding Registers) → Prefix **4**
    - **FC04** (Input Registers) → Prefix **3**

**Special Function Codes (Do NOT Use 6-Digit Address Format):**

| Function Code | Hex | Description | Use Case |
|---------------|-----|-------------|----------|
| **FC07** | 0x07 | Read Exception Status | Device error/status flags |
| **FC08** | 0x08 | Diagnostics | Device diagnostic tests (requires Sub-Function) |
| **FC11** | 0x0B | Get Comm Event Counter | Communication event counter |
| **FC12** | 0x0C | Get Comm Event Log | Communication event log retrieval |
| **FC17** | 0x11 | Report Server ID | Server/slave identification |
| **FC43** | 0x2B | Encapsulated Interface Transport | MEI - Device ID, date/time sync |
| **FC43-14** | 0x2B-0x0E | Read Device Identification | Manufacturer, model, serial strings (requires Device ID & Object ID) |
| **FC43-15** | 0x2B-0x0F | Read Date and Time | Clock read |
| **FC43-16** | 0x2B-0x10 | Write Date and Time | Clock synchronization |

!!! info "Why No 6-Digit Format for Special Functions?"
    Special function codes (FC07, FC08, FC11, FC12, FC17, FC43) don't follow the 6-digit addressing scheme because they:
    
    - Operate on device-level data (not specific registers)
    - Use different request/response structures
    - Require additional parameters (Sub-Function, Object ID, Device ID)
    - Are configured through the **Modbus Wizard** with specialized fields

!!! tip "Choosing Address Mode: Zero-Based vs One-Based"
    **Most devices use 1-based addressing** (addresses start at 1), but some use 0-based (addresses start at 0). 
    
    - Check your device documentation for its addressing convention
    - Use the **Offset** button in the List Group to switch between modes globally
    - `400001` (1-based) and `400000` (0-based) both refer to the first physical holding register

#### 3. Data Type Options

| Type | Size | Range | Usage |
|------|------|-------|-------|
| **BIT** | 1 bit | 0/1 | Boolean values |
| **INT16** | 16-bit | -32,768 to 32,767 | Signed integers |
| **UINT16** | 16-bit | 0 to 65,535 | Unsigned integers (default) |
| **INT32** | 32-bit | ±2.1 billion | Large signed numbers |
| **UINT32** | 32-bit | 0 to 4.2 billion | Large unsigned numbers |
| **FLOAT32** | 32-bit | IEEE 754 | Floating point numbers |
| **INT64** | 64-bit | ±9.2×10¹⁸ | Very large integers |
| **UINT64** | 64-bit | 0 to 1.8×10¹⁹ | Very large unsigned |
| **DOUBLE64** | 64-bit | IEEE 754 | Double precision float |
| **HEX** | Variable | Hexadecimal | Raw hex display |
| **STRING** | Variable | Text | Character strings |
| **DATETIME** | Variable | Date/Time | Formatted timestamps |

#### 4. Swap Type for Multi-Register Data

When reading 32-bit or 64-bit values across multiple registers:

| Swap Type | Description | Byte Order |
|-----------|-------------|------------|
| **ABCD_BE** | Big-Endian (Default) | Most significant first |
| **CDBA_LE** | Little-Endian | Least significant first |
| **BADC_BEBS** | Big-Endian Byte Swap | Bytes swapped within words |
| **CDAB_LEBS** | Little-Endian Word Swap | Words swapped |

#### 5. Poll Rate Control Options

Configure individual monitor point polling behavior:

| Option | Behavior | Use Case |
|--------|----------|----------|
| **NONE** | Default polling | Uses global poll rate setting from Client/Server tab |
| **SKIP** | Skip polling | Exclude from automatic reads (manual trigger only) |
| **ONCE** | Poll once at startup | Read initial value only, then stop polling |
| **INTERVAL** | Custom interval | Opens dialog to set specific poll rate in milliseconds |

#### 6. Value Field Behavior

| Mode | Behavior | Interaction |
|------|----------|-------------|
| **Client Mode** | Displays polled values | Read-only, shows server data |
| **Server Mode** | Editable send values | Click to edit, sends to client |
| **Error State** | Red border | Click to see error message |

### Extended Configuration Options

#### Custom Commands (CustomQ)
Send raw Modbus commands in hexadecimal format:
```
Example: 11 04 00 6B 00 03
Usage: Custom function codes or manufacturer-specific commands
```

#### Charting Configuration  
Enable time-series visualization:
- **Axis Selection**: Choose axis 0 or 1 for multi-scale charting
- **Time Series**: Values plotted over time for trend analysis
- **Export**: Chart data saved as CSV for external analysis

#### Evaluate Limits
Set conditional formatting for value validation:
- **High Limit**: Upper threshold for acceptable values
- **Low Limit**: Lower threshold for acceptable values  
- **Nominal Range**: Values between high and low limits
- **Color Coding**: Visual indicators for each range

## 🔗 Modbus Client Operations

### Interface Configuration

The Client tab configures XPF as a Modbus Master device with comprehensive protocol support:

=== "TCP Connection Options"

    **Choose from 3 TCP protocol variants:**
    
    | Protocol | Interface | Protocol Options | Use Case |
    |----------|-----------|------------------|----------|
    | **Modbus TCP** | TCP | Default | Standard Ethernet Modbus |
    | **Modbus RTU over TCP** | TCP | RTU | Serial protocol over network |
    | **Modbus ASCII over TCP** | TCP | ASCII | ASCII protocol over network |
    
    **TCP Configuration:**
    ```yaml
    Interface: TCP
    IP Address: 192.168.1.100    # IPv4, IPv6, or hostname ("localhost")
    Modbus Port: 502             # Standard port (changeable)
    Timeout: 3000                # Connection timeout (ms)
    Protocol Options: Default/RTU/ASCII
    ```

=== "UDP Connection Options"

    **Choose from 3 UDP protocol variants:**
    
    | Protocol | Interface | Protocol Options | Use Case |
    |----------|-----------|------------------|----------|
    | **Modbus UDP** | UDP | Default | Standard UDP Modbus |
    | **Modbus RTU over UDP** | UDP | RTU | Serial protocol over UDP |
    | **Modbus ASCII over UDP** | UDP | ASCII | ASCII protocol over UDP |
    
    **UDP Configuration:**
    ```yaml
    Interface: UDP
    IP Address: 192.168.1.100    # IPv4, IPv6, or hostname
    Port: 502                    # Standard port (changeable)
    Timeout: 3000               # Response timeout (ms)
    Protocol Options: Default/RTU/ASCII
    ```

=== "Serial Connection Options"

    **Choose from 2 serial protocol variants:**
    
    | Protocol | Interface | Protocol Options | Use Case |
    |----------|-----------|------------------|----------|
    | **Modbus Serial RTU** | Serial | Default or RTU | Binary serial protocol |
    | **Modbus Serial ASCII** | Serial | ASCII | ASCII serial protocol |
    
    **Serial Configuration:**
    ```yaml
    Interface: Serial
    COM Port: COM1              # Available COM port
    Baud Rate: 9600             # 1200-115200 bps
    Data Bits: 8                # 7 or 8 bits
    Parity: None                # None, Even, Odd
    Stop Bits: 1                # 1 or 2 bits
    Protocol Options: Default/RTU/ASCII
    ```

### Timeout Settings

Critical timing parameters for reliable communication - **these settings are crucial for optimizing communication efficiency**:

| Parameter | Default | Range | Purpose & Impact |
|-----------|---------|-------|------------------|
| **Response Timeout** | 3000ms | 100-60000ms | Duration to gather all bytes from remote server including complete Modbus frame up to CRC. **Too short = false timeouts, too long = slow error detection** |
| **Inter-Frame Delay** | 20ms | 0-10000ms | Wait time between each monitor point in the list. **Prevents overwhelming slow devices or networks** |
| **Poll Rate** | 1000ms | 100-3600000ms | Delay before scanning entire list again. **Controls overall polling frequency** |

!!! tip "Timeout Optimization by Environment"
    **Fast Local Networks (LAN):**
    ```yaml
    Response Timeout: 1000ms    # Quick response expected
    Inter-Frame Delay: 5ms      # Minimal delay needed
    Poll Rate: 500ms           # Fast refresh rate
    ```
    
    **Slow Serial Connections:**
    ```yaml
    Response Timeout: 5000ms    # Allow for slow serial transmission
    Inter-Frame Delay: 50ms     # Prevent serial buffer overrun
    Poll Rate: 2000ms          # Reduce load on serial device
    ```
    
    **WAN/Internet Connections:**
    ```yaml
    Response Timeout: 10000ms   # Account for network latency
    Inter-Frame Delay: 100ms    # Prevent network congestion
    Poll Rate: 5000ms          # Conservative refresh rate
    ```

!!! warning "Critical Timing Considerations"
    These parameters directly affect:
    - **Network traffic management** - Higher delays = less network load
    - **Error detection speed** - Longer timeouts = slower fault detection  
    - **System responsiveness** - Shorter poll rates = more responsive but higher load
    - **Device compatibility** - Some devices need specific timing requirements

### Write Operations

Control how XPF handles value changes in the Value column:

| Mode | Function | Behavior |
|------|----------|----------|
| **Disabled** | Read Only | Value changes revert on next scan |
| **Auto** | Smart Write | Automatically selects single/multiple write functions |
| **Manual** | Function Select | Choose specific Modbus write function codes |

**Write Function Codes:**
- **Function 5 (0x05)**: Write Single Coil
- **Function 6 (0x06)**: Write Single Register  
- **Function 15 (0x0F)**: Write Multiple Coils
- **Function 16 (0x10)**: Write Multiple Registers

### Scanner - Modbus Address Discovery Tool

**Poll remote server to discover new Modbus Addresses or build Modbus Map for devices without public Modbus Maps.** This is invaluable when Modbus Maps are unknown or unavailable from manufacturers.

**Scanner Configuration Parameters:**

| # | Field | Format | Description |
|---|-------|--------|-------------|
| **1** | **Start** | 6-digit format | Start Address to begin scanner (e.g., 400001 for holding registers) |
| **2** | **Regs** | Number | Number of registers or polls to serially scan consecutively |
| **3** | **Data** | Data Type | Assumed Data Type. The program **automatically calculates** the number of registers (1, 2, 4) to request depending on the Data Type selected |
| **4** | **Swap** | Swap Type | Data Swap for 32-bit or 64-bit data values (ABCD, CDBA, BADC, CDAB) |
| **5** | **ID** | Byte (1-247) | Server ID (Slave ID) to start scanning |

**Scanner Process:**

1. **Configure** the range and parameters above
2. **Click "Start"** to begin systematic polling of consecutive addresses
3. **Monitor** results in real-time as scanner tests each address
4. **Valid responses** are automatically added to monitor points list
5. **Invalid addresses** are skipped (no response or error)

!!! example "Typical Scanner Usage"
    **Scenario: Unknown PLC registers**
    
    - Start: 400001 (Holding registers)
    - Regs: 100 (scan 100 consecutive registers)
    - Data: INT16 (assume 16-bit values)
    - Swap: ABCD_BE (big-endian)
    - ID: 1 (slave device 1)
    
    Scanner will poll 400001 through 400100, adding responsive registers to your monitor points list automatically.

### Charts - Data Trends Visualization

**Modbus charting is essential for anyone working with industrial automation and control systems.** With Modbus Monitor XPF, you can effortlessly visualize your Modbus data through time series, making it easier to analyze trends and patterns.

**Why Use Charts?**

- **Visualize data values over time** - See trends and patterns emerge
- **Compare multiple signals** - Track relationships between different registers
- **Identify anomalies** - Spot unusual behavior or drift
- **Performance analysis** - Evaluate system behavior under different conditions
- **Quality control** - Monitor process stability and consistency

**Chart Setup Process:**

1. **Tag Monitor Points**: To see the trending data, the monitoring point **must be tagged and included in the chart**
2. **Enable Charting**: Access via the extended button (three dots) in each monitor point row
3. **Choose Axis**: Select either **axis 0 or 1** for different Y-axis scales (useful for comparing values with different ranges)
4. **Switch View**: Click the **Chart** button in the Client tab to switch to Chart Window

**Chart Option Context Menu - Controls:**

| Button | Function | Description |
|--------|----------|-------------|
| **Save** | Export data | Saves chart data as a **CSV file** in the user documents folder for post-analysis with Excel, MATLAB, or other tools |
| **Clear** | Reset buffer | Clears all chart data from the buffer and display |
| **Fit** | Auto-scale | Adjusts the range to **fit the chart to the current view** automatically |
| **Samples** | Buffer size | Sets the buffer size to store data:<br>**0** = All data stored (chart does not pan, uses available memory)<br>**Other value** = Controls the size of the window that pans the chart by the buffer size |

!!! tip "Chart Best Practices"
    **Effective charting strategies:**
    
    - **Use dual axes** when comparing values with vastly different ranges (e.g., temperature 0-100°C on axis 0, pressure 0-3000 PSI on axis 1)
    - **Set appropriate sample buffer** - Use 0 for short tests, use limited buffer (e.g., 1000 samples) for long-term monitoring to prevent memory issues
    - **Save regularly** - Export chart data periodically during long tests
    - **Combine with Auto Save** - Use the Auto Save feature to capture all data points automatically

!!! example "Real-World Applications"
    **Process monitoring:**
    - Chart temperature, pressure, and flow rate over 8-hour shift
    - Identify process drift or instability
    - Compare against spec limits
    
    **Equipment commissioning:**
    - Monitor startup behavior
    - Verify settling time and stability
    - Document performance for baseline

### Auto Save & Restore Features

#### Auto Save Feature: Effortless Data Management
**Automatically saves every scan to CSV files** - essential for data logging and analysis:

**How it works:**
- **Every polling cycle** gets saved automatically
- **CSV files** created in your Documents folder  
- **Filenames** generated seamlessly with timestamps
- **Data instantly added** to newly created files
- **All monitoring points** included in each save

**Benefits:**
- **Zero manual work** - set it and forget it
- **Perfect for Chart analysis** - export poll data for Excel/MATLAB
- **Continuous data logging** - never lose important readings
- **Post-analysis ready** - CSV format works with all analysis tools
- **Production environments** - automatic record keeping

**Usage Example:**
```
Documents/ModbusScan_2025-10-28_14-30-15.csv
Documents/ModbusScan_2025-10-28_14-31-15.csv
Documents/ModbusScan_2025-10-28_14-32-15.csv
```

#### Restore Feature: Device Configuration & Validation
**Write monitoring data directly into remote Modbus devices** - excellent for production setup:

**Capabilities:**
- **Program remote devices** with preset values from all monitoring points
- **Production environment tool** for efficient device configuration
- **Validate configurations** by writing known values and reading back
- **Batch configuration** - set multiple parameters simultaneously
- **Quality assurance** - verify device settings match specifications

**Use Cases:**
- **Manufacturing setup**: Program devices with factory configurations
- **Commissioning**: Set operational parameters on new installations
- **Testing**: Validate device behavior with known input values
- **Maintenance**: Restore devices to known-good configurations
- **Calibration**: Set reference values for sensor calibration

### Poll Controls

| Control | Function | Usage |
|---------|----------|-------|
| **Start** | Begin continuous polling | Regular monitoring operations |
| **Stop** | End polling cycle | Stop data collection |
| **Read Once** | Single scan all points | One-time data snapshot |
| **Write Once** | Single write operation | Set value without continuous polling |

## Modbus Server (Slave) Operations

**Modbus Server or Slave can be used to learn the Modbus Protocol for beginners and simulate real-world devices for advanced developers needing millisecond responses to fine-tune the system.** The Modbus Server can be started simultaneously on both interfaces (TCP and Serial).

**Why Use Server Mode?**

- **SCADA Development**: Simulate Modbus devices for development without physical hardware
- **Learning**: Understand Modbus Protocol through hands-on experimentation
- **Testing**: Validate client implementations against known-good server
- **Device Simulation**: Replace expensive equipment during development
- **Production Setup**: Configure and test systems before hardware installation

### Server Capabilities - Multi-Interface Support

**One of the key strengths** of the Modbus Monitor XPF application is its **ability to run multiple servers with two physical interfaces simultaneously**.

- **TCP Server**: Standard Modbus TCP on port 502 (or custom port)  
- **UDP Server**: Modbus UDP for specialized applications  
- **Multiple Serial Servers**: Multiple COM ports (COM10, COM11, COM12, etc.) each with its own baud rate settings  
- **Concurrent Operation**: TCP server can run concurrently with multiple Serial Ports - all interfaces active simultaneously
- **Six Protocol Variants**: Support for all Modbus TCP, UDP, RTU, and ASCII combinations

!!! example "Multiple Servers, Multiple Interfaces"
    The image shows how the TCP and Serial sections are ready for configuration:
    
    - **Modbus TCP server** running on Port 502
    - **Modbus RTU on COM10** at 9600 baud
    - **Modbus RTU on COM11** at 19200 baud
    - **Modbus RTU on COM12** at 115200 baud
    
    All servers run **simultaneously** with independent settings!

### TCP/UDP Server Configuration

| Setting | Options | Description |
|---------|---------|-------------|
| **Interface** | TCP / UDP | Two interface types available:<br>**TCP**: Modbus TCP server started on the port when enabled<br>**UDP**: Modbus UDP server started on the port when enabled |
| **Protocol Options** | Default / RTU / ASCII | Six Modbus Protocols available:<br>**Default**: Modbus TCP or Modbus UDP (selected by interface)<br>**RTU**: Modbus RTU over TCP or Modbus RTU over UDP<br>**ASCII**: Modbus ASCII over TCP or Modbus ASCII over UDP |
| **Server Port** | Number | Port number for Modbus Server. **Default Port 502** (standard Modbus port) |
| **Server IP** | IPv4/IPv6/Both/Loopback | **IPv4**: Create server on IPv4 address range<br>**IPv6**: Create server in IPv6 address range<br>**Both**: Create server supporting both IPv4 and IPv6<br>**Loopback**: Enable to use local loopback address automatically ("127.0.0.1" or "localhost" for IPv4, "::1" for IPv6) Uncheck to specify your own address |
| **Enable** | Checkbox | **Enable**: Start Modbus TCP or UDP server<br>**Disable**: Don't start on TCP or UDP interfaces |

**Six Modbus Varieties for Server Mode** based on combination of Interface and Protocol Options:

1. Modbus TCP (Interface=TCP, Protocol=Default)
2. Modbus RTU over TCP (Interface=TCP, Protocol=RTU)
3. Modbus ASCII over TCP (Interface=TCP, Protocol=ASCII)
4. Modbus UDP (Interface=UDP, Protocol=Default)
5. Modbus RTU over UDP (Interface=UDP, Protocol=RTU)
6. Modbus ASCII over UDP (Interface=UDP, Protocol=ASCII)

### Serial (RTU/ASCII) Server Configuration

| Parameter | Options | Description |
|-----------|---------|-------------|
| **COM Port** | Available COM ports | Select the COM Port to run the Modbus RTU Server on. **Note**: Multiple COM Ports are supported, each with different communication settings. Enable all COM ports that need a server. |
| **Baud Rate** | 1200-115200 bps | Communication speed for serial connection |
| **Data Bits** | 7 / 8 bits | Character size (typically 8 bits for RTU) |
| **Parity** | None / Even / Odd | Error detection method |
| **Stop Bits** | 1 / 2 bits | Character termination |
| **Protocol** | Default/RTU/ASCII | **Default**: Start Modbus RTU server on selected COM Port<br>**RTU**: Same as default (binary protocol)<br>**ASCII**: Modbus ASCII server on selected COM Port |

### Advanced Server Features

#### Capture - Modbus Map Traffic Sniffer

**Effortlessly sniff Modbus Map traffic from connected clients and automatically build Modbus Maps.** This feature is invaluable when Modbus Maps are unknown or unavailable from manufacturers, providing a way to discover the addresses the Modbus Master is using.

**How It Works:**

When enabled, the Capture feature monitors incoming Modbus requests from clients and automatically creates monitor points based on those requests. This "learns" the Modbus map by observing real communication.

**Capture Settings:**

| Setting | Options | Description |
|---------|---------|-------------|
| **On** | Enable | Enable the addition of Modbus Monitoring points based on Modbus Requests. **Note**: The server must be running for this feature to work. |
| **Off** | Disable | Disable the Capture or Modbus Traffic sniffer |
| **Default Value 0** | Fill with zero | Fill **"0"** as the value into the newly created Modbus Map entries |
| **Auto Value** | Fill with address | Use the **Modbus Register address as the fill value** for newly created entries |

**Use Cases:**

1. **Reverse Engineering**: When you don't have documentation for a Modbus device
   - Start XPF Server on same network/port
   - Let existing client connect and communicate
   - XPF captures all register accesses automatically
   - Result: Complete Modbus map discovered from live traffic

2. **System Analysis**: Understanding existing Modbus networks
   - Place XPF between client and server (monitoring mode)
   - Capture reveals which registers are actually used
   - Identify active vs. unused registers

3. **Protocol Validation**: Testing client implementations
   - Enable capture while your client polls the server
   - Verify client is requesting correct registers
   - Check function codes and access patterns

!!! tip "Capture Best Practices"
    - **Start with clean list**: Clear monitor points before enabling capture
    - **Use Default Value 0**: Easier to identify newly captured points
    - **Let it run**: Allow all client operations to complete for full map
    - **Review results**: Captured points may need refinement (names, data types)
    - **Save immediately**: Export captured map before making changes

#### Server Start/Stop - Concurrent Operation

**Both the Modbus TCP server (when Enabled) and Modbus RTU server start simultaneously (when the COM port is selected).**

**Server Control:**

- **Single Button**: One Start/Stop control manages all enabled servers
- **TCP Server**: Starts if Interface is set to TCP or UDP and Enable is checked
- **Serial Servers**: Start automatically for all selected COM ports
- **Simultaneous Start**: All configured servers start together
- **Independent Operation**: Each server operates independently once started
- **Clean Shutdown**: Stop button properly closes all server connections

**Status Indicators:**

- **Running**: Button shows "Stop" and servers are active
- **Stopped**: Button shows "Start" and no servers are running
- **Connection Count**: (if displayed) Shows number of active client connections

!!! tip "Multiple Server Strategy"
    **Common configuration patterns:**
    
    - **Development**: TCP on port 502 for SCADA testing
    - **Integration**: TCP + Serial for mixed client testing  
    - **Production Simulation**: Multiple serial ports for multi-device emulation
    - **Protocol Testing**: Same data on TCP and Serial for comparison

#### Multiple Server Instances - Advanced Setup

Run multiple servers for complex testing scenarios:

**Multiple Servers, Single Interface:**

It is common practice to run **multiple instances** of the server on the same interface, such as TCP, by running multiple instances of the Modbus Monitor XPF application, each with different TCP port numbers.

**Example Configuration:**

- **Instance 1**: Modbus TCP on Port 502 (standard)
- **Instance 2**: Modbus RTU over TCP on Port 602
- **Instance 3**: Modbus TCP on Port 503 (alternate device)

Each instance:
- Runs as separate XPF application window
- Has its own Modbus map configuration
- Responds independently to client requests
- Simulates different devices or device types

**Benefits:**

- **Different Ports**: Multiple TCP servers on different ports
- **Mixed Protocols**: TCP + multiple serial interfaces simultaneously
- **Device Simulation**: Each server represents different device type or model
- **Load Testing**: Multiple servers for testing client handling of multiple devices

## IoT Integration - MQTT & Cloud Connectivity

!!! info "Feature Documentation In Progress"
    The MQTT and IoT integration features are available in Modbus Monitor XPF. Comprehensive documentation for these features is currently being prepared and will be added soon.

### MQTT Protocol Support

Modbus Monitor XPF includes **MQTT messaging** capabilities for cloud and device communication, enabling IoT integration scenarios.

**Key Capabilities** (Documentation forthcoming):

- **MQTT Client**: Connect to MQTT brokers for data publishing
- **Topic Mapping**: Map Modbus registers to MQTT topics
- **Bi-directional**: Support for both publishing (Device-to-Cloud) and subscribing (Cloud-to-Device)
- **QoS Levels**: Quality of Service configuration options
- **TLS/SSL**: Secure connections to cloud platforms

### IoT Platform Integration

**ThingSpeak Cloud Logging:**

ThingSpeak integration provides cloud-based data logging and visualization capabilities.

*(Detailed configuration and usage documentation will be added here)*

**MQTT Broker Connection:**

Connect to popular MQTT brokers including:

- AWS IoT Core
- Azure IoT Hub
- Eclipse Mosquitto
- HiveMQ
- Other standard MQTT brokers

*(Detailed configuration and usage documentation will be added here)*

### Use Cases for IoT Integration

**Potential Applications:**

1. **Remote Monitoring**: Push Modbus data to cloud for remote access
2. **Data Aggregation**: Collect data from multiple sites to central cloud platform
3. **Alert/Notification**: Trigger cloud-based alerts on Modbus events
4. **Historical Logging**: Store long-term data in cloud databases
5. **Mobile Access**: Access Modbus data via cloud-connected mobile apps

!!! note "Coming Soon"
    Detailed step-by-step guides for MQTT configuration, ThingSpeak setup, and IoT platform integration will be added to this section. Check back for updates or contact support for assistance with IoT features.

## 🔧 Advanced Features & Tips

### Magic Code Reference

Quick reference for Name field enhancement codes:

| Code | Format | Purpose | Example |
|------|--------|---------|---------|
| **String Length** | `:nn` | Multi-register strings | `Device_Name:16` |
| **Poll Rate** | `@nnnn` | Custom timing (ms) | `Status@5000` |
| **Bit Access** | `.n` | Single bit from register | `Alarm_Status.7` |
| **Date/Time** | `DTx` | Timestamp conversion | `Timestamp_DT6` |
| **Combined** | Multiple | Complex configurations | `Data@1000:8.5` |

### Performance Optimization

#### Network Optimization
```yaml
Fast LAN:
  Response Timeout: 1000ms
  Inter-Frame Delay: 5ms
  Poll Rate: 500ms

Slow Serial:
  Response Timeout: 5000ms
  Inter-Frame Delay: 50ms
  Poll Rate: 2000ms

WAN/Internet:
  Response Timeout: 10000ms
  Inter-Frame Delay: 100ms
  Poll Rate: 5000ms
```

#### Memory Management
- **Disable Logging**: Turn off when not needed
- **Limit Chart Buffer**: Set samples to reasonable size
- **Filter Data**: Use evaluate filters to reduce display load

### Troubleshooting Guide

#### Common Connection Issues

| Problem | Symptoms | Solution |
|---------|----------|----------|
| **Timeout Errors** | Red border in Value field | Check network, increase timeout |
| **Wrong Values** | Unexpected data | Verify swap type and data type |
| **No Response** | All values show errors | Check IP address, port, Unit ID |
| **Slow Performance** | Delayed updates | Optimize poll rates and timing |

#### Error Message Analysis
Click on red-bordered Value cells to see detailed error messages:
- **Connection Refused**: Server not running or wrong port
- **Timeout**: Network issues or device not responding  
- **Illegal Function**: Unsupported Modbus function code
- **Illegal Address**: Register address not available on device

### Best Practices

#### Configuration Management
1. **Save Frequently**: Use CSV format for easy backup
2. **Document Settings**: Include descriptive names for monitor points
3. **Version Control**: Keep multiple versions of configurations
4. **Test Offline**: Use server mode to validate configurations

#### Production Deployment
1. **Validate Configuration**: Test thoroughly before production use
2. **Monitor Performance**: Watch for timeout errors and timing issues
3. **Plan Maintenance**: Schedule configuration updates during downtime
4. **Backup Data**: Regular exports of historical data

#### Security Considerations
1. **Network Isolation**: Use VPNs or isolated networks for Modbus
2. **Access Control**: Limit who can modify configurations
3. **Audit Logging**: Enable communication logs for security monitoring
4. **Regular Updates**: Keep XPF updated with latest security patches

---

## Additional Resources

### Learning Materials
- **[YouTube Tutorials](https://www.youtube.com/@ModbusMonitor/videos)** - Step-by-step video guides
- **[Technical Documentation](../../technical/index.md)** - Protocol details and integration guides  
- **[Community Forum](https://quantumbitsolutions.com/forums/)** - User discussions and support

### Support Options
- **Email Support**: Direct assistance for licensed users
- **Online Help**: Comprehensive web-based documentation
- **Professional Support**: Premium support plans available

### Related Products  
- **[Android Monitor](../android/advanced-guide.md)** - Mobile Modbus monitoring
- **[Modbus Mapper Pro](../mapper/user-manual.md)** - Network analysis and protocol sniffing
- **[Custom Solutions](../custom/overview.md)** - Tailored development services

!!! success "Ready to Get Started!"
    With this comprehensive guide, you're equipped to use Modbus Monitor XPF for all your Modbus communication needs. Start with the Quick Start section, then dive deeper into specific features as needed.

    **Installation Steps:**
    1. Download server edition
    2. Install via command line: `setup.exe /S`
    3. Configure as Windows Service
    4. Access via web interface

=== "Linux (Wine)"

    **Experimental Support:**
    1. Install Wine: `sudo apt install wine`
    2. Download Windows version
    3. Run: `wine ModbusMonitorXPF-Setup.exe`
    
    !!! warning "Limited Support"
        Linux support is experimental. Consider native alternatives.
3. **First Launch**
- Open Modbus Monitor XPF
- Configure your first connection
- Start monitoring!

## Configuration

### Connection Setup

| Parameter | Description | Example |
|-----------|-------------|---------|
| IP Address | Target device IP | 192.168.1.100 |
| Port | Modbus TCP port | 502 |
| Unit ID | Device unit identifier | 1 |
| Timeout | Connection timeout (ms) | 3000 |

### Register Configuration

!!! example "Sample Register Setup"
 ```
 Register 40001: Temperature Sensor
 Register 40002: Pressure Reading  
 Register 40003: Flow Rate
 ```

## User Interface

### Main Window Layout

The XPF interface consists of:

- **Menu Bar**: File operations and settings
- **Toolbar**: Quick access buttons
- **Connection Panel**: Device management
- **Data View**: Real-time values
- **Log Panel**: Communication history

## Advanced Features

### Data Export

Export your monitoring data in multiple formats:

- [x] CSV files
- [x] Excel spreadsheets  
- [x] PDF reports
- [x] JSON format

### Scripting Support

XPF supports automation through:

```python
# Example automation script
import xpf_api

# Connect to device
device = xpf_api.connect("192.168.1.100", 502)

# Read registers
temp = device.read_holding_register(40001)
print(f"Temperature: {temp}°C")
```


??? note "Advanced Configuration"
    This section contains advanced settings...


- [x] Download installer
- [x] Run installation  
- [ ] Configure settings
- [ ] Test connection


```mermaid
graph LR
    A[PC] --> B[Modbus TCP]
    B --> C[PLC Device]
    C --> D[Sensors]
```

```mermaid
graph LR
    A[Edit Locally] --> B[Test with mkdocs serve]
    B --> C[Commit & Push]  
    C --> D[GitHub Actions Build]
    D --> E[Deploy to Pages]
    E --> F[Live Site Updated]
```

## System Architecture

```mermaid
graph TD
    A[User PC] -->|Modbus TCP/IP| B[Network Switch]
    B --> C[PLC Controller]
    B --> D[HMI Panel] 
    C --> E[Field Devices]
    C --> F[Sensors]
    
    style A fill:#e1f5fe
    style C fill:#fff3e0
    style E fill:#f3e5f5
```
