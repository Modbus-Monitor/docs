# Android Hardware Guide for Modbus Monitor Advanced

**Compatible devices, adapters, and tested configurations for USB-OTG, Bluetooth, and Ethernet connectivity**

## Overview

Modbus Monitor Advanced supports multiple communication channels through various hardware adapters. This guide covers tested USB-OTG adapters, Bluetooth devices, Ethernet connections, and device compatibility requirements to ensure reliable field deployments.

!!! warning "Device Requirements"
    Your Android device must meet **ALL three requirements** for serial communication:
    
    1. **Android 6.0+** (API 23 or higher for best compatibility; 3.2+ minimum)
    2. **USB Host or OTG interface** (hardware support, not just OS support)
    3. **Approved USB-to-Serial chipset** (FTDI, Prolific, or SiLab only)

## USB-OTG Serial Adapters

### Tested and Verified Adapters

| Manufacturer | Model | Chipset | Protocol | Status |
|--------------|-------|---------|----------|--------|
| StarTech.com | ICUSB2321F | FTDI | RS232 | ✅ Verified |
| StarTech.com | ICUSB422 | FTDI | RS422/485 (No Echo) | ✅ Verified |
| Sabrent | SBT-USC1K | Prolific | RS232 | ✅ Verified |
| SiLab | CP210x | SiLab | RS232/RS485 | ✅ Verified |

### Supported Chipsets

Your USB-to-Serial adapter **must** contain one of the following chipsets:

#### FTDI Chipsets (Recommended)

**Supported Models**:
- FT230X
- FT231X
- FT234XD
- FT232R
- FT232H

**Advantages**:
- Most stable performance with Modbus Monitor Advanced
- Wide Android device compatibility
- Excellent Windows/Mac driver support
- Industrial-grade reliability

**Examples**:
- StarTech ICUSB2321F (RS232)
- StarTech ICUSB422 (RS422/485)
- Adafruit FT232H Breakout
- Many generic "FTDI" adapters on Amazon

#### Prolific Chipsets

**Supported Models**:
- PL2303HXD
- PL2303EA
- PL2303RA

⚠️ **NOT SUPPORTED**: PL2303HXA and PL2303XA (older revisions incompatible)

**Examples**:
- Sabrent SBT-USC1K
- Generic Prolific RS232 adapters

**Note**: Check product specifications carefully; many cheap adapters use obsolete PL2303HXA chips.

#### SiLab Chipsets

**Supported Models**:
- CP210x series

**Examples**:
- Generic SiLab CP210x USB-to-Serial converters
- IoT development boards with CP210x

---

### USB-OTG Cable Requirements

Your USB-OTG cable **must supply power** to the adapter and be compatible with your device:

| Device Type | Recommended Cable |
|-------------|-------------------|
| Micro USB phones/tablets | Micro USB Host OTG Cable **with power pin** |
| USB-C phones/tablets | USB-C OTG Cable with power support |

**Examples of Tested Configurations**:
- Micro USB Host OTG Cable for **Nexus 4, 5, 7, 10**
- Micro USB Host OTG Cable for **Samsung Galaxy Nexus, S III, S IV, S V**
- Quality over convenience: A poor-quality OTG cable is the #1 cause of USB serial failures

### RS485 Configuration

When using RS485 adapters (e.g., StarTech ICUSB422):

- Enable **"No Echo"** setting on the adapter hardware (jumper or switch)
- Configure Modbus Monitor Advanced for **Modbus RTU** protocol
- Set proper **Baud Rate** (typically 9600 or 19200)
- Use appropriate **Slave ID** for target RS485 devices

---

## Bluetooth Serial Adapters

### Android Bluetooth Support

**Minimum Android Version**: Modbus Monitor Advanced v4.0.0+

**Tested Android Configurations**:
- Android 2.3.3 (older phones)
- Android 4.1.1 (mini-computers)
- Android 4.2.2+ (modern phones)
- Android 6.0+ (recommended)

### Tested Bluetooth Adapters

| Manufacturer | Model | Type | Status |
|--------------|-------|------|--------|
| SIIG | RS-232 to Bluetooth Converter (ID-SB0011-S1) | Serial Bluetooth | ✅ Verified |
| Broadcom | 20702 Bluetooth 4.0 Adapter | Bluetooth 4.0 | ✅ Verified |
| Kensington | 33348 Bluetooth Adapter | Bluetooth | ✅ Verified |

### Pairing Instructions

1. **Enable Bluetooth** on your Android device
2. **Put adapter in discovery mode** (consult adapter manual)
3. **Search for devices** in Android Bluetooth settings
4. **Select the adapter** and confirm pairing
5. **Grant permissions** when Modbus Monitor Advanced requests them
6. **Verify connection** by testing a monitor point in Client Mode

### Bluetooth Limitations

- Only **Modbus RTU** and **Modbus ASCII** protocols supported (not TCP)
- Range typically 10–30 meters (line of sight)
- Power consumption is moderate; ensure device has adequate battery
- Some older adapters may have pairing issues; update adapter firmware if possible

---

## USB Ethernet Adapters

### For Modbus TCP Over Ethernet

| Manufacturer | Model | Speed | Status |
|--------------|-------|-------|--------|
| BobjGear | BJGRTTUSBEA20 | 10/100 Mbps | ✅ Verified |

### Use Cases

- Connect Android device to wired Ethernet network
- Modbus TCP communication when Wi-Fi is unavailable
- Industrial environments with dedicated Ethernet infrastructure
- Redundant network path for critical monitoring

### Configuration

1. Connect adapter to Android device via USB-OTG cable
2. Connect Ethernet cable to adapter
3. Android should auto-detect and configure DHCP
4. Verify connection via Modbus Monitor Advanced Network settings
5. Use standard Modbus TCP configuration (port 502 or 8888)

---

## Device Compatibility

### Verified Working Devices

**Phones**:
- Motorola Moto X series
- Samsung Galaxy Nexus
- Samsung Galaxy S III, IV, V
- Nexus-series phones

**Tablets**:
- Nexus 7, 10
- Samsung Galaxy tablets (with OTG support)
- Industrial Android tablets (e.g., Zebra, Honeywell)

### Checking USB-OTG Support

1. **Easy OTG Checker** ([Google Play](https://play.google.com/store/apps/details?id=com.kjarvel.easyotgchecker){:target="_blank"}) - Simple yes/no test
2. **USB OTG Checker** - Comprehensive hardware verification
3. Contact device manufacturer for USB-OTG hardware support confirmation

### Device Configuration

**Recommended Settings**:
- **Screen timeout**: Disable or set to maximum (don't let screen sleep during monitoring)
- **USB debugging**: Enable (Settings → Developer Options)
- **Battery optimization**: Whitelist Modbus Monitor Advanced to prevent forced sleep
- **WiFi/Bluetooth**: Keep enabled for continuous connectivity
- **Permissions**: Grant location, USB, and network access as needed

---

## Connection Troubleshooting

### USB Serial Not Detected

**Symptoms**: Adapter plugged in but app shows "Serial Port Not Found"

**Solutions**:

1. **Restart the app after plugging in** - Android must recognize the adapter on first connection
2. **Verify adapter is recognized** - Use Easy OTG Checker or device-specific apps (FTDI App, Prolific App)
3. **Check cable quality** - Poor OTG cables are a common cause; test with Easy OTG Checker
4. **Verify chipset** - Confirm adapter has FTDI, Prolific (PL2303HXD/EA/RA), or SiLab CP210x chipset
5. **Check device support** - Run Easy OTG Checker; if it reports "not supported," device lacks USB-OTG hardware
6. **Review manufacturer restrictions** - Some phones have USB-OTG disabled by manufacturer even if OS supports it

### Bluetooth Connection Drops

**Symptoms**: Bluetooth adapter connects but loses connection mid-session

**Solutions**:

1. **Move closer to adapter** - Bluetooth range is 10–30 meters; obstacles reduce it
2. **Check battery level** - Low battery on adapter can cause intermittent drops
3. **Update adapter firmware** - Many Bluetooth adapters have firmware updates available
4. **Disable WiFi/BLE interference** - Move away from Wi-Fi routers and other Bluetooth devices
5. **Verify protocol** - Confirm Modbus RTU or ASCII is selected (not TCP)

### Ethernet Connection Not Working

**Symptoms**: USB Ethernet adapter plugged in but no network detected

**Solutions**:

1. **Check Ethernet cable** - Try a different cable or verify connection with another device
2. **Verify DHCP** - Device should auto-detect DHCP; check network settings in Android
3. **Test static IP** - If DHCP fails, manually configure static IP in Modbus Monitor Advanced settings
4. **Restart app** - Unplug adapter, restart app, plug adapter back in
5. **Check network isolation** - Confirm Modbus server is on same network segment

---

## Best Practices for Field Deployment

### Pre-Deployment Checklist

- [ ] Test USB adapter with Easy OTG Checker or manufacturer's test app
- [ ] Verify Modbus connection works **before** leaving office
- [ ] Test all required communication channels (TCP/IP, USB Serial, Bluetooth)
- [ ] Configure at least one working monitor point with real data
- [ ] Enable cloud logging (Google Sheets, MQTT) for remote visibility if needed
- [ ] Verify battery will last entire field session (enable battery saver if needed)
- [ ] Create backup monitor point configuration (export as CSV)
- [ ] Take spare USB-OTG cable and spare adapter

### In the Field

- **Keep cables protected** - USB OTG cables break easily with repeated use
- **Monitor battery closely** - Field work often extends longer than planned
- **Document device settings** - Save screenshots of successful configurations
- **Test connection periodically** - Don't wait until end of shift to discover connection loss
- **Use industrial tablets when possible** - Rugged devices have better durability and battery

### Post-Deployment

- Store device in protective case with cables organized
- Back up monitor point configurations regularly
- Update adapter firmware periodically
- Replace worn/damaged cables proactively
- Document any adapter compatibility issues for future reference

---

## Comparison: Communication Channels

| Channel | Protocol | Speed | Range | Power | Setup Complexity | Best For |
|---------|----------|-------|-------|-------|------------------|----------|
| **TCP/IP (WiFi)** | Modbus TCP | Fast | Up to 100m | Medium | Easy | Office, nearby devices |
| **USB-OTG Serial** | RTU/ASCII | Slow | 5m (cable) | Low | Medium | Industrial equipment, RS232/485 |
| **Bluetooth** | RTU/ASCII | Medium | 10–30m | Medium | Hard | Wireless serial, legacy adapters |
| **Ethernet (USB)** | Modbus TCP | Fast | Wired | Medium | Easy | Wired infrastructure, redundancy |

---

## External Resources

!!! tip "Manufacturer Support"
    For detailed specifications on specific adapters, visit manufacturer websites:
    
    - [StarTech USB Serial Adapters](https://www.startech.com/){:target="_blank"}
    - [FTDI Chipset Products](https://ftdichip.com/){:target="_blank"}
    - [Prolific Technology](https://www.prolific.com.tw/){:target="_blank"}
    - [Silicon Labs CP210x](https://www.silabs.com/){:target="_blank"}

!!! info "Field Testing Tools"
    Recommended Android apps from Google Play Store:
    
    - **Easy OTG Checker** - Quick USB-OTG hardware verification
    - **FTDI Android App** - Test FTDI adapters
    - **Prolific Android App** - Test Prolific adapters
    - **Network Analyzer** - Verify TCP/IP and Ethernet connectivity

---

## FAQ

??? question "My USB adapter works on Windows but not on Android. Why?"
    Android requires specific chipsets (FTDI, Prolific HXD/EA/RA, SiLab CP210x). Many cheap USB adapters use generic CH340 or unsupported Prolific (HXA/XA) chips that work on Windows but not Android. Always verify the **exact** chipset before purchasing.

??? question "Can I use any USB OTG cable?"
    **No.** Many cheap OTG cables have poor shielding or weak power delivery. Always use quality cables from reputable brands (StarTech, Belkin, Anker) and test with Easy OTG Checker before field deployment.

??? question "Is USB-C OTG supported?"
    Yes, on USB-C Android devices (Pixel, Samsung Galaxy Note 20+, etc.). Use a proper USB-C OTG adapter with power support. Configuration is identical to Micro USB OTG.

??? question "Can I use a hub to connect multiple serial adapters?"
    Not recommended. Most Android devices have limited USB-OTG power budgets. Each serial adapter consumes power; a hub can cause voltage drops. Connect one adapter directly via OTG cable.

??? question "Why does my adapter disconnect after 10 minutes?"
    Most likely: (1) battery optimization is putting app to sleep, (2) OTG cable is marginal quality, (3) adapter needs power and OTG cable isn't supplying it. Test with Easy OTG Checker and whitelist app in battery settings.

??? question "Can I use Bluetooth and WiFi at the same time?"
    Yes. Modbus Monitor Advanced can alternate between channels in Client Mode or use them for different monitor points. However, simultaneous polling on both channels may consume excessive power.

---

**Ready to connect your Android device to industrial Modbus networks with confidence.**
