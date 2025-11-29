# 📚 Quantum Bit Solutions - Documentation Hub

!!! info "Welcome to QBS Documentation"
    **Complete guides** for all Quantum Bit Solutions products and services.  
    **Professional Modbus tools** for automation engineers, OEMs, and testing teams.

---

## Quick Navigation

[**Our Products**](#our-products) · [**Platform Quick Links**](#platform-quick-links) · [**Cloud & Add-ons**](#cloud--add-ons) · [**Technical Guides**](#technical-guides--references) · [**Feature Comparison**](#feature-comparison) · [**Quick Start**](#quick-start-by-use-case) · [**Support**](#need-help)

---

## Start Here

<div class="grid cards" markdown>

-   :material-lifebuoy:{ .lg .middle } **Top Fixes**

    ---

    Quick access to the most‑visited help topics.

    - [:octicons-alert-24: Error Codes](guides/error-codes.md)
    - [:octicons-usb-24: USB‑OTG Serial & Adapters](guides/android-hardware.md#usb-otg-serial-adapters)
    - [:octicons-server-24: Android Server Mode](products/android/advanced-guide.md#modbus-server-mode-slave)
    - [:octicons-device-camera-video-24: Sensor Server](products/android/advanced-guide.md#sensor-server-mode)

-   :material-compass:{ .lg .middle } **Popular Guides**

    ---

    - [:octicons-book-24: Arduino Modbus RTU Server](technical/arduino-server.md)
    - [:octicons-file-24: Import & Export](guides/import-export.md)
    - [:octicons-question-24: FAQ](support/faq.md)

</div>

---

## Our Products

<div class="grid cards" markdown>

-   :material-monitor-dashboard:{ .lg .middle } **Modbus Monitor XPF**

    ---

    **Professional Windows application** for Modbus monitoring, logging, and analysis.

    - Real-time TCP/RTU/ASCII monitoring
    - Advanced data visualization & trending
    - Network diagnostics & logging
    - MQTT & ThingSpeak cloud integration

    **Core Guides:**  
    [:octicons-book-24: User Guide](products/xpf/user-guide.md) · [:octicons-rocket-24: Quick Start](products/xpf/quick-start.md)

    **Add-ons:**  
    [:octicons-arrow-right-24: MQTT Add-on](guides/mqtt-addon.md) · [:octicons-arrow-right-24: ThingSpeak Add-on](guides/thingspeak-overview.md)

-   :material-android:{ .lg .middle } **Modbus Monitor Advanced**

    ---

    **Full-featured Android client** for mobile Modbus monitoring and cloud integration.

    - TCP/IP, USB Serial, Bluetooth channels
    - Professional data logging & analysis
    - Field-ready diagnostics
    - Cloud integration (MQTT, Sheets, ThingSpeak)

    **Core Guides:**  
    [:octicons-book-24: User Guide](products/android/advanced-guide.md) · [:octicons-download-24: Play Store](https://play.google.com/store/apps/details?id=com.quantumbitsolutions.modbusmonitor)

    **Add-ons:**  
    [:octicons-arrow-right-24: MQTT](guides/android-mqtt-addon.md) · [:octicons-arrow-right-24: Google Sheets](guides/android-sheets-addon.md) · [:octicons-arrow-right-24: ThingSpeak](guides/thingspeak-overview.md)

-   :material-android:{ .lg .middle } **Modbus Console (Free)**

    ---

    **Basic Android testing tool** for quick Modbus verification and troubleshooting.

    - Simple read/write operations
    - TCP and Serial support
    - Perfect for quick tests
    - No cost, no ads

    **Guides:**  
    [:octicons-book-24: User Guide](products/android/free-guide.md) · [:octicons-download-24: Play Store](https://play.google.com/store/apps/details?id=com.quantumbitsolutions.modbusconsole)

-   :material-map:{ .lg .middle } **Modbus Mapper Pro**

    ---

    **Protocol sniffer and network analyzer** for Modbus systems and troubleshooting.

    - Live traffic analysis & decode
    - Protocol verification
    - Device discovery & mapping
    - Communication troubleshooting

    **Guides:**  
    [:octicons-book-24: User Manual](products/mapper/user-manual.md) · [:octicons-rocket-24: Quick Demo](products/mapper/quick-start.md)

</div>

---

## Platform Quick Links

| Platform | Get Started | Advanced Setup | Cloud Integration |
|----------|-------------|-----------------|-------------------|
| **Windows (XPF)** | [:octicons-rocket-24: Quick Start](products/xpf/quick-start.md) | [:octicons-book-24: Full Guide](products/xpf/user-guide.md) | [:octicons-arrow-right-24: MQTT](guides/mqtt-addon.md) · [:octicons-arrow-right-24: ThingSpeak](guides/thingspeak-addon-windows.md) |
| **Android Advanced** | [:octicons-download-24: Install](https://play.google.com/store/apps/details?id=com.quantumbitsolutions.modbusmonitor) | [:octicons-book-24: Full Guide](products/android/advanced-guide.md) | [:octicons-arrow-right-24: MQTT](guides/android-mqtt-addon.md) · [:octicons-arrow-right-24: Sheets](guides/android-sheets-addon.md) · [:octicons-arrow-right-24: ThingSpeak](guides/android-thingspeak-addon.md) |
| **Android Free** | [:octicons-download-24: Install](https://play.google.com/store/apps/details?id=com.quantumbitsolutions.modbusconsole) | [:octicons-book-24: User Guide](products/android/free-guide.md) | Cloud not available |
| **Mapper Pro** | [:octicons-rocket-24: Quick Demo](products/mapper/quick-start.md) | [:octicons-book-24: Full Manual](products/mapper/user-manual.md) | N/A |

---

## Cloud & Add-ons

### Android Add-ons

Extend Modbus Monitor Advanced with cloud connectivity:

| Add-on | What It Does | Guide |
|--------|--------------|-------|
| **MQTT** | Publish data to any MQTT broker (HiveMQ, AWS IoT, Azure) | [:octicons-book-24: MQTT Guide](guides/android-mqtt-addon.md) |
| **Google Sheets** | Log data directly to spreadsheets | [:octicons-book-24: Sheets Guide](guides/android-sheets-addon.md) |
| **ThingSpeak** | Cloud charts, MATLAB analytics, real-time alerts | [:octicons-book-24: ThingSpeak Setup](guides/android-thingspeak-addon.md) |

### Windows Add-ons

Extend Modbus Monitor XPF with cloud connectivity:

| Add-on | What It Does | Guide |
|--------|--------------|-------|
| **MQTT** | Publish data to any MQTT broker | [:octicons-book-24: MQTT Guide](guides/mqtt-addon.md) |
| **ThingSpeak** | Cloud charts, MATLAB analytics, real-time alerts | [:octicons-book-24: ThingSpeak Setup](guides/thingspeak-addon-windows.md) |

### Cloud Platform Guides

Learn about cloud integrations for all platforms:

| Platform | Description | Guide |
|----------|-------------|-------|
| **ThingSpeak Overview** | Concepts, use cases, MATLAB integration, best practices | [:octicons-book-24: ThingSpeak Guide](guides/thingspeak-overview.md) |

---

## Technical Guides & References

| Topic | Description | Guides |
|-------|-------------|--------|
| **Hardware Integration** | USB Serial adapters, Bluetooth modules, network equipment | [:octicons-arrow-right-24: Hardware Guides](guides/android-hardware.md) |
| **Modbus Protocol** | Address formatting (6-digit), error codes, protocol specifications | [:octicons-arrow-right-24: Addressing](guides/6-digit-addressing.md) · [:octicons-arrow-right-24: Error Codes](guides/error-codes.md) |
| **Data Integration** | Import/Export configurations, Google Sheets, custom scripting | [:octicons-arrow-right-24: Import/Export](guides/import-export.md) |
| **Features & Demo** | Feature overview, live demonstrations, use case examples | [:octicons-arrow-right-24: Features Demo](guides/features-demo.md) |
| **Additional Resources** | Asset guides, real-time editing help, content migration | [:octicons-arrow-right-24: Assets Guide](guides/assets-guide.md) · [:octicons-arrow-right-24: Real-time Editing](guides/real-time-editing-help.md) |
| **Getting Help** | FAQs, troubleshooting, community forum, contact support | [:octicons-arrow-right-24: FAQ](https://quantumbitsolutions.com/forums/) · [:octicons-arrow-right-24: Support](https://quantumbitsolutions.com/contact-us/) |

---

## Feature Comparison

| Feature | XPF (Windows) | Advanced (Android) | Free (Android) | Mapper Pro |
|---------|:-------------:|:------------------:|:--------------:|:----------:|
| Real-time Monitoring | ✅ | ✅ | ✅ | ✅ |
| Data Logging | ✅ Advanced | ✅ | ❌ | ✅ Traffic |
| Cloud Integration | ✅ MQTT/ThingSpeak | ✅ MQTT/Sheets/ThingSpeak | ❌ | ❌ |
| Network Analysis | ✅ | ❌ | ❌ | ✅ Advanced |
| Multiple Connections | ✅ | ✅ | ⚠️ Limited | ✅ |
| Data Export | ✅ CSV/JSON | ✅ CSV | ❌ | ✅ CSV |

---

## Quick Start by Use Case

| What I Want to Do | Guide |
|-------------------|-------|
| Monitor Modbus devices | [:octicons-arrow-right-24: XPF User Guide](products/xpf/user-guide.md) or [:octicons-arrow-right-24: Android Guide](products/android/advanced-guide.md) |
| Upload data to the cloud | [:octicons-arrow-right-24: ThingSpeak Overview](guides/thingspeak-overview.md) or [:octicons-arrow-right-24: MQTT Setup](guides/mqtt-addon.md) |
| Analyze network traffic | [:octicons-arrow-right-24: Modbus Mapper Pro](products/mapper/user-manual.md) |
| Find hardware compatibility | [:octicons-arrow-right-24: Hardware Guide](guides/android-hardware.md) |
| Troubleshoot errors | [:octicons-arrow-right-24: Error Codes](guides/error-codes.md) |
| Understand Modbus addressing | [:octicons-arrow-right-24: 6-Digit Addressing](guides/6-digit-addressing.md) |

---

## Need Help?

!!! tip "Support Options"
    
    - **[Community Forum](https://quantumbitsolutions.com/forums/)** - Ask questions and share experiences
    - **[Contact Support](https://quantumbitsolutions.com/contact-us/)** - Direct support for licensing and issues
    - **[Email](mailto:support@quantumbitsolutions.com)** - support@quantumbitsolutions.com
    - **[Live Chat](https://quantumbitsolutions.com/)** - Available during business hours

!!! note "Documentation Status"
    This documentation is continuously updated to match our products. All guides are current as of **November 2025**.
