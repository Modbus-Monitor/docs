# MQTT Add-on for Modbus Monitor Advanced

**Real-time IoT data publishing from Android to any MQTT broker**

![MQTT Integration](../assets/screenshots/android-advanced/mma-mqtt-overview.webp){ .screenshot-center loading="lazy" }

!!! success "Quick Links"
    [:material-rocket-launch-outline: **Quick Start**](#quick-start-setup) | [:material-cog: **Configuration Guide**](#detailed-configuration) | [:material-frequently-asked-questions: **FAQ**](#frequently-asked-questions)

## Overview

The MQTT Add-on extends Modbus Monitor Advanced with professional IoT capabilities, enabling real-time data publishing to cloud platforms, enterprise message brokers, and custom dashboards.

**Key Features:**

- ✅ **Universal Broker Support** - AWS IoT, Azure IoT Hub, HiveMQ, Mosquitto, EMQX
- ✅ **Secure Connections** - TLS/SSL encryption with certificate authentication
- ✅ **Flexible Topics** - Customizable topic structure with device ID and point names
- ✅ **Batch Publishing** - Single JSON message or individual topics per monitor point
- ✅ **Real-time Streaming** - Automatic publish on each polling cycle completion
- ✅ **QoS Control** - Quality of Service levels 0, 1, 2 for reliability tuning

---

## Quick Start Setup

### Prerequisites

- Modbus Monitor Advanced installed (v1.x or later)
- MQTT Add-on purchased and activated
- MQTT broker accessible (cloud or local)
- Broker connection details (host, port, credentials)

### 5-Minute Configuration

1. **Enable MQTT in Settings**
   - Open app → Hamburger Menu → Settings → MQTT
   - Toggle "Enable MQTT" ON

2. **Configure Broker Connection**
   - **Broker Host**: Enter broker address (e.g., `broker.hivemq.com`)
   - **Port**: Standard MQTT port (1883 non-TLS, 8883 TLS)
   - **Client ID**: Unique identifier for this device (e.g., `android-field-01`)

3. **Set Base Topic**
   - **Topic Prefix**: Base path for all published data (e.g., `modbus/devices/android01`)
   - App auto-appends monitor point names or `/batch` for JSON mode

4. **Add Credentials** (if required)
   - **Username**: MQTT broker username
   - **Password**: MQTT broker password

5. **Start Publishing**
   - Start Client Mode polling
   - Data publishes automatically after each cycle

**Verify Publishing:**
- Use MQTT Explorer or `mosquitto_sub` to subscribe to your topics
- Check broker logs for successful connections

---

## Detailed Configuration

### Connection Settings

![MQTT Connection Settings](../assets/screenshots/android-advanced/mma-mqtt-settings.webp){ .screenshot-center loading="lazy" }

**Broker Configuration:**

| Setting | Description | Example | Required |
|---------|-------------|---------|----------|
| **Broker Host** | MQTT broker hostname or IP | `mqtt.example.com` | Yes |
| **Port** | MQTT port (1883 standard, 8883 TLS) | `1883` | Yes |
| **Client ID** | Unique device identifier | `android-sensor-42` | Yes |
| **Username** | Authentication username | `field_device_01` | If broker requires |
| **Password** | Authentication password | `●●●●●●●●` | If broker requires |
| **Use TLS/SSL** | Enable encrypted connection | Checked/Unchecked | Optional |

**Topic Structure:**

| Setting | Description | Example | Result Topic |
|---------|-------------|---------|--------------|
| **Base Topic** | Root path for all messages | `factory/line2/modbus` | - |
| **Device Suffix** | Auto-append Client ID | Enabled | `factory/line2/modbus/android-sensor-42` |
| **Point Topics** | Publish each point separately | Enabled | `.../tank_level`, `.../motor_speed` |
| **Batch Topic** | Single JSON with all points | Enabled | `.../batch` |

### Publishing Modes

**Individual Point Publishing:**
```
Topic: modbus/devices/android01/tank_level
Payload: 75.3

Topic: modbus/devices/android01/motor_speed
Payload: 1450
```

**Batch JSON Publishing:**
```
Topic: modbus/devices/android01/batch
Payload: {
  "timestamp": "2025-11-25T14:30:22Z",
  "device_id": "android01",
  "points": [
    {"name": "tank_level", "value": 75.3, "unit": "L"},
    {"name": "motor_speed", "value": 1450, "unit": "RPM"}
  ]
}
```

### TLS/SSL Configuration

![MQTT TLS Setup](../assets/screenshots/android-advanced/mma-mqtt-tls.webp){ .screenshot-center loading="lazy" }

**For Secure Brokers:**

1. Enable "Use TLS/SSL" toggle
2. Select certificate validation mode:
   - **System CA**: Trust Android system certificates (recommended for public brokers)
   - **Custom CA**: Upload broker's CA certificate for private brokers
   - **Skip Verification**: Disable validation (testing only, not recommended)

3. Client certificates (mutual TLS):
   - Upload client certificate (`.crt` or `.pem`)
   - Upload client private key
   - Enter key password if encrypted

---

## Use Cases & Examples

### AWS IoT Core Integration

**Configuration:**
```yaml
Broker: xxxxx.iot.us-east-1.amazonaws.com
Port: 8883
TLS: Enabled
Client Cert: device-cert.pem
Topic: devices/android/modbus/data
```

**[See full AWS IoT setup guide →](https://docs.aws.amazon.com/iot/)**

### Azure IoT Hub Integration

**Configuration:**
```yaml
Broker: your-hub.azure-devices.net
Port: 8883
Username: your-hub.azure-devices.net/device-id/?api-version=2021-04-12
Password: SAS Token
Topic: devices/device-id/messages/events/
```

**[See full Azure IoT setup guide →](https://learn.microsoft.com/azure/iot/)**

### Local Mosquitto Broker

**Configuration:**
```yaml
Broker: 192.168.1.100
Port: 1883
TLS: Disabled
Username: local_user
Password: local_pass
Topic: factory/line1/modbus
```

### Node-RED Dashboard Integration

**Configuration:**
```yaml
Broker: localhost (if Node-RED on device) or LAN IP
Port: 1883
Topic: nodered/modbus/input
```

**Node-RED Flow:** Subscribe to topic → Parse JSON → Dashboard gauges

---

## Troubleshooting

### Common Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| **Connection Failed** | Wrong host/port | Verify broker details; check firewall |
| **Authentication Error** | Invalid credentials | Confirm username/password; check broker logs |
| **TLS Handshake Failed** | Certificate mismatch | Verify CA certificate; check broker TLS config |
| **No Data Published** | MQTT disabled or Client Mode stopped | Enable MQTT toggle; start polling |
| **Messages Not Received** | Wrong topic subscription | Check topic structure; verify wildcards (`#`, `+`) |

### Testing MQTT Connection

**Using Mosquitto CLI:**
```bash
# Subscribe to all topics
mosquitto_sub -h broker.example.com -p 1883 -t "modbus/#" -u username -P password

# Test publish
mosquitto_pub -h broker.example.com -p 1883 -t "modbus/test" -m "hello" -u username -P password
```

**Using MQTT Explorer (GUI):**
1. Download MQTT Explorer
2. Add connection with your broker details
3. Subscribe to `#` (all topics)
4. Start app polling and watch for published messages

---

## Frequently Asked Questions

??? question "What's the difference between point topics and batch JSON?"
    **Point Topics**: Each monitor point publishes to its own topic (e.g., `modbus/device01/tank_level`). Good for subscribing to specific values.
    
    **Batch JSON**: All monitor points in a single JSON message to one topic (e.g., `modbus/device01/batch`). Efficient for dashboards displaying multiple values.
    
    You can enable both modes simultaneously.

??? question "How often does MQTT publish?"
    MQTT publishes automatically after each complete polling cycle through all monitor points. Polling interval is controlled by Settings → Timing → Poll Interval (default 1000ms).

??? question "Does MQTT work with Sensor Server mode?"
    Yes! Sensor values (accelerometer, gyro, etc.) are published just like Modbus monitor points. Topic names use the sensor name.

??? question "Can I use MQTT without internet?"
    Yes, if you have a local MQTT broker (Mosquitto, HiveMQ) on your LAN. The app only needs network access to the broker, not internet.

??? question "What happens if the broker goes offline?"
    Messages are not queued or cached. When the broker reconnects, publishing resumes from the current cycle. For critical data retention, use the Google Sheets Add-on for logging.

??? question "How do I secure my MQTT connection?"
    1. Use TLS/SSL (port 8883)
    2. Enable client certificate authentication (mutual TLS)
    3. Use strong passwords
    4. Restrict broker access by IP/firewall
    5. Set appropriate QoS levels

??? question "Can multiple Android devices publish to the same broker?"
    Yes. Use unique Client IDs and topic prefixes for each device to avoid collisions. Example: `modbus/device01/`, `modbus/device02/`, etc.

---

## Best Practices

**Topic Design:**
- Use hierarchical structure: `company/site/area/device/point`
- Include device ID for multi-device deployments
- Keep topic names short and descriptive
- Use lowercase with underscores: `tank_level` not `Tank Level`

**Performance:**
- Poll interval ≥ 1000ms for stable networks
- Use batch JSON for >10 monitor points
- QoS 0 for high-frequency non-critical data
- QoS 1 for important values

**Security:**
- Always use TLS/SSL for cloud brokers
- Rotate credentials periodically
- Use read-only credentials where possible
- Monitor broker logs for unauthorized access

**Reliability:**
- Test connection before deployment
- Set up broker monitoring/alerts
- Document topic structure for team
- Keep backup of configuration

---

## Additional Resources

- **MQTT Protocol**: [mqtt.org](https://mqtt.org/)
- **HiveMQ Tutorials**: [hivemq.com/mqtt-essentials](https://www.hivemq.com/mqtt-essentials/)
- **AWS IoT Docs**: [docs.aws.amazon.com/iot](https://docs.aws.amazon.com/iot/)
- **Azure IoT Docs**: [learn.microsoft.com/azure/iot](https://learn.microsoft.com/azure/iot/)

**Need Help?** Contact [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Advanced Guide](../products/android/advanced-guide.md#add-ons-integration)
