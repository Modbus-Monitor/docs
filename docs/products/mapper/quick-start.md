# Modbus Mapper Pro - Quick Start Guide

**Get up and running with Modbus traffic analysis in minutes**

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
    Once you're comfortable, explore **Mode 2 (Pass-Through)** and **Mode 3 (Multiplex)** — see [User Manual: Operating Modes](user-manual.md#operating-modes-complete-guide) for details. Note: These modes require network reconfiguration.

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
   
3. **Configure Server Settings**
   
      - **Server:** ✅ Enable
      - **Port:** COM15 (depends on your adapter)
      - **Baud:** 19200 (check your device documentation)
      - **Parity:** None (typical)
      - **Data Bits:** 8 (typical)
      - **Stop Bits:** 1 (typical)
      - **Listen Only [RS-485]:** ON
   
4. **Click "Start" to begin monitoring**
   
   - Mapper Pro is now capturing all Modbus traffic

Within seconds, you'll see:

- ✅ Devices talking
- ✅ All the data they exchange
- ✅ Register addresses
- ✅ Data values in readable format

### Step 4: See What Your Devices Are Doing

Once monitoring starts, you'll see three main views:

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
| [[+]] (Add All) | Automatically add monitoring points for newly discovered requests |
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

#### Messages/Logs Tab — "What's Happening Right Now?"
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

## Troubleshooting

## Common First-Time Issues

### No Traffic Detected
**Causes & Solutions:**
- Wrong COM port → Check Device Manager for correct port
- Wrong baud rate → Try common rates: 9600, 19200, 38400
- Bad connections → Verify A/B wiring and ground
- Network inactive → Ensure HMI is actually polling

### Garbled Data
**Causes & Solutions:**
- Wrong baud rate → Match network settings exactly
- Wrong parity/stop bits → Check network configuration  
- Electrical interference → Improve cable routing/shielding
- Ground loops → Isolate monitoring connection

### Partial Capture
**Causes & Solutions:**
- High traffic volume → Increase buffer settings
- USB adapter limitations → Use industrial-grade adapter
- Timing issues → Adjust capture timing parameters

## What's Next?

### Immediate Actions
1. **Document discoveries** - Export captured register maps
2. **Identify patterns** - Note polling frequencies and sequences  
3. **Validate findings** - Cross-reference with known system behavior

### Advanced Usage
- **Set up continuous monitoring** for long-term analysis
- **Compare before/after** system changes  
- **Export data** for inclusion in system documentation
- **Share findings** with team members

## Need More Help?

- 📖 **[Complete User Manual](user-manual.md)** - Detailed feature guide
- 🎥 **Video Tutorials** - Visual step-by-step guides
- 📧 **Support** - Email assistance for licensed users
- 💬 **Community** - User forum for tips and discussions

---

**In 10 minutes, you should be successfully monitoring Modbus traffic and discovering register maps!**