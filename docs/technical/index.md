# Technical Resources Hub

**Comprehensive technical specifications, protocol references, and integration guides for Quantum Bit Solutions Modbus products**

!!! info "Product Line Overview"
    Our Modbus monitoring solutions span Windows desktop (XPF), Android mobile (Advanced/Console), and Mapper Pro platforms. Each product supports multiple Modbus variants with extensive protocol flexibility.

---

## 🏗️ Platform Architecture

### Windows XPF Platform

<div class="grid cards" markdown>

-   **:material-microsoft-windows: Desktop Application**

    ---
    
    **Modbus Monitor XPF** - Professional Windows monitoring and simulation
    
    - **Architecture**: .NET Framework 4.8+ (32-bit & 64-bit)
    - **OS Support**: Windows 10/11 (x86, x64)
    - **Deployment**: Microsoft Store, Direct Download (Installer/Portable)
    - **License Model**: Per-user (Microsoft Account) or machine-locked
    - **RAM**: 4-8GB recommended for large datasets
    - **Storage**: 100-500MB depending on logs
    
    [:octicons-arrow-right-24: XPF User Guide](../products/xpf/user-guide.md)

-   **:material-android: Mobile Platform**

    ---
    
    **Modbus Monitor Advanced** - Android field monitoring
    
    - **Architecture**: Android Native (Java/Kotlin)
    - **OS Support**: Android 6.0+ (API 23+)
    - **Deployment**: Google Play Store
    - **License Model**: Per-device Google Play license
    - **RAM**: 2GB+ recommended
    - **Storage**: 50-200MB including logs
    - **Hardware**: USB OTG support for serial, Bluetooth 4.0+
    
    [:octicons-arrow-right-24: Android Advanced Guide](../products/android/advanced-guide.md)

</div>

---

## 📡 Modbus Protocol Support

### Supported Protocol Variants

=== "XPF (Windows)"

    **8 Protocol Variants Supported:**

    | Protocol | Transport | Notes | Use Case |
    |----------|-----------|-------|----------|
    | **Modbus TCP** | Ethernet | Standard port 502 | PLCs, SCADA systems, industrial devices |
    | **Modbus UDP** | Ethernet | Connectionless variant | Low-latency networks, broadcast scenarios |
    | **Modbus RTU** | Serial (RS485/RS232) | Binary encoding, CRC-16 | Legacy devices, long-distance serial |
    | **Modbus ASCII** | Serial (RS485/RS232) | ASCII encoding, LRC checksum | Human-readable debugging |
    | **RTU over TCP** | Ethernet | RTU packets encapsulated in TCP | Serial protocol over network |
    | **ASCII over TCP** | Ethernet | ASCII packets encapsulated in TCP | Network-based ASCII communication |
    | **UDP RTU** | Ethernet | RTU packets over UDP | Low-latency RTU over network |
    | **UDP ASCII** | Ethernet | ASCII packets over UDP | Low-latency ASCII over network |

    **Simultaneous Operation:** Client and Server modes run concurrently in one application

=== "Android Advanced"

    **8 Protocol/Channel Variants Supported:**

    | Protocol | Transport | Channel | Use Case |
    |----------|-----------|---------|----------|
    | **Modbus TCP** | Ethernet | TCP/IP (Wi-Fi/Ethernet) | Standard network devices |
    | **Modbus UDP** | Ethernet | TCP/IP | Low-latency mobile networks |
    | **Modbus RTU** | Serial | USB OTG, Bluetooth | Field devices via USB/Bluetooth adapters |
    | **Modbus ASCII** | Serial | USB OTG, Bluetooth | Serial debugging and legacy devices |
    | **RTU over TCP** | Ethernet | TCP/IP | RTU encapsulation over network |
    | **ASCII over TCP** | Ethernet | TCP/IP | ASCII encapsulation over network |
    | **ThingSpeak** | Cloud | HTTP API | IoT cloud logging and visualization |
    | **Google Sheets** | Cloud | Google API | Real-time spreadsheet logging |
    | **MQTT** | IoT | TCP/IP (MQTT broker) | Industrial IoT messaging |

    **Communication Channels:** TCP/IP (Wi-Fi), USB OTG, Bluetooth, Cloud/IoT

=== "Mapper Pro"

    **Protocol Support:**

    | Protocol | Transport | Platform | Use Case |
    |----------|-----------|----------|----------|
    | **Modbus TCP** | Ethernet | Windows, Android | Multi-device register mapping |
    | **Modbus RTU** | Serial | Windows (COM), Android (USB/BT) | Serial device configuration |
    | **Modbus ASCII** | Serial | Windows, Android | ASCII-based device setup |

    [:octicons-arrow-right-24: Mapper Pro Documentation](../products/mapper/user-manual.md)

### Protocol Specifications

**Function Code Support:**

| Function Code | Name | XPF | Android | Description |
|--------------|------|-----|---------|-------------|
| **01** | Read Coils | ✅ | ✅ | Read discrete outputs (0xxxxx) |
| **02** | Read Discrete Inputs | ✅ | ✅ | Read discrete inputs (1xxxxx) |
| **03** | Read Holding Registers | ✅ | ✅ | Read output registers (4xxxxx) |
| **04** | Read Input Registers | ✅ | ✅ | Read input registers (3xxxxx) |
| **05** | Write Single Coil | ✅ | ✅ | Write one discrete output |
| **06** | Write Single Register | ✅ | ✅ | Write one holding register |
| **15** | Write Multiple Coils | ✅ | ✅ | Write multiple discrete outputs |
| **16** | Write Multiple Registers | ✅ | ✅ | Write multiple holding registers |
| **07** | Read Exception Status | ✅ | ❌ | Return exception status byte (legacy) |
| **08** | Diagnostics | ✅ | ❌ | Loopback, counters, and diagnostic subfunctions |
| **11** | Get Comm Event Counter | ✅ | ❌ | Return status counters for serial line |
| **12** | Get Comm Event Log | ✅ | ❌ | Return event log for diagnostics |
| **17** | Report Slave ID | ✅ | ❌ | Return device identification string |
| **43** | Encapsulated Interface Transport | ✅ | ❌ | General MEI (Modbus Encapsulation Interface) |
| **43/14** | Read Device Identification | ✅ | ❌ | MEI: Basic/Regular/Extended ID objects |
| **43/15** | Read Date and Time | ✅ | ❌ | MEI: Device time read (if supported) |
| **43/16** | Write Date and Time | ✅ | ❌ | MEI: Device time write (if supported) |

**Addressing Conventions:**

- **5-digit format**: `00001-09999` (Coils), `10001-19999` (Discrete Inputs), `30001-39999` (Input Registers), `40001-49999` (Holding Registers)
- **6-digit format**: Extended range for modern PLCs (see [6-Digit Addressing Guide](../guides/6-digit-addressing.md))
- **0-based mode**: Direct register addresses (0-65535) for protocol-level access
- **1-based mode**: Traditional PLC addressing (adds 1 to protocol addresses)

[:octicons-arrow-right-24: Complete Address Reference Guide](../guides/6-digit-addressing.md)

---

## 🔌 Hardware & Connectivity

### Communication Interfaces

=== "Serial (RS485/RS232)"

    **XPF Windows:**
    - **Native COM Ports**: Direct Windows serial port access
    - **USB-to-Serial**: FTDI, Prolific, CH340 chipsets supported
    - **Multi-Drop RS485**: Up to 32-247 devices per bus (spec-dependent)
    - **Baud Rates**: 300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 bps
    - **Data Bits**: 7, 8
    - **Parity**: None, Even, Odd, Mark, Space
    - **Stop Bits**: 1, 1.5, 2
    - **Flow Control**: None, Hardware (RTS/CTS), Software (XON/XOFF)

    **Android:**
    - **USB OTG**: FTDI, CP210x, CH34x, PL2303 chipsets via USB OTG cable
    - **Bluetooth Serial**: SPP (Serial Port Profile) adapters
    - **Baud Rates**: 9600, 19200, 38400, 57600, 115200 bps (common)
    - **Configuration**: Configurable parity, stop bits, data bits

    !!! tip "USB OTG Cable Required"
        Android devices need USB OTG adapter cable to connect USB-to-serial converters. Verify device OTG support before purchase.

=== "Ethernet (TCP/IP)"

    **Network Requirements:**

    | Parameter | XPF (Windows) | Android | Notes |
    |-----------|---------------|---------|-------|
    | **Port** | 502 (default), custom | 502 (default), custom | Modbus TCP standard port |
    | **IP Addressing** | Static, DHCP | Wi-Fi, Ethernet (via adapter) | IPv4 required |
    | **Firewall** | Windows Firewall rules | Android app permissions | May block port 502 |
    | **Multi-homing** | Supported (multiple NICs) | Single active connection | - |
    | **Server Mode** | Bind to specific IP or all | Bind to Wi-Fi interface | - |

    **Network Topology:**
    - **Point-to-Point**: Direct device connection
    - **Star**: Multiple devices via switch/router
    - **Routed**: Cross-subnet with routing
    - **VPN**: Secure remote access over internet

=== "Wireless"

    **Bluetooth (Android Only):**
    - **SPP Profile**: Serial Port Profile for serial adapters
    - **Pairing Required**: Android Settings → Bluetooth
    - **Range**: ~10-30 meters (Class 2 devices)
    - **Security**: PIN/passkey authentication
    - **Adapters**: HC-05, HC-06, RN42, commercial BT-serial bridges

    **Wi-Fi (Android):**
    - **Standards**: 802.11 b/g/n/ac
    - **Frequency**: 2.4GHz and 5GHz
    - **Connection**: WPA2/WPA3 encrypted networks
    - **IP Assignment**: DHCP or static

    **USB OTG (Android):**
    - **Chipset Support**: FTDI FT232, Silicon Labs CP210x, WCH CH340, Prolific PL2303
    - **Power**: Self-powered or USB-powered adapters
    - **Driver**: Automatic detection (no root required)

=== "Cloud/IoT (Android Add-ons)"

    **MQTT Add-on:**
    - **Brokers**: AWS IoT Core, Azure IoT Hub, HiveMQ, Mosquitto, EMQX
    - **Transport**: TCP (1883), TLS/SSL (8883), WebSockets (80/443)
    - **QoS Levels**: 0 (At most once), 1 (At least once), 2 (Exactly once)
    - **Authentication**: Username/password, client certificates (mutual TLS)
    - **Topics**: Customizable structure with device ID and point names
    
    [:octicons-arrow-right-24: MQTT Add-on Guide](../guides/android-mqtt-addon.md)

    **ThingSpeak Add-on:**
    - **Protocol**: HTTPS REST API
    - **Update Rate**: 15 seconds minimum (free tier), 1 second (paid)
    - **Data Fields**: Up to 8 channels per ThingSpeak channel
    - **Features**: Charts, MATLAB analytics, alerts, public/private channels
    
    [:octicons-arrow-right-24: ThingSpeak Add-on Guide](../guides/android-thingspeak-addon.md)

    **Google Sheets Add-on:**
    - **Protocol**: Google Sheets API v4 (OAuth 2.0)
    - **Authentication**: Google account with drive.file scope
    - **Update Rate**: 5 seconds recommended (API rate limits)
    - **Data Format**: Row append with timestamp and device ID
    
    [:octicons-arrow-right-24: Google Sheets Add-on Guide](../guides/android-sheets-addon.md)

### Recommended Hardware

**USB-to-Serial Adapters (Tested & Verified):**

| Brand/Model | Chipset | XPF | Android | Notes |
|-------------|---------|-----|---------|-------|
| **FTDI TTL-232R-3V3** | FT232R | ✅ | ✅ | Gold standard, excellent drivers |
| **Silicon Labs CP2102** | CP210x | ✅ | ✅ | Low cost, reliable |
| **WCH CH340G** | CH340 | ✅ | ⚠️ | Cheap, may need manual drivers |
| **Prolific PL2303** | PL2303HX | ✅ | ⚠️ | Avoid counterfeit versions |
| **StarTech ICUSB232** | FTDI | ✅ | ✅ | Industrial-grade isolation |

**RS485 Adapters:**

| Model | Type | Isolation | Range | Notes |
|-------|------|-----------|-------|-------|
| **FTDI USB-RS485-WE-1800** | USB | Yes (2.5kV) | 1200m | Professional grade |
| **Waveshare USB-RS485** | USB | No | 1200m | Budget option |
| **B&B USOPTL4** | USB | Yes (2.5kV) | 1200m | Industrial certified |

**Bluetooth Serial Adapters:**

| Model | Range | Baud Rate | Notes |
|-------|-------|-----------|-------|
| **HC-05/HC-06** | 10m | Up to 115200 | Common, requires 3.3V power |
| **RN42** | 10-30m | Up to 921600 | Roving Networks, reliable |
| **Parani SD1000** | 100m | Up to 921600 | Industrial, Class 1 power |

---

## 🎯 Data Types & Formats

### Supported Data Types

| Data Type | Size (bytes) | Range | XPF | Android | Notes |
|-----------|--------------|-------|-----|---------|-------|
| **UINT16** | 2 | 0 - 65535 | ✅ | ✅ | Unsigned 16-bit integer |
| **INT16** | 2 | -32768 - 32767 | ✅ | ✅ | Signed 16-bit integer |
| **UINT32** | 4 | 0 - 4,294,967,295 | ✅ | ✅ | Unsigned 32-bit integer |
| **INT32** | 4 | -2,147,483,648 - 2,147,483,647 | ✅ | ✅ | Signed 32-bit integer |
| **FLOAT32** | 4 | ±3.4E±38 (7 digits) | ✅ | ✅ | IEEE 754 single-precision |
| **FLOAT64** | 8 | ±1.7E±308 (15 digits) | ✅ | ✅ | IEEE 754 double-precision |
| **STRING** | Variable | ASCII characters | ✅ | ✅ | Multiple registers as text |
| **BIT** | 1 bit | 0 or 1 | ✅ | ✅ | Coils and discrete inputs |
| **UINT64** | 8 | 0 - 18,446,744,073,709,551,615 | ✅ | ✅ | Unsigned 64-bit integer |
| **INT64** | 8 | -9,223,372,036,854,775,808 - ... | ✅ | ✅ | Signed 64-bit integer |

### Byte Order (Endianness)

**Byte Swap Options:**

| Swap Type | Description | Example (0x12345678) | When to Use |
|-----------|-------------|----------------------|-------------|
| **None (ABCD)** | Big-endian words, big-endian bytes | `12 34 56 78` | Modbus standard, most PLCs |
| **BADC** | Little-endian words, big-endian bytes | `34 12 78 56` | Some industrial controllers |
| **CDAB** | Big-endian words, little-endian bytes | `56 78 12 34` | Alternate format |
| **DCBA** | Little-endian words, little-endian bytes | `78 56 34 12` | Intel x86 format |

**Word Swap (for 32-bit and larger):**
- **High-Low (HL)**: High word first (standard Modbus)
- **Low-High (LH)**: Low word first (alternate devices)

!!! tip "Finding Correct Byte Order"
    If values appear incorrect, try different byte swap combinations. Most Modbus devices use ABCD (no swap) or BADC format.

### Scaling & Transformation

**Linear Scaling:**
```
Scaled Value = (Raw Value × Multiplier) + Offset
```

**Examples:**

| Device | Raw Range | Scaled Range | Multiplier | Offset | Use Case |
|--------|-----------|--------------|------------|--------|----------|
| Temperature Sensor | 0-10000 | 0-100°C | 0.01 | 0 | Convert tenths to degrees |
| Pressure Transmitter | 4000-20000 | 0-100 PSI | 0.00625 | -25 | 4-20mA scaled output |
| Flow Meter | 0-65535 | 0-1000 GPM | 0.0153 | 0 | Direct GPM reading |

**Both XPF and Android support:**
- Multiplication factor
- Addition/subtraction offset
- Decimal precision (display rounding)
- Engineering units (text suffix)

---

## 🔧 Advanced Features

### Client Mode (Master)

**Polling Capabilities:**

| Feature | XPF | Android | Notes |
|---------|-----|---------|-------|
| **Unlimited Monitor Points** | ✅ | ✅ | No practical limit (memory-dependent) |
| **Multi-Device Polling** | ✅ | ✅ | Different slave IDs, IPs, COM ports |
| **Mixed Protocols** | ✅ | ✅ | TCP + RTU + ASCII simultaneously |
| **Polling Interval** | 1ms - custom | 100ms+ recommended | Android: battery-dependent |
| **Write Operations** | ✅ | ✅ | Function codes 05, 06, 15, 16 |
| **Read-Modify-Write** | ✅ | ✅ | Function code 23 |
| **Auto-Reconnect** | ✅ | ✅ | On timeout or error |

**Performance:**
- **XPF**: Can poll 1000+ points per second on modern hardware
- **Android**: 10-100 points per second typical (network/CPU dependent)

### Server Mode (Slave)

**Server Capabilities:**

| Feature | XPF | Android | Notes |
|---------|-----|---------|-------|
| **Modbus TCP Server** | ✅ | ✅ | Responds to client requests |
| **Modbus RTU Server** | ✅ | ❌ | XPF only (serial limitation on Android) |
| **Modbus ASCII Server** | ✅ | ❌ | XPF only |
| **Multiple Slaves** | ✅ | ❌ | XPF: multiple slave IDs per interface |
| **Register Simulation** | ✅ | ✅ | Static values or live sensor data |
| **Sensor Publishing (Android)** | ❌ | ✅ | Accelerometer, gyro, GPS, etc. |
| **Simultaneous Client+Server** | ✅ | ✅ | Run both modes at once |

**Use Cases:**

- **Protocol Gateway**: Client reads PLC, Server exposes to SCADA
- **Device Simulator**: Test clients without physical hardware
- **Sensor Bridge (Android)**: Expose phone sensors as Modbus registers
- **Data Aggregator**: Combine multiple sources into one Modbus interface

### Sensor Server Mode (Android Only)

**Published Sensors:**

| Sensor Type | Register Count | Update Rate | Use Case |
|-------------|----------------|-------------|----------|
| **Accelerometer** | 3 (X, Y, Z) | 10-100 Hz | Vibration monitoring |
| **Gyroscope** | 3 (X, Y, Z) | 10-100 Hz | Rotation tracking |
| **Magnetometer** | 3 (X, Y, Z) | 10-50 Hz | Compass heading |
| **GPS** | 5 (Lat, Lon, Alt, Speed, Bearing) | 1 Hz | Location tracking |
| **Light Sensor** | 1 | 1-10 Hz | Ambient light |
| **Proximity** | 1 | 1-10 Hz | Object detection |
| **Pressure** | 1 | 1-10 Hz | Barometric pressure |
| **Temperature** | 1 | 1 Hz | Ambient temp |

**Modbus Mapping:**

- Sensors assigned to sequential holding registers (4xxxxx)
- FLOAT32 format (2 registers per axis)
- Automatic updates when sensor values change

[:octicons-arrow-right-24: Sensor Server Details](../products/android/advanced-guide.md#sensor-server-mode)

---

## 📊 Data Logging & Export

### Export Formats

**CSV (Comma-Separated Values):**

- **XPF**: Export monitor points, server data, logs
- **Android**: Export monitor points with timestamps
- **Columns**: Timestamp, Name, Value, Status, Config
- **Scheduling**: Manual, timed intervals (second/minute/hour)

**Google Sheets (Android Add-on):**

- Real-time row append to cloud spreadsheet
- Automatic timestamp and device ID columns
- OAuth 2.0 authentication
- 5-second minimum interval recommended

**Email Export (Android):**

- Attach CSV to email directly from app
- Configure recipient, subject, body
- Triggered manually or on schedule

### Logging Capabilities

**XPF:**

- **Packet Logs**: Raw Modbus frames with timestamps
- **Value Logs**: Monitor point data over time
- **Server Logs**: Client request/response history
- **Scanner Logs**: Device discovery results
- **File Formats**: CSV, TXT, XML

**Android:**

- **Statistics**: Good/bad packet counts, response times
- **CSV Export**: Timestamped value logs
- **Cloud Logging**: ThingSpeak, Sheets, MQTT real-time
- **Storage**: Internal storage or SD card

---

## 🛠️ Troubleshooting Tools

### Built-in Diagnostics

**XPF:**

- **Scanner**: Auto-discover device addresses and register maps
- **Packet Viewer**: Real-time Modbus frame inspection
- **Error Counters**: Track timeouts, exceptions, CRC errors
- **Response Time**: Per-point latency measurement
- **Traffic Capture**: Record and replay Modbus sessions

**Android:**

- **Packet Display**: View raw TX/RX frames per monitor point
- **Comm Counters**: Good/bad packet statistics
- **Response Delay**: Per-point timing metrics
- **USB Device List**: Detect connected USB serial devices
- **Bluetooth Pairing**: In-app BT device discovery

### Common Issues & Solutions

**Connection Failures:**

| Symptom | Likely Cause | Solution |
|---------|--------------|----------|
| **Timeout** | Wrong IP, device offline | Verify network, ping device |
| **No Response** | Wrong port, firewall | Check port 502, firewall rules |
| **CRC Error (RTU)** | Baud mismatch, noise | Verify serial settings, cables |
| **Exception Code** | Invalid address, function | Check device register map |
| **USB Not Detected** | Driver missing, OTG issue | Install drivers, check OTG cable |

**Performance Issues:**

| Symptom | Cause | Solution |
|---------|-------|----------|
| **Slow Polling** | Too many points, low interval | Increase interval, reduce points |
| **High CPU** | Fast polling, large datasets | Optimize polling strategy |
| **Packet Loss** | Network congestion | Reduce traffic, improve network |
| **Timeout Errors** | Device slow, network latency | Increase timeout values |

[:octicons-arrow-right-24: Full Troubleshooting Guides](../support/index.md)

---

## 📚 Integration & Development

### Data Import/Export

**Monitor Point Configuration Files:**
- **Format**: CSV with headers (Name, Address, Type, Channel, Protocol, etc.)
- **XPF**: Save/Load configurations for different devices
- **Android**: Import/Export from Downloads folder
- **Use Case**: Share configurations between devices, backup settings

### Third-Party Integration

**Compatible Tools:**
- **QModMaster**: Open-source Modbus master (Linux/Windows)
- **pymodbus**: Python Modbus library
- **ModScan**: Commercial Windows Modbus scanner
- **Node-RED**: Visual IoT flow programming (MQTT integration)
- **Home Assistant**: Smart home automation (MQTT integration)
- **Grafana**: Visualization dashboards (ThingSpeak, Sheets data sources)

**Protocol Compliance:**
- **Modbus.org Specification**: Fully compliant
- **Function Codes**: Standard 01-23 supported
- **Exception Codes**: All standard exceptions handled
- **CRC/LRC**: Correct checksum implementation

---

## 🔐 Security Considerations

### Network Security

**XPF:**

- Runs on Windows with OS-level firewall
- VPN support for remote access
- No built-in encryption (use VPN or secure network)
- Authentication: None (Modbus protocol limitation)

**Android:**

- App permissions: Network, USB, Bluetooth, Storage
- Wi-Fi security: WPA2/WPA3 encrypted networks
- Cloud add-ons: TLS/SSL for MQTT, OAuth 2.0 for Sheets
- Bluetooth: PIN/passkey pairing

**Best Practices:**

- Use VPN for remote Modbus access
- Isolate Modbus networks from internet (air-gap or VLAN)
- Enable TLS/SSL for MQTT cloud connections
- Use strong passwords for cloud services
- Regularly update app/software
- Monitor logs for unauthorized access attempts

### Data Protection

- **Local Storage**: Data stored on device (not cloud by default)
- **Cloud Add-ons**: User-controlled (opt-in)
- **Encryption**: MQTT TLS, Google API HTTPS, ThingSpeak HTTPS
- **Privacy**: No telemetry or analytics without consent

---

## 📖 Additional Resources

### Documentation

- **[XPF User Guide](../products/xpf/user-guide.md)** - Complete Windows application manual
- **[Android Advanced Guide](../products/android/advanced-guide.md)** - Mobile app comprehensive documentation
- **[Mapper Pro Manual](../products/mapper/user-manual.md)** - Register mapping tool
- **[6-Digit Addressing Guide](../guides/6-digit-addressing.md)** - Extended address format
- **[Add-on Guides](../guides/mqtt-addon.md)** - MQTT, ThingSpeak, Google Sheets

### Support Channels

- **[Help Center](../support/index.md)** - FAQ and common issues
- **[Community Forum](https://quantumbitsolutions.com/forums/)** - User discussions
- **[YouTube Tutorials](https://www.youtube.com/@ModbusMonitor/videos)** - Video demonstrations
- **Email**: [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

### Product Comparison

| Feature | XPF (Windows) | Android Advanced | Mapper Pro |
|---------|---------------|------------------|------------|
| **Platform** | Windows 10/11 | Android 6.0+ | Windows/Android |
| **Client Mode** | ✅ | ✅ | ✅ |
| **Server Mode** | ✅ (TCP/RTU/ASCII) | ✅ (TCP only) | ❌ |
| **Protocols** | 8 variants | 8 variants + Cloud | 3 variants |
| **Simultaneous Client+Server** | ✅ | ✅ | ❌ |
| **Serial (RS485/232)** | ✅ (Native COM) | ✅ (USB OTG, BT) | ✅ |
| **Ethernet (TCP/IP)** | ✅ | ✅ (Wi-Fi) | ✅ |
| **Cloud Integration** | ❌ | ✅ (MQTT, Sheets, ThingSpeak) | ❌ |
| **Sensor Publishing** | ❌ | ✅ | ❌ |
| **Device Scanner** | ✅ | ❌ | ✅ |
| **Price** | $49.99 | $2.99 + Add-ons | $149.99 |

[:octicons-arrow-right-24: Compare All Products](../products/index.md)

---

!!! tip "Need Help?"
    Can't find what you're looking for? Check our [Help Center](../support/index.md) or [contact support](mailto:support@quantumbitsolutions.com).