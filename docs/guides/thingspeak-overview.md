!!! note "Navigation"
    **📚 [Documentation Home](../index.md) → [Guides](index.md) → ThingSpeak Overview**

# ThingSpeak Overview Guide

**Cloud analytics and data visualization for Modbus Monitor. Works with both Windows (XPF) and Android.**

![ThingSpeak Channel](../assets/screenshots/xpf/xpf-iot-thingspeak.webp)
---

## What is ThingSpeak?

**ThingSpeak** is a cloud platform (by MathWorks) designed for **IoT data collection, real-time monitoring, data storage, visualization, and basic analytics**.

Both **Modbus Monitor XPF** (Windows) and **Modbus Monitor Advanced** (Android) can publish Modbus data directly to ThingSpeak using simple **HTTP**. On ThingSpeak, you create **Channels**, and each channel contains up to **8 data fields** (Field 1–Field 8). Each incoming update from your Modbus Monitor app becomes an **Entry**, shown in:

- Line charts
- Gauges
- Dashboards
- Analytics scripts (MATLAB)
- Export formats (CSV, JSON, XML)

**Key Features:**

- ✅ **Auto-generated Charts** - Real-time visualization of up to 8 data channels
- ✅ **Cloud Storage** - Free public channels, paid private options
- ✅ **MATLAB Analytics** - Run scripts on your data
- ✅ **Real-time Alerts** - Email/SMS notifications based on thresholds
- ✅ **Public Sharing** - Embed charts or share view links
- ✅ **Data Export** - CSV, JSON, XML downloads

**Common Use Cases:**

- Remote plant / industrial device monitoring
- Tank level and flow system visualization
- Long-term machine health trending
- Over-temperature or low-level alerting
- Dashboard creation for technicians or managers

---

## Why Use ThingSpeak with Modbus Monitor?

Integrating ThingSpeak provides a ready-made cloud system that requires no servers, no database setup, and no programming. Your Modbus data becomes instantly accessible anywhere — on phone, tablet, or PC.

Benefits Across Both Platforms

- 🌎 Remote monitoring from any location
- 📈 Automatic historical charts
- 🔔 Threshold-based alerts
- 💾 Cloud data storage without maintaining servers
- 🛠 Works with both XPF (Windows) and Android
- 🔧 Simple setup: Channel ID + API Key
- 🔄 Updates at your configured polling rate
- 📤 Clean, secure cloud interface for customer access
---

## Getting Started (All Platforms)

### Step 1: Create ThingSpeak Account
1. Visit [thingspeak.com](https://thingspeak.com)
2. Sign up (free account available)
3. Verify email

### Step 2: Create Channel
1. Go to **Channels** → **New Channel**
2. **Name**: e.g., "Modbus Monitor"
3. **Description**: Your project description
4. **Add Fields**: Create up to 8 fields (Field 1, Field 2, etc.)
5. Save and note your **Write API Key**

### Step 3: Configure Your Platform
- **Windows Users**: [Follow Windows Setup](thingspeak-addon-windows.md)
- **Android Users**: [Follow Android Setup](android-thingspeak-addon.md)


### Step 4: Verify Data Flow
- Start polling/monitoring on your app
- Open ThingSpeak channel dashboard
- Charts should update within your configured interval

---

## Platform Setup

<div class="grid cards" markdown>

-   :material-microsoft-windows:{ .lg .middle } **Windows Setup**

    ---

    Modbus Monitor XPF + ThingSpeak Add-on

    - Advanced desktop application
    - Professional monitoring tools
    - Extended data logging features

    ---

    [:octicons-book-24: Windows Setup Guide](thingspeak-addon.md){ .md-button .md-button--primary }

-   :material-android:{ .lg .middle } **Android Setup**

    ---

    Modbus Monitor Advanced + ThingSpeak Add-on

    - Works with TCP/IP, USB Serial, Bluetooth
    - Integrates with MQTT & Google Sheets
    - Mobile-friendly field setup

    ---

    [:octicons-book-24: Android Setup Guide](android-thingspeak-addon.md){ .md-button .md-button--primary }

</div>

---

## Key Concepts

### API Keys

- **Write API Key**: Used by your app to send data to ThingSpeak
- **Read API Key**: Used to retrieve data from ThingSpeak
- Keep Write API Key private

### Update Intervals

- **Free Tier**: Minimum 15 seconds between updates
- **Commercial Tier**: Can be as low as 1 second
- Check ThingSpeak pricing for limits

### Field Mapping
- Monitor points are assigned to ThingSpeak fields in order
- Point 1 → Field 1, Point 2 → Field 2, etc.
- Maximum 8 fields per channel

---

## Common Tasks

**How do I create multiple channels?**  
Create one channel per data collection project. Use different API keys for each.

**Can I make my ThingSpeak data public?**  
Yes. Enable "Public View" in your channel settings to share charts.

**How long is data stored?**  
Free tier: Unlimited (within API limits). Check ThingSpeak pricing for commercial plans.

**Can I export data?**  
Yes. Go to your channel → Data Export tab. Download as CSV, JSON, or XML.

---

## FAQ

 ??? question "Can I upload to multiple ThingSpeak channels?"
    Yes. Each XPF instance uploads data to **ThingSpeak channels** using the first 8 Monitoring Points (if assigned).  

    To publish to multiple channels:    
    - Run multiple XPF instances, define one or more Monitoring Points
    
??? question "Does ThingSpeak work with write-only Modbus access?"
    Yes. You will need a **Write API Key** to send data to your ThingSpeak channel.  
    Check your ThingSpeak account under **Channels → API Keys** and use the key listed in the **Write API Key** section.

??? question "Can I run XPF 24/7?"
    Yes. Set up Windows Task Scheduler for automated polling. Monitor CPU/network usage to ensure device stability.

??? question "What data is kept locally in XPF?"
    XPF keeps local CSV/log files per session. These are separate from ThingSpeak cloud storage. Configure export options in Tools → Options.

??? question "Can I see upload history?"
    Yes. View → Event Log, then filter by "ThingSpeak". Shows all upload successes, failures, and timestamps.

??? question "What if my Modbus values are negative or decimals?"
    ThingSpeak accepts any numeric value. Negative numbers, decimals, and scientific notation all work fine.

---

## Support & Resources

- **ThingSpeak Documentation**: [thingspeak.com/docs](https://thingspeak.com/docs)
- **ThingSpeak Forums**: [thingspeak.com/forums](https://thingspeak.com/forums)
- **Our Support**: [quantumbitsolutions.com/support](https://quantumbitsolutions.com/forums/)

**Need help?** Contact [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)
