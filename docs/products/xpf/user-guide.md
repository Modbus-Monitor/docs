

# Modbus Monitor XPF - User Guide

**A practical guide for controls engineers and technicians**

[TOC]

## 1. Introduction

**Modbus Monitor XPF** is a Windows application for working with Modbus devices. It handles both Client (Master) and Server (Slave) operations and supports all common Modbus variants: TCP/IP, Serial RTU, Serial ASCII, and RTU/ASCII over TCP.

![Modbus Monitor XPF Main Interface](../../assets/screenshots/xpf-main-interface.webp){ .screenshot-shadow }

**What you can do with it:**
- Monitor live data from PLCs, drives, meters, and other Modbus devices
- Write values to registers and coils for testing or control
- Simulate Modbus devices for testing your own equipment
- Scan unknown devices to discover their register maps
- Log data for analysis and troubleshooting
- Validate register values against expected ranges

**Who this is for:**
- Controls engineers commissioning systems
- Maintenance technicians troubleshooting communications
- System integrators testing device compatibility  
- Equipment manufacturers validating Modbus implementations

### What Makes This Different

Most Modbus tools are either simple monitors or complex SCADA packages. XPF sits in the middle - it's powerful enough for serious work but simple enough to use quickly. The key advantages:

1. **Runs both Master and Slave simultaneously** - Test client-server interactions on one PC
2. **Pre-built device maps** - No manual register setup for common equipment
3. **Built-in data validation** - Automatic pass/fail testing with color coding
4. **Professional logging** - Proper timestamped records for troubleshooting

### System Requirements

- Windows 10 or 11 (64-bit recommended)
- .NET Framework 4.8 or later
- 4GB RAM minimum, 8GB recommended
- Serial ports (USB-to-serial adapters work fine)
- Network access for TCP/IP communications

!!! note "Field Laptop Tip"
    XPF works well on industrial laptops. The portable version doesn't require installation - just copy to a USB drive and run it anywhere.

## 2. Installation & Activation

### Getting the Software

=== "Microsoft Store"

    **Universal - Works on both 32-bit and 64-bit Windows**
    
    - **Automatic updates** and license management
    - **No admin rights** needed for installation
    - **Best for hobbyists** and multi-computer setups
    - **License per user** (not per machine)
    
    [:material-microsoft-windows: Get from Microsoft Store](ms-windows-store://pdp/?productid=9PG862WL5HSM){ .md-button .md-button--primary }

=== "Direct Download"

    **Choose your architecture and installation type:**

    | Architecture | Installer (Permanent Setup) | Portable (No Install) |
    |-------------|------------------------------|------------------------|
    | **64-bit** *(Recommended for modern systems)* | [:material-download: x64 Installer](https://quantumbitsolutions.com/download/ModbusMonitor_XPF_x64_Installer.zip){ .md-button } | [:material-download: x64 Portable](https://quantumbitsolutions.com/download/Modbus_Monitor_XPFx64.zip){ .md-button } |
    | **32-bit** *(Older systems only)* | [:material-download: x86 Installer](https://quantumbitsolutions.com/download/ModbusMonitor_XPF_x86_Installer.zip){ .md-button } | [:material-download: x86 Portable](https://quantumbitsolutions.com/download/Modbus_Monitor_XPFx86.zip){ .md-button } |

    **What's the difference?**
    
    - **Installer:** Creates shortcuts, integrates with Windows, faster startup
    - **Portable:** No installation needed, run from USB drives, good for field work
    - **64-bit:** Works on modern Windows (2010+), handles large datasets better  
    - **32-bit:** Only needed for older Windows systems or embedded PCs

=== "Purchase"

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

**Trial Version:**
- Full functionality for evaluation period
- No credit card required
- All features available during trial

**Purchasing a License:**
1. **Get your UID first** - Copy it from the license screen before buying
2. **Buy online** - Use your UID when purchasing at quantumbitsolutions.com
3. **Microsoft Store** - Purchase and activation happen automatically
4. **Enterprise/Site licenses** - Contact sales for multiple installations

**Activation Steps:**
1. Open XPF
2. Click "Activate" button
3. Enter your license key from the purchase email
4. Click "Verify" - should show "Licensed" status

### Common Installation Issues

**"Won't start" or crashes:**
- Install latest .NET Framework from Microsoft
- Run as Administrator (right-click → Run as Administrator)
- Check Windows Defender isn't blocking it

**Serial ports not showing:**
- Install drivers for your USB-to-serial adapter
- Check Device Manager for COM port assignments
- Some cheap adapters need specific drivers

**Network connection problems:**
- Windows Firewall may block Modbus TCP (port 502)
- Add firewall exception for XPF if needed
- Corporate networks sometimes block non-standard ports

### System Requirements

=== "64-bit Version (Recommended)"

    | Component | Requirement | Notes |
    |-----------|-------------|--------|
    | **OS** | Windows 10/11 x64 | Most modern systems |
    | **RAM** | 4 GB minimum, 8 GB+ recommended | More memory = better performance |
    | **Storage** | 100-500 MB free space | Depends on log file size |
    | **.NET** | Framework 4.8+ | Usually pre-installed |
    | **Ports** | USB or Ethernet | For Modbus connections |

=== "32-bit Version"

    | Component | Requirement | Notes |
    |-----------|-------------|--------|
    | **OS** | Windows 10/11 x86 | Older or embedded systems |
    | **RAM** | 2-4 GB | 32-bit limit is ~3.5 GB total |
    | **Storage** | 100 MB free space | Smaller footprint |
    | **.NET** | Framework 4.8+ | Same as 64-bit |
    | **Ports** | USB or Ethernet | Full feature compatibility |

=== "Field Laptop Setup"

    **For industrial/field use:**
    
    - **Rugged laptop** with serial ports
    - **USB-to-RS485** converters (industrial grade)
    - **Ethernet port** for Modbus TCP
    - **Offline installation** capability
    - **Administrator rights** for driver installation

## 3. Understanding the Interface

### Main Window Layout

When you open XPF, you'll see a ribbon interface similar to Excel. Here's what matters:

**Top Section (Ribbon Tabs):**
- **File** - Open/save configurations, licensing, settings
- **Home** - Daily operations, copy/paste, add/remove monitor points  
- **Client** - Settings when acting as Modbus Master
- **Contextual tabs** - Appear when you activate features like logging

**Bottom Section (Data Area):**
- **Monitor Points table** - Shows your register list and live values
- **Switch views** - Log view, Chart view, Online Maps (toggle buttons in ribbon)

### Key Concepts

**Monitor Points:** Each row represents one Modbus address you want to read or write. Think of it as your "shopping list" of registers.

**Client vs Server Mode:** 
- **Client (Master)** - You initiate communication, polling devices for data
- **Server (Slave)** - You simulate a device, responding to other masters

**Magic Codes:** Special text you add to register names for advanced features (covered in Advanced Features section).

### Navigation Tips

**Quick Access Toolbar:** Customize this with your most-used functions (Save, Start/Stop polling, etc.)

**Right-click menus:** Most tables and fields have context menus with relevant options.

**Keyboard shortcuts:**
- `Ctrl+S` - Save current configuration
- `Ctrl+O` - Open saved configuration  
- `Ctrl+C/V` - Copy/paste monitor points (works with Excel too)
- `F5` - Refresh/update display

!!! tip "Workflow Tip"
    Set up your monitor points first, then configure communication settings. Save frequently - especially before making big changes.

=== "Microsoft Store (Recommended)"

    **Easiest Installation Method:**
    
    1. **Search** for "Modbus Monitor XPF" in Microsoft Store
    2. **Install** directly from the store
    3. **Launch** from Start Menu
    4. **Activate** license through the store
    
    [:material-microsoft-windows: Open Microsoft Store](ms-windows-store://pdp/?productid=9PG862WL5HSM){ .md-button .md-button--primary }

=== "Direct Download"

    **Portable Version:**
    
    1. **Visit** [QuantumBitSolutions Download Page](https://quantumbitsolutions.com/purchase/)
    2. **Download** the portable executable
    3. **Run** from any location (no installation required)
    4. **First Launch** may have slight delay (unpacking files)
    
    [:material-download: Download Portable](https://quantumbitsolutions.com/purchase/){ .md-button }

### System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| **OS** | Windows 10 | Windows 11 |
| **RAM** | 4 GB | 8 GB |
| **Storage** | 100 MB | 500 MB |
| **.NET** | Framework 4.8+ | Latest Version |

### License Activation

#### License Types Available

| License Type | Features | Purchase Method |
|--------------|----------|-----------------|
| **Trial** | Full features, time-limited | Free evaluation |
| **Standard** | Complete functionality | Microsoft Store or Online |
| **Site License** | Multiple installations | Contact sales |
| **Offline License** | Air-gapped environments | Special request |

#### Activation Process

1. **Get Your UID**: Copy the unique User Identification from the license screen
2. **Purchase License**: Use the UID when purchasing online or through Microsoft Store  
3. **Activate**: 
   - **Microsoft Store**: Click "Store" button in license screen
   - **Online Key**: Click "Activate" and enter your license key
   - **License File**: Use "Load" button for site/offline licenses

![License Window](../../assets/screenshots/xpf-license-window.webp){ .screenshot-shadow }

!!! warning "License Requirements"
    Your **UID (User Identification)** is required when purchasing. Copy it before visiting the store!

## 🏠 Application Interface

### Main Window Layout

The Modbus Monitor XPF interface is organized into several key areas:

```mermaid
graph TB
    QAT[Quick Access Toolbar<br/>Save, Undo, Redo]
    TABS[Ribbon Tabs<br/>File, Home, Client]
    COMMANDS[Command Buttons<br/>Add Device, Delete, Configure]
    LAUNCHER[Dialog Launcher<br/>Advanced Options]
    PORTAL[Window Portal Area<br/>Monitor Points / Log View / Online Maps]
    
    QAT --> TABS
    TABS --> COMMANDS  
    COMMANDS --> LAUNCHER
    COMMANDS --> PORTAL
    
    style QAT fill:#e3f2fd
    style TABS fill:#fff3e0
    style COMMANDS fill:#f3e5f5
    style PORTAL fill:#e8f5e8
```

### Ribbon Tabs Overview

| Tab | Purpose | Key Features |
|-----|---------|--------------|
| **📁 File** | File operations & settings | Open/Save, Recent files, Licensing, Themes |
| **🏠 Home** | Daily operations | Copy/Paste, Modbus Wizard, List management |
| **🔗 Client** | Modbus Client (Master) | Interface config, Polling, Charts, Scanner |
| **⚙️ Contextual** | Context-sensitive options | Log Options, Chart Options (when active) |

## 🏠 Home Tab - Essential Operations

### File Operations

| Feature | Description | Usage |
|---------|-------------|-------|
| **💾 Save** | Save current Modbus map as CSV | Preserves configuration for reuse |
| **📂 Open** | Load previously saved map | Quick setup from saved files |
| **☁️ Online** | Access cloud-based maps | Community and factory maps |

### Clipboard Management

| Operation | Shortcut | Description |
|-----------|----------|-------------|
| **📋 Paste** | `Ctrl+V` | Paste from clipboard or Excel |
| **📄 Copy** | `Ctrl+C` | Copy selected rows |
| **✂️ Cut** | `Ctrl+X` | Copy and remove rows |

!!! tip "Excel Integration"
    You can copy monitor points directly from Excel and paste them into XPF. Use `Shift+Click` for sequential selection or `Ctrl+Click` for multiple rows.

### 🧙‍♂️ Modbus Wizard

The **Modbus Wizard** simplifies adding monitor points through a graphical interface:

![Modbus Wizard Interface](../../assets/screenshots/xpf-modbus-wizard.webp){ .screenshot-shadow }

**Wizard Operations:**
- **👁️ View**: Examine existing monitor point configuration
- **✏️ Edit**: Modify Modbus function, address, data type using dropdown menus
- **➕ Add**: Create new monitor points with guided setup

### List Management

| Button | Function | Description |
|--------|----------|-------------|
| **➕ Add** | Add monitor point | Creates new row with incremented address |
| **➖ Remove** | Delete selected | Removes single or multiple selected points |
| **❌ Delete All** | Clear list | Removes all monitor points |
| **🔢 Offset** | Address base | Toggle between 0-based (0-65535) or 1-based (1-65536) |
| **🆔 ID** | Change Unit ID | Update Unit ID for all monitor points |

### Filter & Search

![Filter Interface](../../assets/screenshots/xpf-home-tab.webp){ .screenshot-shadow }

| Component | Function |
|-----------|----------|
| **Row Index** | Shows currently selected row position |
| **Filter Text** | Search in Name and Address fields |
| **Total Rows** | Display total/filtered monitor points |
| **ID Filter** | Filter by Unit ID (Slave ID) |
| **Clear** | Reset filter to show all rows |

### 📊 Evaluate (Validation & Testing)

The **Evaluate** feature provides visual validation of Modbus values using conditional formatting:

![Evaluate Settings](../../assets/screenshots/xpf-evaluate-limits.webp){ .screenshot-shadow }

**Value Range Testing:**
- **🟢 Nominal**: Values within acceptable range (between Low and High limits)
- **🟡 High Limit**: Values at or above high threshold  
- **🔴 Low Limit**: Values at or below low threshold
- **🎨 Color Coding**: Automatic background coloring based on limits

**Configuration Options:**
- **✅ Enable/Disable**: Toggle evaluation for individual points
- **🎨 Color Selection**: Choose colors for each range
- **📝 String Limits**: Set same High/Low limits for text data
- **🔄 Auto Update**: Refresh display after each scan

### 📋 Events and Communication Log

Switch between Monitor Points view and Events Log for detailed communication analysis:

**Log Features:**
- **🔄 Start/Stop**: Control communication logging
- **🗑️ Clear**: Remove all log entries  
- **💾 Save As**: Export logs to text file
- **⚠️ Errors Only**: Filter to show only error events
- **📜 Auto Scroll**: Follow latest communication events
- **⏰ Timestamps**: All events include UTC timestamps

!!! warning "Performance Impact"
    Event logging consumes more processing power and memory. Turn off when not needed for better performance.

## 🌐 Online Maps Feature

Access pre-built Modbus maps from the cloud or share your configurations with the community:

![Online Maps Interface](../../assets/screenshots/xpf-online-maps.webp){ .screenshot-shadow }

### Downloading Factory Maps

1. **Click** "Factory" icon and wait for cloud update
2. **Select** device from the available list
3. **Click** "Download" button
4. **Wait** for green checkmark confirmation
5. **Map opens** automatically when download completes

### Sharing Community Maps

1. **Click** "Community" icon
2. **Click** "Share" and select your XPF map file
3. **Wait** for green checkmark (upload success)
4. **Refresh** community list to see your contribution

| Icon | Function | Description |
|------|----------|-------------|
| **❌ Back** | Close navigator | Return to previous view |
| **🏭 Factory** | Official maps | Validated maps from manufacturer |
| **👥 Community** | User maps | Maps shared by community |
| **📤 Share** | Upload map | Contribute your map to community |
| **📥 Download** | Get map | Download selected map |
| **✅ Status** | Progress | Green=success, Red=error |

## 📊 Monitor Points Configuration

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

The address system combines function code with register number:

| Function Code | Address Prefix | Type | Access |
|---------------|----------------|------|---------|
| **Function 1** | `0x` | Coils | Read/Write |
| **Function 2** | `1x` | Discrete Inputs | Read Only |
| **Function 3** | `4x` | Holding Registers | Read/Write |
| **Function 4** | `3x` | Input Registers | Read Only |

**Examples:**
- `400001` = First holding register (1-based)
- `400000` = First holding register (0-based)  
- `300001` = First input register (1-based)
- `000001` = First coil (1-based)
- `100001` = First discrete input (1-based)

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

#### 5. Value Field Behavior

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

### Scanner Tool

Discover unknown Modbus addresses automatically:

**Scanner Configuration:**
1. **Start Address**: Beginning address in 6-digit format (e.g., 400001)
2. **Register Count**: Number of consecutive registers to scan
3. **Data Type**: Assumed data format for proper register calculation
4. **Swap Type**: Byte order for multi-register values
5. **Unit ID**: Target slave ID for scanning

**Scanner Process:**
1. Configure range and parameters
2. Click "Start" to begin systematic polling
3. Monitor results in real-time
4. Valid responses automatically added to monitor points list

### Chart Visualization

Transform monitor point data into time-series charts:

**Chart Setup:**
1. **Enable Charting**: Mark monitor points for charting in extended options
2. **Select Axis**: Choose axis 0 or 1 for different scales
3. **Switch View**: Click "Chart" button to open chart window

**Chart Controls:**
- **💾 Save**: Export chart data as CSV
- **🗑️ Clear**: Reset chart data buffer
- **🔍 Fit**: Auto-scale view to current data
- **📊 Samples**: Set buffer size (0 = unlimited, other = rolling window)

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
| **▶️ Start** | Begin continuous polling | Regular monitoring operations |
| **⏸️ Stop** | End polling cycle | Stop data collection |
| **1️⃣ Read Once** | Single scan all points | One-time data snapshot |
| **✍️ Write Once** | Single write operation | Set value without continuous polling |

## 🖥️ Modbus Server Operations

XPF can simultaneously operate as both Client and Server, providing complete Modbus simulation capabilities.

### Server Capabilities

**Multi-Interface Support:**
- ✅ **TCP Server**: Standard Modbus TCP on port 502
- ✅ **UDP Server**: Modbus UDP for specialized applications  
- ✅ **Multiple Serial**: Multiple COM ports with different settings
- ✅ **Concurrent Operation**: All interfaces can run simultaneously

### TCP Server Configuration

| Setting | Options | Description |
|---------|---------|-------------|
| **Interface** | TCP/UDP | Choose network protocol |
| **Protocol** | Default/RTU/ASCII | Modbus variant over network |
| **Port** | 502 (default) | TCP/UDP port number |
| **IP Binding** | IPv4/IPv6/Both | Address family support |
| **Loopback** | Enabled/Disabled | Local testing vs network access |

### Serial Server Configuration

| Parameter | Options | Description |
|-----------|---------|-------------|
| **COM Port** | Available ports | Physical/virtual serial ports |
| **Baud Rate** | 1200-115200 | Communication speed |
| **Data Bits** | 7/8 | Character size |
| **Parity** | None/Even/Odd | Error detection |
| **Stop Bits** | 1/2 | Character termination |
| **Protocol** | RTU/ASCII | Modbus serial variant |

### Advanced Server Features

#### Traffic Capture (Sniffing)
Automatically build Modbus maps from client requests:

**Capture Settings:**
- **Enable**: Turn on automatic map building
- **Default Value**: Use 0 or register address as initial value
- **Auto Discovery**: Learn client communication patterns

**Use Cases:**
- **Reverse Engineering**: Discover unknown device maps
- **System Analysis**: Understand existing Modbus networks  
- **Testing**: Validate client behavior patterns

#### Simulation Capabilities
Generate realistic sensor data for testing:
- **Dynamic Values**: Simulate changing sensor readings
- **Pattern Generation**: Create predictable test data
- **Scenario Testing**: Validate client applications

#### Multiple Server Instances
Run multiple servers for complex testing:
- **Different Ports**: Multiple TCP servers on different ports
- **Mixed Protocols**: TCP + multiple serial interfaces
- **Device Simulation**: Each server represents different device type

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

## 📚 Additional Resources

### Learning Materials
- 🎥 **[YouTube Tutorials](https://www.youtube.com/@ModbusMonitor/videos)** - Step-by-step video guides
- 📖 **[Technical Documentation](../../technical/index.md)** - Protocol details and integration guides  
- 💬 **[Community Forum](https://quantumbitsolutions.com/forums/)** - User discussions and support

### Support Options
- 📧 **Email Support**: Direct assistance for licensed users
- 🌐 **Online Help**: Comprehensive web-based documentation
- 📞 **Professional Support**: Premium support plans available

### Related Products  
- 📱 **[Android Monitor](../android/advanced-guide.md)** - Mobile Modbus monitoring
- 🗺️ **[Modbus Mapper Pro](../mapper/user-manual.md)** - Network analysis and protocol sniffing
- ⚙️ **[Custom Solutions](../custom/overview.md)** - Tailored development services

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

## 📊 System Architecture

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