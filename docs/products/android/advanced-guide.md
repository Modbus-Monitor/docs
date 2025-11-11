# Modbus Monitor Advanced - Complete User Manual

**Professional mobile Modbus monitoring for advanced users and field engineers**



## 1. Introduction

**Modbus Monitor XPF** is a versatile Windows application for facilitating communication between a Windows-based PC and Modbus Client or Server devices. It handles both Client (Master) and Server (Slave) operations and supports all common Modbus variants: TCP/IP, Serial RTU, Serial ASCII, and RTU/ASCII over TCP.

![Modbus Monitor Advanced on Mobile](../../assets/screenshots/android-advanced/mma-modbus-monitor-android.webp){ .screenshot-center loading="lazy" }

!!! success "Advanced Version Features"
    The Modbus Monitor Advanced is a professional Android app that communicates using the Modbus protocol through various interfaces. This paid version includes all features of the free app and excels in professional features, configuration options, and ease of data input.

## Introduction

The Modbus Monitor Advanced operates in two modes: **Master (Client)** and **Slave (Server)**. The operation, configuration, and communication differ based on the selected mode.

- **Master Mode**: The app polls remote devices to retrieve data, displayed in your chosen format
- **Slave Mode**: Your phone/tablet acts as a Modbus TCP Slave Device, allowing other devices to poll your device for data

**Key Advantage**: The Modbus Monitor Advanced combines both modes in one application, eliminating the need for separate apps.

## Download & Installation

- [:material-google-play: Google Play Store](https://play.google.com/store/apps/details?id=com.Bhavan.Galex)
- [:material-download: Official Download](https://quantumbitsolutions.com/purchase/)

**Requirements**: Android 8.0+ with network and USB permissions enabled

## Main Window Interface

<figure markdown>
  ![Main Window Layout](../../assets/screenshots/android-advanced/main-window-annotated.webp){ width="500" }
  <figcaption>Figure 2: Main window interface with numbered components explained below</figcaption>
</figure>

The main window provides a comprehensive control center:

### Header Section
1. **Hamburger Menu** [1] - Access main navigation
2. **Application Title** - Shows current app mode

### Quick Access Controls
2. **Server Mode Status/Start/Stop** [2] - Toggle Modbus server functionality
3. **Client Mode Status/Start/Stop** [3] - Control Modbus client operations  
4. **Bluetooth Status/Start/Stop** - Manage Bluetooth connections
5. **USB Ports Status/Available Port** - View USB-OTG connection status
6. **IoT Status/Start/Stop** - Control cloud integrations

### Status Information
7. **Good/Bad Packet Counters** [7] - Communication statistics
8. **Server IP Address and Port** - Current server configuration
9. **Monitor Point Data** [9] - Name, configuration, values, and response times
10. **Add Monitor Point** [10] - Quick access button with default settings

### Quick Start Example

!!! example "Quick Setup in 3 Steps"
    1. **Press the + Button** to add a new Monitor Point with default settings
    2. **Click the Monitor Point** and select "Change" to configure:
       - Set **Channel** to TCP/IP 
       - Enter **IP Address and Port** of remote server
       - Specify **Number of Registers** and **Protocol** (Modbus TCP default)
    3. **Click the Link Icon** to start polling and view live values

## Main Menu Navigation

<figure markdown>
  ![Main Menu Options](../../assets/screenshots/android-advanced/main-menu.webp){ width="350" }
  <figcaption>Figure 3: Main menu showing all available options and features</figcaption>
</figure>

### Menu Options

- **🏠 Home**: Return to main screen (back button alternative)
- **📱 Modbus Console**: Run Modbus Client Console (similar to free version)
- **⚙️ Settings**: Comprehensive configuration for:
  - Modbus Master/Server settings
  - Timing and communication parameters
  - Bluetooth and USB configurations
  - Sleep and power management
  - Logging and diagnostics
  - Google Sheets integration
  - ThingSpeak cloud publishing
  - MQTT client setup

### Data Management
- **💰 Purchases**: Purchase additional add-ons
- **🔄 Transform**: Convert old Modbus maps for compatibility
- **📥 Import**: Load Modbus Monitor CSV files from Downloads
- **📤 Export and Email**: Send data and configuration via email (CSV format for Excel editing)

### Cloud Integrations
- **📊 Google Sheets**: Configure Google Sheets add-on settings
- **☁️ ThingSpeak**: Set up periodic data transmission to ThingSpeak
- **📡 MQTT**: Configure MQTT client for IoT connectivity

### System Management
- **🔧 Factory Reset**: Erase all monitoring points and settings
- **📊 Reset T/RX Counts**: Clear transmission/reception counters
- **📈 Reset Statistics**: Clear Min/Average/Max statistics for all points

## Monitor Points Management

<figure markdown>
  ![Monitor Points List](../../assets/screenshots/android-advanced/monitor-points-list.webp){ width="450" }
  <figcaption>Figure 4: Monitor points list showing multiple configured devices with live data</figcaption>
</figure>

### What Are Monitor Points?

A **Monitoring Point** is similar to tags in a PLC and contains all information relevant to:
- Modbus communication settings
- Physical interface configuration  
- Data display formatting
- Preset writing values

**Advanced Capability**: Each monitor point can have different physical interfaces, Modbus protocols, IP addresses, and configurations.

### Monitor Point Management Menu

<figure markdown>
  ![Monitor Point Management Dialog](../../assets/screenshots/android-advanced/monitor-point-management.webp){ width="400" }
  <figcaption>Figure 5: Monitor point management options accessible by tapping any monitor point</figcaption>
</figure>

**Access**: Click on any Monitoring Point to open the management dialog

#### Available Actions
- **📡 Communications**: Start/stop Modbus Client (same as Link Icon)
- **➕ Add**: Create new Monitoring Point with defaults (same as + button)
- **🗑️ Remove**: Delete selected monitor point
- **✏️ Change**: Edit/configure the selected point (primary configuration option)
- **📋 Copy**: Copy selected point to memory
- **📄 Paste**: Paste copied point as new item
- **✍️ Write**: Send new value to Modbus server (must enable Write for each point)
- **📝 Write Preset Value**: Send previously configured preset value
- **👁️ Hide/Unhide Configuration**: Toggle display of configuration details

### Monitor Point Configuration

<figure markdown>
  ![Monitor Point Configuration Dialog](../../assets/screenshots/android-advanced/monitor-point-configuration.webp){ width="500" }
  <figcaption>Figure 6: Detailed monitor point configuration with expandable sections</figcaption>
</figure>

#### Configuration Sections (Click to Expand)

1. **📶 Channel Settings**: Communication interface and protocol
2. **🔧 Modbus Configuration**: Address, function codes, and display settings  
3. **🖥️ Sensor Server**: Settings for server mode operation
4. **🧮 Math**: Linear transformation and scaling calculations
5. **💬 Coded Message**: Translate numeric values to predefined text strings

## Modbus Client Mode (Master)

<figure markdown>
  ![Modbus Client Mode Interface](../../assets/screenshots/android-advanced/client-mode-interface.webp){ width="500" }
  <figcaption>Figure 7: Modbus client mode showing active polling and data collection</figcaption>
</figure>

### Quick Start Guide: Master Mode

#### Step 1: Add Monitor Points
- Click **(+)** button or select **"Add"** from menu
- New point created with default settings
- Tap point and select **"Change"** to configure

#### Step 2: Configure Channel
Choose physical/network interface:

- **📡 TCP/IP**: For Wi-Fi or Ethernet connected devices
- **🔌 Serial**: For USB-OTG serial port connections  
- **📱 Bluetooth**: For Bluetooth-enabled devices

#### Step 3: Select Protocol
Ensure correct Channel/Protocol combination:

| Channel | Compatible Protocols | Use Case |
|---------|---------------------|----------|
| TCP/IP | Modbus TCP | Ethernet/Wi-Fi networks |
| Serial | Modbus RTU, ASCII | USB-OTG connections |
| Bluetooth | Modbus RTU, ASCII | Wireless serial |

!!! warning "Protocol Compatibility"
    Modbus Monitor Advanced skips monitor points with incorrect Channel/Protocol combinations. Verify settings if communication fails.

#### Step 4: Configure Addressing

**Slave ID**: Set the device ID for your remote device

**Modbus Address**: Use the **6-digit addressing scheme** that combines Modbus Address and Function Code:

!!! info "6-Digit Addressing"
    The app uses a 6-digit format supporting the full 16-bit range (0-65535). Visit our [6-Digit Addressing Guide](../../guides/6-digit-addressing.md) for detailed examples and conversion information.

**Count Field**: Number of registers to read (max 125 per Modbus specification)
- Most common: 1 register
- Float values: 2 registers  
- Varies by data type

#### Step 5: Start Communication
- Click **"Link" icon** to begin polling
- **Success**: Data values appear in monitor point list
- **Failure**: "?????" displayed - check configuration

### Advanced Features

**Multi-Device Support**: Set different protocols, IP addresses, ports, and channels for each monitor point - enabling SCADA-level data collection through a single interface.

### Modbus Write Operations

<figure markdown>
  ![Modbus Write Dialog](../../assets/screenshots/android-advanced/write-dialog.webp){ width="400" }
  <figcaption>Figure 8: Write dialog for sending values to remote Modbus devices</figcaption>
</figure>

#### Write Dialog Features
- **Header**: Shows monitor point name and data type
- **Write Field**: Enter value to send
- **Change Button**: Execute write operation

#### Write Modes
- **Master Mode**: Value included in packet sent to remote server
- **Server Mode**: Value stored in internal registers for remote master polling

**Access**: Select **"Write"** option from Monitor Point Management dialog

!!! caution "Write Safety"
    Write functionality is disabled by default to prevent accidental operations. Enable individually for each monitor point as needed.

## Modbus Server Mode (Slave)

<figure markdown>
  ![Modbus Server Mode Interface](../../assets/screenshots/android-advanced/server-mode-interface.webp){ width="500" }
  <figcaption>Figure 9: Server mode active with IP address, port, and connected client count displayed</figcaption>
</figure>

The Modbus Monitor Advanced can operate as a **Modbus TCP Server**, turning your Android device into a Modbus slave that other devices can poll for data. This mode effectively converts your phone or tablet into an industrial data server.

!!! info "Server Mode Overview"
    Technically this functionality could be split into a separate "Modbus Server Android App", but it's included in the same app for convenience and ease of use.

### Server Mode Features

#### Core Functionality
- **Modbus TCP Protocol Only**: Server mode supports only Modbus TCP (other protocols ignored)
- **Shared Monitor Points**: Same monitor point list used for both Master and Slave operations
- **Multiple Client Support**: Handle multiple simultaneous client connections
- **Real-time Data Serving**: Serve live data to remote Modbus masters

#### Starting the Server
1. **Click Server Icon** on the main window to start/stop the Modbus TCP Server
2. **View Connection Info**: Server IP Address and Port displayed when started successfully  
3. **Monitor Clients**: Number in parentheses next to port shows connected client count

### Server Configuration

<figure markdown>
  ![Server Configuration Settings](../../assets/screenshots/android-advanced/server-configuration.webp){ width="450" }
  <figcaption>Figure 10: Server configuration settings accessible through Main Menu → Settings → Server</figcaption>
</figure>

**Access**: Main Menu → Settings → Server

#### Configuration Options

| Setting | Description | Default |
|---------|-------------|---------|
| **Server/Listen Port** | Port number for server operation | 8888 |
| **Modbus Server** | Show/hide Server icon on main window | Enabled |
| **Auto Start** | Automatically start server when app launches | Disabled |

#### Port Configuration Guidelines

**Recommended Port: 8888**
- Port 502 (standard Modbus) requires rooted Android device
- Android blocks many ports below 1024 for security
- Use ports above 1024 that aren't occupied by other applications

**Special Port Setting: "0"**
- Setting port to "0" lets Android automatically find available port
- ⚠️ **Caution**: Can cause conflicts with other network devices
- Better to manually select a known-safe port number

**Port Selection Best Practices**:
- Research existing network devices and their port usage
- Avoid common service ports (e.g., 5060 for VoIP)
- Test selected port to ensure no conflicts
- Document chosen port for future reference

### Setting Up Monitor Points for Server Mode

<figure markdown>
  ![Server Monitor Point Configuration](../../assets/screenshots/android-advanced/server-monitor-point.webp){ width="500" }
  <figcaption>Figure 11: Monitor point configured for server mode with Modbus TCP protocol and proper addressing</figcaption>
</figure>

#### Basic Server Setup Steps

1. **Enable Server Feature**: Check "Modbus Server?" in Settings to show server icon
2. **Add Monitor Points**: Click (+) to add at least one monitoring point
3. **Configure Points**: Set up each point for server operation

#### Server Monitor Point Configuration

**Required Settings**:
- **Protocol**: Must be set to **Modbus TCP**
- **Channel**: TCP/IP (other channels ignored)  
- **Address**: Starting register address (e.g., 0 for 40001)
- **Count**: Number of registers to serve
- **Function Code**: 3 (Holding Registers) or 4 (Input Registers)

**Ignored Settings in Server Mode**:
- **IP Address**: Uses server settings instead
- **Port**: Uses server port configuration

#### Example Configuration
```yaml
Server Setup Example:
  Protocol: Modbus TCP
  Address: 0 (PLC Address 40001)
  Count: 10 (for 5 float values × 2 words/float)
  Function: 3 (Holding Registers)
  Data Type: Float
```

### How Server Mode Works

#### Data Flow Process
1. **Monitor Point Setup**: Configure registers with addresses and data types
2. **Memory Management**: Values stored in internal memory at specified addresses
3. **Client Polling**: Remote masters poll your device using standard Modbus TCP
4. **Data Response**: App responds with current values from internal registers

#### Write Operations in Server Mode
- **Write Support**: Clients can write values to your server registers
- **Internal Storage**: Written values stored in internal memory
- **Value Retrieval**: Stored values returned when registers are polled
- **Preset Values**: Use "Write Preset Value" to populate registers with default data

## Sensor Server Mode

<figure markdown>
  ![Sensor Server Configuration](../../assets/screenshots/android-advanced/sensor-server-config.webp){ width="500" }
  <figcaption>Figure 12: Sensor server setup showing Android sensor selection and automatic configuration</figcaption>
</figure>

**Sensor Server** is an innovative extension of the Modbus Server that exposes your Android device's built-in sensors through the Modbus TCP protocol.

### What is Sensor Server?

#### Core Concept
- **Hardware Integration**: Links Android sensors directly to Modbus registers  
- **No Programming Required**: Any Modbus TCP Master can access phone sensors
- **Automatic Configuration**: Sensor selection automatically configures register settings
- **Real-time Data**: Live sensor readings available via standard Modbus polling

#### Available Sensors
**Common Android Sensors**:
- **📱 Accelerometer**: Device motion and orientation
- **🧭 Gyroscope**: Angular velocity measurements  
- **🌟 Light Sensor**: Ambient light levels
- **🗓️ Orientation**: Device position in 3D space
- **🌡️ Temperature**: Ambient temperature (device-dependent)
- **📊 Barometer**: Atmospheric pressure
- **🧲 Magnetometer**: Magnetic field strength
- **📍 Proximity**: Object detection near device

### Configuring Sensor Server

<figure markdown>
  ![Sensor Information Display](../../assets/screenshots/android-advanced/sensor-info-display.webp){ width="600" }
  <figcaption>Figure 13: Automatic sensor information display showing specifications and real-time values</figcaption>
</figure>

#### Setup Process

1. **Enable Server Mode**: Turn on Modbus Server feature (required)
2. **Add Monitor Point**: Create new monitoring point
3. **Select Sensor**: Choose desired sensor from dropdown list
4. **Review Configuration**: Verify automatic settings
5. **Start Server**: Activate server to begin data collection

#### Automatic Configuration

**When you select a sensor, the app automatically**:
- **Updates Register Name**: Fills with comprehensive sensor specifications
- **Sets Count Field**: Configures to 6 words (3 floats × 2 words each)
- **Configures Protocol**: Sets to Modbus TCP
- **Sets Function Code**: Uses function 3 or 4
- **Sets Data Type**: Configures as Float

#### Sensor Information Display

**Register Name Format** (automatically generated):
```
Sensor #[number] [SensorName] 
Power:[value]mA Resolution:[value] 
Range:[value] Vendor:[name] Version:[number]
Raw Data: [0]xxx.xx [1]xxx.xx [2]xxx.xx
```

**Example Information**:
- **Sensor Number**: Internal Android sensor ID
- **Sensor Name**: Human-readable sensor type
- **Power Consumption**: Current draw in milliamps
- **Resolution**: Measurement precision
- **Maximum Range**: Sensor measurement limits
- **Vendor**: Sensor manufacturer
- **Version**: Hardware/driver version
- **Raw Data**: Live 3-axis readings in real-time

### Required Sensor Server Configuration

#### Mandatory Settings
```yaml
Sensor Server Requirements:
  Sensor Selection: [Choose from dropdown]
  Address: 0 (or any unused address)
  Count: 6 (minimum for 3 float values)
  Protocol: Modbus TCP
  Data Type: Float  
  Function: 3 or 4
```

!!! warning "Configuration Requirements"
    All fields above must be properly configured for Sensor Server to work correctly. The Count field must be minimum 6 words to accommodate the 3-axis float data.

### Understanding Sensor Data

#### Data Format
**3-Axis Readings**: Most sensors provide data in 3-dimensional arrays
- **[0] X-Axis**: First dimensional reading
- **[1] Y-Axis**: Second dimensional reading  
- **[2] Z-Axis**: Third dimensional reading

#### Data Interpretation
**Accelerometer Example**:
- **X-Axis**: Lateral acceleration (left/right)
- **Y-Axis**: Longitudinal acceleration (forward/back)
- **Z-Axis**: Vertical acceleration (up/down)
- **Units**: Typically m/s² (meters per second squared)

**Reference Documentation**: 
- 📖 [Android Sensor Developer Guide](https://developer.android.com/guide/topics/sensors/sensors_overview.html)
- 📋 Manufacturer sensor datasheets for specific interpretations

### Practical Applications

#### Industrial IoT Integration
- **Environmental Monitoring**: Use phone as environmental sensor station
- **Vibration Analysis**: Monitor equipment vibration via accelerometer
- **Light Control Systems**: Automatic lighting based on ambient conditions
- **Security Systems**: Motion detection and proximity alerts

#### Research and Development
- **Data Collection**: Gather sensor data for analysis projects  
- **Prototype Testing**: Quick sensor integration without custom programming
- **Educational Demonstrations**: Teach industrial protocols and sensor integration
- **Mobile Sensor Networks**: Deploy phones as distributed sensor nodes

## Professional Use Cases

### Field Service Applications
- **Equipment Diagnostics**: Quick troubleshooting of industrial devices
- **Configuration Backup**: Save and restore device settings
- **Performance Monitoring**: Track system performance over time
- **Communication Testing**: Verify network connectivity and protocols

### System Integration
- **Device Commissioning**: Validate new installations
- **Network Mapping**: Document system architectures
- **Protocol Verification**: Test custom implementations
- **Performance Optimization**: Identify communication bottlenecks

### Research & Development
- **Protocol Analysis**: Reverse engineer device communications
- **Custom Development**: Test new device implementations  
- **Educational Demos**: Teach Modbus fundamentals
- **Communication Studies**: Analyze traffic patterns

## Advanced Configuration Examples

### TCP/IP Network Setup
```yaml
Device Configuration:
  Channel: TCP/IP
  Protocol: Modbus TCP
  IP Address: 192.168.1.100
  Port: 502
  Slave ID: 1
  Address: 400001 (holding register 1)
  Count: 1
  Data Type: 16-bit Integer
```

### Serial/USB Configuration
```yaml
Serial Connection:
  Channel: Serial
  Protocol: Modbus RTU
  Baud Rate: 9600
  Data Bits: 8
  Parity: None
  Stop Bits: 1
  Slave ID: 1
  Address: 300001 (input register 1)
  Count: 2 (for 32-bit float)
```

### Multi-Device Monitoring
```yaml
Device 1 - PLC:
  TCP/IP → 192.168.1.10:502
Device 2 - HMI:  
  TCP/IP → 192.168.1.20:503
Device 3 - Sensor:
  Serial → USB-OTG @ 19200 baud
```

## Hardware Requirements

### Mobile Device Specifications
- **Android OS**: 8.0 (API 26) or higher
- **RAM**: 2GB minimum, 4GB recommended
- **Storage**: 100MB available space
- **Network**: Wi-Fi, 4G/5G for TCP/IP communication
- **USB**: OTG support for serial connections

### Serial Communication Hardware
- **USB-OTG Adapter**: For connecting serial devices
- **USB-to-RS485 Converter**: For industrial networks
- **Proper Grounding**: Essential for reliable communication
- **Quality Cables**: Use shielded cables in industrial environments

### Recommended USB Serial Chipsets
Most quality manufacturers specify chipset information:
- FTDI FT232, FT4232
- Prolific PL2303
- Silicon Labs CP210x
- CH340/CH341

## Cloud Integration Add-ons

### Google Sheets Integration
- **Real-time Data Publishing**: Send monitor point values to Google Sheets
- **Automated Reports**: Generate periodic summaries
- **Data Analysis**: Use Google Sheets tools for trending
- **Team Sharing**: Collaborate on data analysis

**Setup**: Available through in-app purchase and configuration in Settings menu

### ThingSpeak Cloud Platform
- **IoT Data Publishing**: Send data to ThingSpeak channels
- **Custom Dashboards**: Create visualizations
- **API Access**: Integrate with other applications
- **Alerts & Triggers**: Set up automated notifications

**Configuration**: Access through main menu → ThingSpeak settings

### MQTT Client Support
- **IoT Connectivity**: Connect to MQTT brokers
- **Real-time Messaging**: Publish/subscribe to topics
- **Industrial IoT**: Integration with factory systems
- **Cloud Platforms**: AWS IoT, Azure IoT, Google Cloud IoT

**Setup**: Configure through main menu → MQTT settings

## Troubleshooting & Support

### Common Issues

#### Communication Problems
- **"?????" Values**: Check IP address, port, and protocol settings
- **Timeout Errors**: Increase timeout values in settings
- **Connection Refused**: Verify remote device is accessible
- **Protocol Errors**: Ensure correct Channel/Protocol combination

#### USB Serial Issues  
- **Device Not Detected**: Check USB-OTG adapter compatibility
- **Permission Errors**: Grant USB permissions when prompted
- **Communication Failures**: Verify baud rate and protocol settings
- **Intermittent Connections**: Check cable quality and connections

### Getting Help

#### Professional Support Channels
- 📧 **Priority Email Support**: support@quantumbitsolutions.com
- 📖 **Documentation**: [Complete user guides](https://quantumbitsolutions.com/help/)
- 💬 **Community Forum**: [Expert user community](https://quantumbitsolutions.com/forums/)
- 🎥 **Video Tutorials**: Step-by-step instruction videos

#### Additional Resources
- 📚 **Error Codes**: [Detailed error reference](https://quantumbitsolutions.com/errors/)
- 🔧 **Protocol Guides**: [Modbus fundamentals](https://quantumbitsolutions.com/modbus/)
- 📱 **FAQ**: [Frequently asked questions](https://quantumbitsolutions.com/faq/)
- 🔄 **Updates**: Regular app updates with new features

## Purchase & Download

### Get Modbus Monitor Advanced

[:material-google-play: Purchase on Google Play Store](https://play.google.com/store/apps/details?id=com.Bhavan.Galex){ .md-button .md-button--primary }

[:material-download: Official Download Page](https://quantumbitsolutions.com/purchase/){ .md-button }

### What's Included
- ✅ **Full Modbus Protocol Support**: TCP, RTU, ASCII
- ✅ **Unlimited Monitor Points**: No restrictions on device monitoring  
- ✅ **Professional Features**: Write operations, custom functions, advanced configuration
- ✅ **Cloud Integrations**: Google Sheets, ThingSpeak, MQTT add-ons available
- ✅ **Priority Support**: Fast email support with expert assistance
- ✅ **Regular Updates**: New features and improvements
- ✅ **Professional Documentation**: Comprehensive user guides and tutorials

---

**Professional mobile Modbus monitoring** - The Advanced version provides everything needed for serious industrial communication work on Android devices.
