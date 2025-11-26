# Error Codes & Troubleshooting Guide

**Understand and resolve common Modbus Monitor Advanced errors**

This guide explains error codes and their solutions, consolidated from the legacy documentation. Error codes help diagnose communication, configuration, and input issues.

---

## Connection and Communication Errors

These errors occur during Modbus polling or server operations due to protocol/channel mismatches, network issues, or device problems.

### Common Connection Errors

| Error Code | Name | Cause | Solution |
|-----------|------|-------|----------|
| **#3** | Connection or Communication Transaction Create Error | Device not responding or timeout | Check device is powered and reachable; increase Timeout in Settings |
| **#4** | Connection or Communication Transaction Create Error | Similar to #3 | Verify IP address, port, and device availability |
| **#5** | Receive Frame Data Decode Error | Loss of Wi-Fi / Ethernet connection or invalid data | Check network connection; verify IP addresses; restart device |
| **#7** | Modbus Transaction Execute Error | Protocol or device mismatch | Verify correct Protocol (TCP, RTU, ASCII) and Channel (TCP/IP, Serial, Bluetooth) combination |
| **#9** | Slave Returned Error | Device rejected the Modbus request | Check valid Modbus address and slave ID; verify device configuration |
| **#10** | Transaction Response Error | Invalid response from device | Verify device is in Modbus mode; check polling interval isn't too fast |
| **#11** | Response Decode Error | Response data format invalid | Confirm data type (INT16, FLOAT32, etc.) matches device |
| **#12** | Error Closing Connection | TCP/UDP socket closure issue | May be temporary; retry or restart app |
| **#14** | Response Processing Error | Response cannot be processed | Check register address and data type configuration |
| **#15** | Read/Write Processing Error | Data read/write operation failed | Verify permissions and device state |
| **#17** | Packet Transaction ID Mis-match (Late Response?) | Device response delayed or out of order | **Increase Timeout setting** (Settings → Timing → Timeout) |
| **#99** | Error Opening Connection | TCP, UDP, Bluetooth, or USB serial port failure | Check channel/protocol combination; verify USB drivers for serial adapters |

### Protocol & Channel Combinations

**Valid combinations:**

- **TCP/IP Channel**: Modbus TCP, Modbus UDP
- **Serial Channel**: Modbus RTU, Modbus ASCII, RTU over TCP, ASCII over TCP
- **Bluetooth Channel**: Modbus RTU, Modbus ASCII only (NOT TCP)
- **USB OTG Serial**: Modbus RTU, Modbus ASCII via FTDI/SiLab/Prolific adapters

**Common mistake**: Selecting Modbus TCP on Bluetooth Channel → Error #99. Always match the channel to supported protocols.

---

## Input Errors

These errors occur when monitor point configuration contains invalid or out-of-range values.

### Input Error Categories

| Error Code | Field | Valid Range | Issue | Fix |
|-----------|-------|-------------|-------|-----|
| **#1209522** | Count | 1–255 | Count empty, not a number, or out of range | Enter a number between 1 and 255 |
| **#1209522** | Slave ID | 1–255 | Slave ID empty, not a number, or out of range | Enter a number between 1 and 255 |
| **#3209523** | Address | 0–65535 | Address empty, not a number, or out of range | Enter a number between 0 and 65535 (e.g., `40001` for holding register) |
| **#3209523** | Slave ID | 1–255 | Slave ID empty, not a number, or out of range | Enter a number between 1 and 255 |
| **#3209523** | Count | 1–255 | Count empty, not a number, or out of range | Enter a number between 1 and 255 |
| **#3209522** | (Any numeric field) | N/A | Number Conversion Error (keyboard type, spaces, typos) | Check for spaces before/after numbers; use correct keyboard; re-enter carefully |

### How to Fix Input Errors

1. **Open the Monitor Point Configuration** dialog (Main Menu → Monitoring Points → Select point → Change)
2. **Check each field**:
   - **Address**: No spaces, valid Modbus register (e.g., `40001`, `40002`)
   - **Slave ID**: Must be 1 or higher (typically `1`)
   - **Count**: Number of registers to read (1–255)
   - **Data Type**: Match device specs (INT16, FLOAT32, etc.)
3. **Save and retry polling**

---

## Troubleshooting Steps

### Step 1: Check Network & Device

- Ping the device IP from your Android phone (use a network utility app)
- Verify the device is powered on and in Modbus mode
- Check firewall rules don't block the Modbus port (default 502 for TCP)

### Step 2: Verify Monitor Point Configuration

- Open Monitoring Points → Select your point → Change
- Confirm:
  - **Channel** matches your connection type (TCP/IP, Serial, Bluetooth)
  - **Protocol** is supported by the channel
  - **Address**, **Slave ID**, **Count** are within valid ranges (no spaces)
  - **Data Type** matches the device (check device manual)

### Step 3: Increase Timeout (Most Common Fix)

- Main Menu → Settings → Timing → Timeout
- Default is 1000 ms (1 second)
- Try 2000–5000 ms for slow networks or devices
- If still failing, try 10000 ms (10 seconds)

### Step 4: Check Connection Details

- For TCP/IP: Verify IP address and port (default 502)
- For Serial (RTU/ASCII): Verify baud rate (9600, 19200, 38400, etc.)
- For Bluetooth: Ensure device is paired before polling

### Step 5: Restart & Reset

- Close and reopen the app
- Try polling again
- If persistent, export your monitor points (Main Menu → Data → Export) and restart the app

---

## Quick Reference

**Most Common Errors:**

- **#99**: Wrong protocol/channel combo → Fix: Select correct channel in Monitor Point configuration
- **#17**: Timeout too short → Fix: Increase Timeout in Settings → Timing
- **#9**: Invalid address or slave ID → Fix: Verify address and slave ID in device manual
- **#5**: Network disconnected → Fix: Check Wi-Fi/Ethernet connection

---

If you encounter an error not listed here, contact support with:
- Error code number
- Monitor point configuration (Channel, Protocol, Address, Slave ID, Data Type)
- Device type and connection method

