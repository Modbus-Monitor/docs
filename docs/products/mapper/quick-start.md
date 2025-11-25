# Modbus Mapper Pro - Quick Start Guide

**Get up and running with Modbus traffic analysis in 10 minutes**

## Overview

This quick start guide will have you monitoring Modbus RTU traffic and building register maps in just a few minutes.

## Prerequisites

- Windows PC with available USB port
- USB-to-RS485 adapter  
- Access to existing Modbus RTU network
- Modbus Mapper Pro downloaded and extracted

## Step-by-Step Setup

### 1. Hardware Connection (2 minutes)

```
Modbus Network:  [HMI] ←→ [RS485 Bus] ←→ [Field Devices]
                              ↑
Your Monitor:    [PC] ←→ [USB-RS485] ←→ [Tap into Bus]
```

**Connection Points:**
- **A Terminal** → Connect to A/+ line  
- **B Terminal** → Connect to B/- line
- **Ground** → Connect to network ground (if available)

!!! warning "Non-Intrusive Connection"
    You're only **listening** to traffic. This connection should not disrupt existing communications.

### 2. Software Setup (3 minutes)

1. **Extract** ModbusMapperPro files to a folder
2. **Run** `ModbusMapperPro.exe` (no installation needed)
3. **Configure serial port:**
   - Select your USB-to-RS485 COM port
   - Set baud rate to match your network (usually 9600, 19200, or 38400)
   - Set data bits, parity, stop bits to match network

### 3. Start Monitoring (1 minute)

1. **Click "Start Monitoring"** button
2. **Wait for traffic** - you should see frames being captured
3. **Verify connection** - look for valid Modbus frames in the display

### 4. Analyze Results (4 minutes)

**What You'll See:**
- **Real-time frames** being captured and decoded
- **Register addresses** being polled by the master
- **Data values** returned by slaves  
- **Communication patterns** emerging over time

**Key Indicators:**
- ✅ **Green frames** = Valid Modbus communication
- ❌ **Red frames** = Errors or invalid data
- 📊 **Statistics** = Traffic volume and success rates

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