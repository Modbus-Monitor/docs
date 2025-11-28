!!! warning "📝 Document In Progress"
    This documentation is currently under construction. Content, examples, and diagrams are being updated and refined. Check back soon for the complete guide.

# Modbus Mapper Pro - User Manual

**Revolutionize Modbus Monitoring: See, Decode, and Analyze Like Never Before**
![Modbus Mapper Pro](../../assets/screenshots/mapper/modbus-mapper-concept.webp){ .screenshot-center loading="lazy" }


## Overview

**Modbus Mapper Pro** is software designed to help you understand, monitor, and troubleshoot Modbus devices **without interrupting your existing system**.

It excels at **real-time data monitoring, transparent Modbus RTU pass-through**, and **traffic sniffing**, giving you powerful tools to observe, analyze, and bridge Modbus communication live. The core architecture combines **transparent forwarding + protocol sniffing**, allowing you to:

- Sniff traffic (ideal for RS485)
- Use RS232 pass-through mode
- Multiplex RS232 or RS485 lines so multiple systems can share a single Modbus device — without special hardware

Think of it like this: your devices are already talking over RS485 cables. **Modbus Mapper Pro lets you watch, forward, or share that communication safely**.

**Three Simple Things It Does:**

1. **Spy on existing communication** (Mode 1: Listen Only Mode)   

      - Connect to a live RS485 line and watch devices talk
      - See every request and response in real time
      - Automatically discover register addresses without documentation   
      - Zero risk — the software does not transmit anything

2. **Forward and monitor** (Mode 2: Pass-Through Mode)
   
      - Place Modbus Mapper Pro between a master and slave
      - Traffic flows normally while you watch every frame
      - View decoded data, timing, CRC, and register details
      - Ideal for debugging communication issuesPlace Mapper Pro between two devices

3. **Share one device** (Mode 3: Multiplex Mode)
      - Let multiple systems access one Modbus device safely
      - No special converters or splitters required
      - Mapper Pro manages timing to prevent collisions
      - Works like a smart, software-based splitter

**What You Get:**

- Automatic discovery of all registers being used
- Clear, human-readable values instead of raw hex
- Real-time charts, logs, and decoded Modbus frames
- Easy export for documentation and analysis
- Portable, No installation required — just run the application

!!! info "Professional Modbus RTU Analysis Tool"

    **Modbus Mapper Pro** is a powerful application built to simplify and solve the most challenging aspects of Modbus RTU communication. It is designed for system integrators, troubleshooters, automation engineers, and OEMs who need to understand, monitor, and optimize Modbus networks **without interrupting existing operations.**

## Understanding the User Interface

![Modbus Mapper PRO UI](../../assets/screenshots/mapper/modbus-mapper-pro-ui.webp){ .screenshot-center loading="lazy" }

Before you start, let's get familiar with the application layout. These are the key components you'll see:


| # | Component | Purpose |
|---|-----------|---------|
| 1 | **Communications** | Configure COM port, baud rate, and connection settings for your RS485 adapter |
| 2 | **Client Request Viewer** | Real-time log showing all Modbus requests being sent to your device |
| 3 | **Live Modbus Map** | Table view of discovered registers with live values updating in real-time |
| 4 | **Traffic Log** | Raw Modbus message exchanges with timestamps for debugging and analysis |
| 5 | **Licensing** | Activate your license key when first launching (appears as modal dialog if needed) |
| 6 | **Settings & Help** | Access documentation, preferences, advanced options, and timeouts |
| 7 | **Server Port** | RS485 connection for Listen-Only (Mode 1), Pass-Through (Mode 2), or Multiplex (Mode 3) |
| 8 | **Client 1 Port** | First Modbus client connection for Pass-Through (Mode 2) or Multiplex (Mode 3) modes |
| 9 | **Client 2 Port** | Second Modbus client connection for Multiplex (Mode 3) mode only |
| 10 | **Control Panel** | LED status indicators and Start/Stop buttons for operations |
| 11 | **Mode Button** | Toggle between Listen Only (On for Mode 1), Pass-Through (Off for Mode 2), and Multiplex operating modes (Off for Mode 3) |

**Pro Tip:** Spend a minute familiarizing yourself with these components now. You'll refer back to them as we work through the steps below.



## Quick Start Guide

### Understanding Operating Modes

Modbus Mapper Pro has three ways to work. Pick one based on what you need:

| Mode | Name | What It Does | Works With | Best For |
|------|------|--------------|------------|----------|
| 🔍 **Mode 1** | Listen Only | Watch traffic without touching anything | **RS485 only** (non-intrusive tap) | Learning, troubleshooting, discovery |
| 🔄 **Mode 2** | Pass-Through | Forward traffic while monitoring | RS232 or RS485 | Debugging, integration testing |
| 🔌 **Mode 3** | Multiplex | Share one device with multiple systems | RS232 or RS485 | Multi-master setups, cost savings |

!!! tip "Start Here"
    **New to Modbus?** Start with **Mode 1 (Listen Only)** — the safest option for RS485 networks. Just tap in, watch, and learn — you can't break anything!
    
!!! info "RS485 vs RS232"
    - **Mode 1** requires **RS485** for non-intrusive monitoring (tapping into existing network)
    - **Mode 2 & 3** work with both **RS232** and **RS485** (requires reconfiguring connections)

!!! info "Want More Details?"
    See **[Visual Overview: All Three Modes](#visual-overview-all-three-modes)** for detailed diagrams and **[Operating Modes Deep Dive](#operating-modes-deep-dive)** for expert-level explanations.


## Getting Started

### System Requirements
- **Computer:** Windows 10 or Windows 11
- **Connection:** USB-to-RS485 adapter (about $15-30 online)
- **That's it!** Nothing else needed

Optional: A physical RS485 cable "tap" if you want to spy on existing cables without disconnecting them.

### Installation Options

**Pick One Way to Get It:**

#### Option 1: Download & Extract (Easiest)

1. Go to **QuantumBitSolutions.com**
2. Click Download
3. Extract the file
4. Click the .exe to run it
5. Done! No installation hassles.

!!! note "First Time?"
    The first time you run it, it might take a few seconds to set itself up. That's normal.

#### Option 2: Microsoft Store (For IT Teams)

1. Open Microsoft Store on your computer
2. Search for "Modbus Mapper Pro"
3. Click Install
4. Find it in your Start Menu
5. Done!

### Quick Setup

=== "32-bit Version"

    **For older systems and embedded PCs:**
    
    [:material-download: Download 32-bit](https://quantumbitsolutions.com/download/ModbusMapperPro_x86.zip){ .md-button }

=== "64-bit Version"  

    **For modern Windows systems:**
    
    [:material-download: Download 64-bit](https://quantumbitsolutions.com/download/ModbusMapperPro_x64.zip){ .md-button }

=== "Microsoft Store"

    **For managed environments:**
    
    [:material-microsoft-windows: Get from Store](https://www.microsoft.com/store/apps/9P2BP76MNTXV){ .md-button }

### Step 1: Installation and Launch

**After downloading and extracting the application:**

1. **Extract files** to your desired location (portable - no installation needed)
2. **Connect your RS485 adapter** to your Modbus RTU network
3. **Launch the application** by running the executable

### Step 2: Choose Your Operating Mode

For this quick start guide, we'll use **Mode 1 - Listen Only** — it's the safest and easiest way to start.
![Modbus Mapper Pro Mode 1](../../assets/screenshots/mapper/modbus-mapper-pro-mode1.webp){ .screenshot-center loading="lazy" }

1. Click the **Mode Button** (bottom right of the application)
2. Select **Listen Only** mode
3. You're ready to connect!

!!! note "Other Modes"
    Once you're comfortable, explore **Mode 2 (Pass-Through)** and **Mode 3 (Multiplex)** — see [Operating Modes Deep Dive](#operating-modes-deep-dive) for details.

### Step 3: Connect Your RS485 Adapter & Start Listening

#### What You're Doing
You're tapping into the RS485 cable (like plugging in a phone to hear a conversation without being part of it).

#### How to Connect

**Find your RS485 cable:**
- Usually 2 wires going to Modbus devices
- Often labeled A and B (or sometimes +/- or D+/D-)
- Also find the Ground wire

**Connect your adapter:**
```
Existing RS485 Cable          Your USB Adapter
    A ─────────────────────────→ A
    B ─────────────────────────→ B
   GND ─────────────────────────→ GND
    
Plug adapter into your computer USB port
```

!!! warning "Important"
    Don't disconnect anything. Just tap in. You're only listening, not interrupting.

#### Software Setup

1. **Pick COM Port**
   
      - Plug in the USB adapter
      - In Mapper Pro, select which COM port it's using
      - (Check Windows Device Manager if unsure — look for COM3, COM4, etc.)
   
2. **Set Speed (Baud Rate)**
   
      - Ask your device manager what baud rate your system uses
      - Common ones: 9600, 19200, 38400
      - Pick from the dropdown
   
3. **Click Settings (Server) **
        
      - Server: ✅ Enable
      - Port: COM15 [depends on your device]
      - Baud: 19200 [depends on your device]
      - Parity: Usually "None" [depends on your device]
      - Data Bits: 8 [depends on your device]
      - Stop Bits: 1 [depends on your device]
      - (Usually already correct by default)
      - Listen Only [RS-485]: ON
   
4. **Click "Listen" and "Start"**
   
      - That's it! Mapper Pro now watches your devices

Within seconds, you'll see:

      - ✅ Devices talking
      - ✅ All the data they exchange
      - ✅ Register addresses
      - ✅ Data values in readable format

### Step 4: See What Your Devices Are Doing

Once listening starts, you can look at the traffic using the see three main views:

#### Client Requests View — "What Are They Asking For?"
Shows every question being asked to devices:

![Modbus Mapper Pro Client Request Tab](../../assets/screenshots/mapper/modbus-mapper-pro-client-request.webp){.screenshot-center loading="lazy"}

| Field | Description | Example |
|-------|-------------|---------|
| Slave ID | Modbus device address being queried | `1`, `17` |
| Function | Modbus function code of the request | `03 Read Holding Registers`, `04 Read Input Registers`, `16 Write Multiple Registers` |
| Address | Modbus Base register/coil address in standard format | `40001`, `30001`, `00001` |
| Address6D | 6-digit addressing format for clarity and consistency | See guide: [6-Digit Addressing](../../guides/6-digit-addressing.md) |
| Count | Number of registers/coils requested | `1`, `2`, `10` |

**What to notice:** If you see 100+ different requests, that's normal. Devices are busy!

#### Modbus Map (Data View) — "What Are The Values?"
This view lets you transform raw Modbus registers into meaningful values. Use data type, byte swap, gain, and offset to convert readings into human-friendly units (similar to Modbus Monitor XPF).

![Modbus mapper pro modbus map View](../../assets/screenshots/mapper/modbus-mapper-pro-modbus-map-view.webp){.screenshot-center loading="lazy"}

| Control | Purpose |
|---------|---------|
| Save | Export the Modbus Map to CSV for use in other tools (e.g., Modbus Monitor XPF) |
| Open | Load a previously saved Modbus Map (local or exported from XPF) |
| + (Add) | Add a monitoring point for an address to apply post-processing |
| - (Remove) | Remove the selected monitoring point from the list |
| ++ (Add All) | Automatically add monitoring points for newly discovered requests |
| Delete | Clear all monitoring points from the current map |
| Add | Automatically add or update values from client responses |
| Auto Update | Periodically refresh values from internal captured memory |


1. Click **"Create Map"** or **"Add All"**
2. All discovered data appears as a table (like Excel)
3. Each row shows one piece of data with its current value
4. Change the name to something meaningful:
   - Change "Register 100" to "Temperature" 
   - Change "Register 101" to "Pressure"
5. Check the **"Auto Update"** box to watch values change in real-time

**Example:**
```
Name           Value     Units
Temperature    23.5      °C
Pressure       101.3     kPa
Status         Running   (text)
```

#### Messages/Logs Tab — "What Was Going On?"
This tab shows live raw traffic captured in all modes. Use it to verify requests/responses, spot errors, and understand timing.

![Modbus mapper pro traffic view](../../assets/screenshots/mapper/modbus-mapper-pro-traffic-view.webp){.screenshot-center loading="lazy"}

| Control | Purpose |
|---------|---------|
| Save | Save the traffic log to a file for later analysis |
| Delete | Clear the current log entries |
| Log On | Toggle logging visibility (show/hide traffic) |
| Scroll | Enable auto-scroll to keep the latest messages in view |

**Pro tip:** Turn on **"Auto Scroll"** so new messages appear at the bottom automatically.

Shows every single message:

- Raw data that was sent
- Raw response that came back
- What it all means in English
- When it happened (timestamp)

**Use this for:** Understanding problems, seeing errors, timing analysis



### Step 5: Save Your Discoveries

Once you've built your Modbus map:

- **Save the map** for documentation purposes.
- **Copy data** to clipboard for sharing
- **Export configuration** for use in other applications (Modbus Map View - Save)
- **Use with Modbus Monitor XPF** for active monitoring and control

---

## How Modbus Mapper Pro Works

### The "Sniffing" Process

```mermaid
graph LR
    HMI["HMI/SCADA<br/>(Master)"] -->|Modbus RTU| DEVICE["Field Device<br/>(Slave)"]
    DEVICE -->|Response| HMI
    MAPPER["Modbus Mapper Pro<br/>(Passive Probe)"] -.->|Silent Monitoring| HMI
    MAPPER -.->|Traffic Analysis| DEVICE
    MAPPER --> ANALYSIS["Decoded Data & Modbus Maps"]
    
    style MAPPER fill:#e3f2fd
    style ANALYSIS fill:#e8f5e8
    style HMI fill:#fff3e0
    style DEVICE fill:#f3e5f5
```

### Real-Time Discovery

When you start Modbus Mapper Pro in Listen Only mode:

1. **Frame Capture** - All Modbus RTU frames are captured from the RS485 bus
2. **Frame Decoding** - Frames are decoded to extract function codes, addresses, and data
3. **Pattern Recognition** - Unique requests are identified and catalogued
4. **Data Type Inference** - System infers data types based on register patterns
5. **Map Construction** - Complete Modbus map is automatically built
6. **Live Display** - Data is shown in Excel-like grid with real-time updates

### Automatic Data Format Detection

The application intelligently recognizes common data types:

| Register Count | Detected Type | Example |
|---|---|---|
| 1 | 16-bit Integer | Temperature: 2345 → 23.45°C |
| 2 | 32-bit Float | Pressure: 101325 Pa |
| 2 | 32-bit Integer | Large counter values |
| 4+ | String | Device names, status text |
| Variable | Bit fields | Status flags, alarms |

### What Happens When You Start

Within **seconds** of pressing Start:

✅ **Modbus traffic detected** - Frames are captured from the RS485 bus  
✅ **Automatic decoding** - Raw frames translated to readable values  
✅ **182+ unique requests** typically discovered (varies by network activity)  
✅ **Complete register map** automatically built without manual entry  
✅ **Live data values** displayed with proper formatting  
✅ **Communication patterns** visualized and analyzed  
✅ **Zero disruption** to existing operations  

---

## Operating Modes Deep Dive

### Mode 1: Listen Only (RS485 Sniffing)

**The passive observer** — Modbus Mapper Pro connects to your RS485 network as a non-invasive tap

#### How It Works

```
Master ⇄ Slave  
  ↑      ↑
  └──────┘
     ↓
Modbus Mapper Pro (RS485 adapter)
  ↓
Sniffs & analyzes all traffic
No frames transmitted
Builds live Modbus map
```

**Process:**
1. Connect RS485 adapter to the existing two-wire Modbus network
2. Application captures all frames from the bus
3. Frames are decoded and analyzed in real-time
4. Complete Modbus map is built automatically
5. No interruption to active master/slave communication

#### When to Use Mode 1

- ✅ **Troubleshooting existing systems** - analyze live traffic without changes
- ✅ **Reverse-engineering devices** - discover unknown register maps
- ✅ **Performance analysis** - measure timing, poll rates, throughput
- ✅ **Production monitoring** - zero risk of disruption
- ✅ **System documentation** - capture complete communication patterns
- ✅ **Hardware diagnostics** - detect wiring issues, noise, timing problems
- ✅ **Legacy system analysis** - understand old systems before upgrades

#### Key Characteristics

| Aspect | Details |
|--------|---------|
| **Hardware needed** | RS485 adapter (non-invasive tap) |
| **Setup complexity** | Simple - just connect and configure COM port |
| **Impact on network** | Zero - 100% passive |
| **Sniffing enabled** | Yes, always active |
| **Data forwarding** | None - observation only |
| **Ideal for** | Analysis, troubleshooting, discovery |

#### Real-World Example: Mode 1

**Scenario:** Your facility has an old Modbus device with no documentation, connected to an HMI.

**Solution:**
1. Tap RS485 adapter into the existing two-wire network
2. Launch Modbus Mapper Pro in Mode 1
3. Watch the HMI communicate with the device
4. Mapper Pro automatically discovers all registers and data types
5. Export the discovered map for documentation and use in other tools

**Result:** Complete register map within seconds, zero disruption, device continues operating normally.

---

### Mode 2: Pass-Through (Transparent Bridge with Monitoring)

**The transparent bridge** — Modbus Mapper Pro sits between Client and Server, forwarding all traffic while simultaneously capturing and analyzing

#### How It Works

```
Client (Master) ──→ Modbus Mapper Pro ──→ Server (Slave)
                    (transparent forwarding)
                    (simultaneous sniffing)
                            ↓
                    Logs all traffic
                    Decodes all frames
                    Builds live Modbus map
```

**Process:**
1. Configure Mapper Pro as intermediate device between Client and Server
2. Client connects to Mapper Pro's input port
3. Server connects to Mapper Pro's output port
4. All frames are forwarded transparently (no modification)
5. Simultaneously, all traffic is captured, decoded, and analyzed
6. Live Modbus map builds as communication occurs

#### When to Use Mode 2

- ✅ **Active system integration** - insert between working master and slave
- ✅ **Live monitoring** - observe real communication while system operates
- ✅ **System debugging** - see exactly what's being exchanged
- ✅ **Integration testing** - verify new systems work with existing devices
- ✅ **Complete audit trail** - log all frames for compliance/analysis
- ✅ **Non-disruptive analysis** - both devices think they're talking directly
- ✅ **Protocol validation** - verify data transformations and formatting

#### Key Characteristics

| Aspect | Details |
|--------|---------|
| **Hardware needed** | Two serial ports (or USB adapters) |
| **Setup complexity** | Moderate - requires network reconfiguration |
| **Impact on network** | Zero latency, transparent operation |
| **Sniffing enabled** | Yes, automatic |
| **Data forwarding** | Yes - bi-directional, real-time |
| **Ideal for** | Active integration, debugging, monitoring |

#### Real-World Example: Mode 2

**Scenario:** You're integrating a new HMI with an existing Modbus device, but communication seems unreliable.

**Solution:**
1. Install Mapper Pro between HMI and device in pass-through mode
2. HMI connects to Mapper Pro; Mapper Pro connects to device
3. System operates normally while Mapper Pro captures all traffic
4. View frame-by-frame communication in real-time
5. Identify CRC errors, timing issues, or data mismatches

**Result:** Complete visibility into communication, both devices work normally, issues identified and resolved without disruption.

---

### Mode 3: Multiplex (Multi-Master Support)

**The intelligent multiplexer** — Multiple Masters (Clients) share a single Slave (Server) through Modbus Mapper Pro

#### How It Works

```
Client A ──┐
           ├─→ Modbus Mapper Pro ──→ Server (Slave)
Client B ──┘   (intelligent arbitration)
             (optional sniffing)
             (timestamp & log all traffic)
```

**Process:**
1. Configure multiple Clients to connect to Mapper Pro
2. Mapper Pro connects to the single Slave device
3. Mapper Pro intelligently handles Modbus RTU protocol arbitration
4. Prevents collisions by sequencing requests from multiple Masters
5. Optionally captures and logs all traffic for analysis
6. All communication flows transparently to the Slave

#### Why Mode 3 Matters

**Traditional Modbus RTU Problem:**
- Modbus RTU standard allows only ONE Master per Slave
- Multiple Masters cause collisions and communication failures
- Solutions require expensive hardware multiplexers

**Modbus Mapper Pro Solution:**
- Software-based arbitration - no extra hardware needed
- Seamless multi-master support
- Cost-effective alternative to hardware solutions
- Maintains protocol compliance and reliability

#### When to Use Mode 3

- ✅ **Multiple systems sharing one device** - e.g., HMI + Historian
- ✅ **Backup system integration** - secondary HMI monitors same device
- ✅ **Legacy + modern systems** - integrate old and new without hardware
- ✅ **Cost reduction** - avoid expensive hardware multiplexers
- ✅ **SCADA development** - multiple subsystems accessing same slave
- ✅ **Gradual system migration** - old and new systems coexist
- ✅ **Multi-location access** - remote monitoring alongside local HMI

#### Key Characteristics

| Aspect | Details |
|--------|---------|
| **Hardware needed** | Multiple serial ports or USB adapters |
| **Setup complexity** | Moderate - each client connects to Mapper Pro |
| **Impact on network** | Zero - all clients still connect logically |
| **Sniffing enabled** | Optional - can monitor while multiplexing |
| **Data forwarding** | Yes - intelligent multi-master handling |
| **Ideal for** | Multi-master integration, cost savings, flexibility |

#### Real-World Example: Mode 3

**Scenario:** Your facility has one critical Modbus device, but both the production HMI and the data historian need access. No hardware multiplexer available.

**Solution:**
1. Install Mapper Pro with multiple client connections enabled
2. Production HMI connects to Mapper Pro input 1
3. Data historian connects to Mapper Pro input 2
4. Single Slave device connects to Mapper Pro output
5. Mapper Pro automatically arbitrates requests from both systems
6. Optional: Enable sniffing to log all traffic for compliance

**Result:** Two independent systems safely sharing one Modbus device, no collisions, reduced costs, complete visibility if needed.

#### Comparison: All Three Modes

| Feature | Mode 1 (Listen Only) | Mode 2 (Pass-Through) | Mode 3 (Multiplex) |
|---------|---|---|---|
| **Adapters needed** | 1 (tap) | 2 (input/output) | 2+ (inputs/output) |
| **Master/Slave change** | No | Reconfigure | Reconfigure |
| **Forwarding** | No | Yes | Yes |
| **Sniffing** | Yes | Yes | Optional |
| **Best for** | Analysis | Integration+Monitoring | Multi-Master |
| **Setup time** | Minutes | Hours | Hours |
| **Risk level** | Very Low | Low | Low |

---

## Visual Overview: All Three Modes

```mermaid
graph TB
    subgraph M1["MODE 1: LISTEN ONLY 🔍"]
        direction LR
        
        C1["📱 Modbus<br/>Client"]
        S1["🖥️ Modbus<br/>Server"]
        TAP["📡 RS485<br/>Tap Point"]
        MP2["🔍 Mapper Pro<br/>Sniffer Only"]
        ANALYSIS["📊 Analyzer<br/>Decode + Logs"]

        C1 <-->|TX/RX| TAP
        TAP <-->|TX/RX| S1

        TAP -.-|Sniff Only| MP2
        MP2 -->|Captures| ANALYSIS
    end
```

```mermaid
graph TB
    subgraph M2["MODE 2: PASS-THROUGH🔄"]
        direction LR
        C2["📱 Modbus<br/>Client"]
        MP2["🔄 Mapper Pro<br/>Forwarding + Sniffing"]
        S2["🖥️ Modbus<br/>Server"]
        C2 <-->|TX/TX| MP2
        MP2 <-->|TX/RX| S2
        MP2 -.->|Captures| ANALYSIS["📊 Analyzes"]
    end
```

```mermaid
graph TB
    subgraph M3["MODE 3: MULTIPLEX 🔌"]
        direction LR
        CA["📱 Client A<br/>HMI"]
        CB["📊 Client B<br/>Historian"]
        MP3["🔌 Mapper Pro<br/>Intelligent Arbitration"]
        S3["🖥️ Modbus<br/>Server"]
        
        CA <-->|TX/RX| MP3
        CB <-->|TX/RX| MP3
        MP3 <-->|TX/RX| S3        
        
    end
```
**How Each Mode Works:**

| Aspect | Mode 1 | Mode 2 | Mode 3 |
|--------|--------|--------|--------|
| **Left Side** | Client | Client | Clients A & B |
| **Middle** | TAP → Mapper Pro | Mapper Pro (forwarding) | Mapper Pro (arbitration) |
| **Right Side** | Server | Server | Server |
| **Connection Type** | Non-invasive tap on RS485 | Direct pass-through | Multi-client arbitration |
| **Data Flow** | Passive sniffing | Active forwarding | Intelligent routing |
| **Sniffing** | ✅ Always active | ✅ Captures traffic | ✅ Optional logging |
| **Network Impact** | Zero (100% passive) | Zero latency | Conflict-free routing |

---

## Key Features

### 1. See Your Data in Real Numbers
Instead of confusing hex codes, see actual values (temperature: 23.5°C, pressure: 101 kPa)

- Automatically figures out what type of data each register holds
- Shows values in familiar formats (integers, decimals, text)
- Build complete data maps within seconds
- Save it all for later use

### 2. Multiple Systems, One Device
Share a single Modbus device between different programs without expensive equipment

- No special hardware needed — just software
- Prevents conflicts automatically
- Perfect for old and new systems working together

### 3. See Everything That's Happening
Watch communication in real-time as it happens

- See every message sent and received
- Watch timing and response patterns
- Spot problems as they occur
- Record everything for analysis

### 4. Find Missing Information
Discover registers and settings from devices without manuals

- Automatically maps out all devices talking on the network
- Shows register addresses and data types
- Builds documentation automatically
- No guessing needed

### 5. Customize Your View
Make data display the way you want it

- Change number formats (whole numbers, decimals, hex)
- Add labels to registers (e.g., "Temperature" instead of "Register 100")
- Adjust values for different units
- Create views for your specific needs

### 6. Complete Record of Everything
Keep detailed logs of all communication

- Every message in and out
- Timestamps for when things happened
- Raw data plus decoded meaning
- Search and analyze later

### 7. Simple to Use
Built for people, not just engineers

- Clean, familiar Excel-like grid
- One-click operations
- Helpful tips and guides
- No complicated setup

### 8. Works Anywhere
Use it how you want

- Portable — run from USB or anywhere
- Or install from Microsoft Store
- Windows 10/11
- Minutes to get started
---


### What You See
1. **Live Communications** - Real-time frame capture and decoding
2. **Automatic Discovery** - Registers and coils found automatically  
3. **Data Interpretation** - Values shown in proper formats
4. **Network Mapping** - Communication patterns visualized
5. **Export Results** - Save discoveries as Modbus maps

## Use Cases

### Industrial Automation
Monitor, diagnose, and optimize Modbus devices on factory floors or in distributed control systems. Identify bottlenecks, validate device behavior, and ensure optimal performance.

### SCADA Development
Streamline the integration and testing of Modbus networks in SCADA applications. Verify communication chains and validate data flows during development and deployment.

### Protocol Testing
Validate and troubleshoot communication between Modbus Clients and Servers with ease. Ensure compliance with Modbus specifications and identify non-standard implementations.

### System Optimization
Analyze traffic patterns to identify inefficiencies and improve performance in Modbus networks. Optimize polling rates, reduce latency, and maximize throughput.

### Legacy System Recovery
Recover documentation and Modbus maps from undocumented or legacy systems. Perfect for system upgrades, migrations, and knowledge transfer.

### Network Troubleshooting
Debug communication issues without disrupting live operations. See exactly what's being sent and received between devices.

---

## Key Capabilities

### Real-Time Monitoring
- Monitor unique Modbus requests within seconds
- Watch live data refresh as devices communicate
- Analyze communication patterns instantly
- No configuration delays or complex setup

### Automatic Discovery
- **Identifies all active Modbus communications** automatically
- **Learns register maps** from live traffic
- **Infers data types** from register patterns
- **Eliminates manual documentation** of registers

### Advanced Customization
- Fine-tune data interpretation per register
- Apply byte swapping for big-endian/little-endian conversion
- Scale values with gain/offset calculations
- Override auto-detected data types when needed

### Professional-Grade Analysis
- Frame-level protocol examination
- CRC validation and error checking
- Performance metrics and statistics
- Export capabilities for further analysis

### Dual Master Support (Multi-Master Communication)

Monitor communications between **two separate masters** and one or more slaves seamlessly:

**Traditional Modbus RTU Limitation:**
- Standard Modbus RTU allows only **one Master** to communicate with Slaves
- Multiple Masters cause **collisions and errors**
- Requires dedicated hardware or complex switches

**Modbus Mapper Pro Solution:**
- **Enable simultaneous communication** between multiple Masters and Slaves
- **Automatic conflict-free routing** of messages
- **No additional hardware** required
- **Real-time coordination** between clients

**Use Cases:**
- Primary HMI + Secondary monitoring system
- SCADA + Historian systems
- Backup system failover without reconfiguration
- Device testing with multiple controllers

### Frame Analysis

**Detailed packet-level examination capabilities:**

- **Raw hex frame display** - View every byte transmitted
- **Function code identification** - Recognize Modbus operation types (03, 04, 16, etc.)
- **Address and data decoding** - Extract meaningful information
- **CRC validation results** - Verify data integrity
- **Timing analysis** - Measure request/response delays and cycle times
- **Error tracking** - Identify corrupted frames and communication issues

### Data Format Detection

**Automatic recognition of data types with manual override capability:**

- **16-bit integers** (signed/unsigned) - Single register values
- **32-bit values** with byte swapping - Dual register combinations
- **Floating point numbers** - IEEE 754 standard formats
- **String data** - Multiple register sequences
- **Bit fields and status registers** - Individual bit interpretation
- **Custom formats** - User-definable data type mappings

## Licensing Options

### Flexible Licensing Models

| License Type | Duration | Best For | Features |
|--------------|----------|----------|----------|
| **Full License** | Perpetual | Long-term use | All features, permanent |
| **Subscription** | Monthly/Annual | Project-based work | Lower upfront cost |
| **Trial** | Limited time | Evaluation | Full features for testing |

### Purchase Options
- [:material-cart: Full License](https://quantumbitsolutions.com/shop/modbus-mapper-pro/)
- [:material-refresh: Subscription](https://quantumbitsolutions.com/shop/modbus-mapper-pro-subscription/)  
- [:material-email: Enterprise Licensing](https://quantumbitsolutions.com/contact-us/)

## Troubleshooting

### Common Problems & Quick Fixes

#### "Nothing is showing up" — No Traffic Detected

**What's happening?** Mapper Pro isn't seeing devices talk.

**Check these things:**

1. **Cables connected?**
   - Are A, B, and GND wires plugged into your adapter? 
   - Did you plug the USB into your computer?
   
2. **Right speed (Baud Rate)?**
   - Ask your device manager or documentation what speed to use
   - Common: 9600, 19200, 38400
   - Wrong speed = no traffic
   
3. **Adapter drivers installed?**
   - Plug in your USB adapter
   - Check Device Manager (Windows)
   - If it shows "?" or error, install drivers from USB adapter manufacturer
   
4. **Network actually running?**
   - Are your devices powered on?
   - Is your HMI/master device actually communicating?

**Still stuck?** Try unplugging everything for 10 seconds and reconnect.

#### "I see some data but not all" — Partial Data Capture

**What's happening?** Mapper Pro is seeing traffic but seems to be missing some.

**Try these:**

1. **Is your network very busy?**
   - Lots of devices talking at once can overwhelm the adapter
   - This is actually normal for factory floors
   - Solution: Use a better USB adapter (look for "industrial-grade")
   
2. **Check your cable quality**
   - Old or damaged RS485 cables cause data loss
   - Try a different cable if possible
   
3. **Restart Mapper Pro**
   - Stop listening and start again
   - Sometimes a fresh start helps

#### "The data looks wrong" — Decoding Issues

**What's happening?** Data shows up but values look incorrect or strange.

**Try these:**

1. **Wrong Modbus type?**
   - Ask your device manager: Is it "Modbus RTU" or "Modbus ASCII"?
   - Mapper Pro assumes RTU — if it's ASCII, data will look wrong
   
2. **Non-standard setup?**
   - Some devices don't follow Modbus rules exactly
   - Contact your device manufacturer for documentation
   
3. **Check data type**
   - Temperature shows "4521" instead of "45.21"?
   - In Mapper Pro, change the data type from "Integer" to "Float"

### Tips for Success

**Before you start:**
- ✅ Write down the baud rate from your HMI documentation
- ✅ Make sure your USB adapter has drivers installed
- ✅ Power on all your Modbus devices
- ✅ Verify your devices are actually communicating (ask your operator)

**When capturing data:**
- ✅ Let it run for 30 seconds before assuming something's wrong
- ✅ Save your discoveries immediately (you might need them later)
- ✅ If you get lost, restart fresh — it usually helps

**If you need more help:**
- 📖 Check the documentation for your specific devices
- 📞 Contact Modbus Mapper Pro support
- 💬 Check if other users had similar issues

## Support & Resources

### Getting Help
- 📧 **Direct Support** - Email assistance for licensed users
- 📖 **Documentation** - Comprehensive user guides  
- 🎥 **Video Tutorials** - Step-by-step demonstrations
- 💬 **Community Forum** - User discussions and tips

### Related Products
- 🖥️ **[Modbus Monitor XPF](../xpf/user-guide.md)** - Active monitoring and control
- 📱 **[Android Monitor](../android/advanced-guide.md)** - Mobile analysis tools
- ⚙️ **[Custom Solutions](../custom/overview.md)** - Tailored development

---

**Professional Modbus network analysis** - Mapper Pro provides the insights you need to understand, troubleshoot, and document existing Modbus systems.