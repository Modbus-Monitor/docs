!!! note "Navigation"
    **📚 [Documentation Home](../../) → [XPF User Guide](../products/xpf/user-guide.md) → MQTT Add-on**

# MQTT Add-on

**General-purpose messaging and IoT connectivity add-on for Modbus Monitor XPF**

## Overview

The MQTT Add-on enables Modbus Monitor XPF to publish and subscribe to MQTT brokers for general IoT messaging, cloud integration, and distributed system communication. This add-on provides:

- **Universal MQTT Connectivity**: Connect to any MQTT broker (AWS IoT, Azure IoT, HiveMQ, Mosquitto, etc.)
- **Bi-directional Communication**: Both publish monitor point data and subscribe to control commands
- **Advanced Security**: TLS/SSL encryption, client certificates, and authentication support
- **Flexible Topic Management**: Custom topic structures with dynamic variable substitution
- **JSON Message Support**: Structured data publishing with configurable JSON formatting
- **Quality of Service**: QoS 0, 1, and 2 support for reliable message delivery
- **Retained Messages**: Store last known values for new subscribers

!!! info "Add-on vs Core Features"
    **MQTT Add-on** provides general MQTT messaging capabilities for any broker, while **ThingSpeak Add-on** is specifically designed for ThingSpeak cloud platform integration with dedicated features for channel management.

## Quick Start

### 1. Purchase Add-on

You need both an MQTT broker (cloud or local) and the XPF MQTT Add-on:

#### A. MQTT Broker Service
- **Free Options**: 
  - Local: [Eclipse Mosquitto](https://mosquitto.org/) (free local broker)
  - Cloud: [HiveMQ Cloud](https://www.hivemq.com/cloud/) (free tier available)
  - AWS IoT Core (pay-as-you-go)
- **Commercial Brokers**: AWS IoT, Azure IoT Hub, Google Cloud IoT Core
- **Enterprise**: Private MQTT broker installations

#### B. Modbus Monitor XPF MQTT Add-on (Integration Software)
- **Purchase Required**: Buy MQTT Add-on from [Quantum Bit Solutions Shop](https://quantumbitsolutions.com/shop/)
  - Search for "MQTT Add-on" or "XPF MQTT Integration"
  - Enables XPF to connect to any MQTT broker
  - Includes advanced security and topic management features
- **Installation**: Follow add-on installation instructions after purchase

### 2. Configure Add-on
- [Configure MQTT broker connection](#step-1-configure-mqtt-broker-connection)
- [Set up topics for publishing and subscribing](#step-2-configure-topics)
- [Map monitor points to MQTT messages](#step-3-message-mapping)

### 3. Configure Monitor Points
- **See**: [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) in main user guide
- **Focus**: Ensure monitor points are collecting the data you want to publish via MQTT

### 4. Start Messaging & Verify
- [Enable MQTT communication](#step-4-enable-mqtt-communication)
- [Verify message flow](#verification-checklist) to/from broker
- [Monitor connection status](#monitoring-and-maintenance) and troubleshoot if needed

## Prerequisites

Before starting, ensure you have:

- [ ] **Modbus Monitor XPF** installed with MQTT Add-on enabled
- [ ] **MQTT broker access** (cloud service or local installation)
- [ ] **Broker credentials** (username, password, certificates if required)
- [ ] **Monitor points configured** for the data you want to publish
- [ ] **Network connectivity** to MQTT broker
- [ ] **Valid licensing** for commercial use (if applicable)

## Step 1: Configure MQTT Broker Connection

### MQTT Broker Configuration

Configure the MQTT Add-on to connect to your chosen MQTT broker:

!!! note "MQTT vs ThingSpeak"
    The MQTT Add-on provides general MQTT protocol connectivity to any broker, while ThingSpeak Add-on is specifically designed for ThingSpeak platform integration.

### XPF MQTT Setup

1. **Open MQTT Add-on Settings**
   - Navigate to **Add-ons** → **MQTT** in XPF
   - Or go to **Client** tab → **MQTT** group

2. **Enter Broker Connection Details**
   - **Broker Host**: Your MQTT broker hostname or IP address
   - **Port**: MQTT port (1883 for non-secure, 8883 for TLS)
   - **Client ID**: Unique identifier for this XPF instance
   - **Username**: MQTT broker username (if required)
   - **Password**: MQTT broker password (if required)

3. **Configure Security Settings**
   - **TLS/SSL**: Enable for encrypted connections
   - **Client Certificates**: Upload certificates for mutual authentication
   - **CA Certificate**: Upload broker's certificate authority
   - **Ignore Certificate Errors**: For testing only (not recommended for production)

### Connection Parameters

| Setting | Example Value | Description |
|---------|---------------|-------------|
| **Broker Host** | `mqtt.hivemq.com` | MQTT broker hostname or IP address |
| **Port** | `8883` | 1883 (non-TLS) or 8883 (TLS) |
| **Client ID** | `XPF-Plant1-001` | Unique identifier for this connection |
| **Username** | `your-username` | Broker authentication username |
| **Password** | `your-password` | Broker authentication password |
| **TLS/SSL** | `Enabled` | Secure encrypted connection |

## Step 2: Configure Topics

### MQTT Topic Structure

Configure topic patterns for publishing and subscribing:

**Publishing Topics (XPF → Broker):**

| Topic Pattern | Example | Data Source | Description |
|---------------|---------|-------------|-------------|
| **Static Topics** | `plant/reactor1/temperature` | Monitor Point 1 | Fixed topic path |
| **Dynamic Topics** | `{UnitID}/holding/{Address}` | Any Monitor Point | Variable substitution |
| **JSON Topics** | `data/json` | Multiple Points | Structured JSON payload |

**Subscription Topics (Broker → XPF):**

| Topic Pattern | Example | Target | Description |
|---------------|---------|--------|-------------|
| **Control Commands** | `plant/reactor1/setpoint` | Monitor Point Write | Receive control values |
| **Configuration Updates** | `config/+/update` | System Settings | Dynamic configuration |
| **Broadcast Messages** | `alerts/#` | Event Logging | System-wide notifications |

### Configure Topic Mappings

1. **Set Up Publishing**
   - **Topic Template**: Define topic structure with variables
   - **Message Format**: Choose JSON or raw value format
   - **QoS Level**: Select Quality of Service (0, 1, or 2)
   - **Retain Messages**: Enable to store last value for new subscribers

2. **Set Up Subscriptions**
   - **Subscribe Topics**: Define topics to listen for incoming messages
   - **Wildcard Support**: Use `+` (single level) and `#` (multi-level) wildcards
   - **Message Handling**: Configure how received messages update monitor points

3. **Variable Substitution**
   - **{UnitID}**: Replaced with monitor point Unit ID
   - **{Address}**: Replaced with monitor point address
   - **{Name}**: Replaced with monitor point name
   - **{Value}**: Replaced with current monitor point value

!!! tip "Monitor Points Configuration"
    **Need to configure monitor points first?** See the comprehensive [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) section in the main user guide.

### Example Topic Configurations

**Industrial Process Monitoring:**
```yaml
Publishing Topics:
  - "plant/line1/temperature" → Temperature sensor data
  - "plant/line1/pressure" → Pressure measurement
  - "plant/line1/flow" → Flow rate data

Subscription Topics:
  - "plant/line1/setpoints/+" → Receive setpoint changes
  - "commands/emergency/#" → Emergency stop commands
```

**Multi-Device Installation:**
```yaml
Publishing Topics:
  - "devices/{UnitID}/data/{Address}" → Dynamic device data
  - "status/devices" → JSON status summary

Subscription Topics:
  - "config/devices/{UnitID}/+" → Device-specific configuration
  - "commands/broadcast" → System-wide commands
```

## Step 3: Message Mapping

### Monitor Point to MQTT Message Mapping

**XPF automatically maps monitor points to MQTT messages based on your topic configuration:**

| Message Format | Content Example | Use Case |
|----------------|-----------------|----------|
| **Raw Value** | `25.4` | Simple numeric publishing |
| **JSON Object** | `{"value": 25.4, "timestamp": "2025-11-05T14:30:15Z", "unit": "°C"}` | Structured data with metadata |
| **Custom JSON** | `{"temperature": 25.4, "status": "normal"}` | Application-specific format |

### Configure Message Mappings

1. **Select Message Format**
   - **Raw Value**: Publishes monitor point value directly
   - **JSON Standard**: Includes value, timestamp, and metadata
   - **JSON Custom**: User-defined JSON structure

2. **Map Publishing Data**
   - **Individual Topics**: Each monitor point gets its own topic
   - **Batched Topics**: Multiple points in single JSON message
   - **Filtered Publishing**: Only publish when values change

3. **Configure Subscription Handling**
   - **Direct Value Mapping**: Incoming messages directly update monitor point values
   - **JSON Parsing**: Extract values from JSON message structures
   - **Command Processing**: Handle structured command messages

### Verify Message Mapping

1. **Use MQTT Test Tools**
   - **MQTT Explorer**: Connect to broker and monitor message flow
   - **Mosquitto Client**: Command-line tools for testing
   - **Online MQTT Clients**: Web-based testing tools

2. **Monitor XPF Communication Log**
   - View outgoing publish messages
   - See incoming subscription messages
   - Track connection status and errors

## Step 4: Enable MQTT Communication

### Start MQTT Communication

1. **Enable the Add-on**
   - In MQTT Add-on settings, check **Enable MQTT**
   - Click **Connect** to establish broker connection

2. **Monitor Connection Status**
   - Verify **Connected** status indicator is green
   - Check that **Messages Published** counter is incrementing
   - Monitor **Messages Received** for subscriptions

3. **Verify Message Flow**
   - Use MQTT testing tools to confirm published messages
   - Send test messages to subscription topics
   - Verify monitor point values update from received messages

### Verification Checklist

- [ ] **MQTT broker connection** shows as connected
- [ ] **Published messages** appear on configured topics
- [ ] **Subscribed topics** update monitor point values
- [ ] **Message timing** matches configured intervals
- [ ] **No error messages** in XPF communication log

## Advanced Configuration

### Security and Authentication

**TLS/SSL Configuration:**

| Security Level | Configuration | Use Case |
|----------------|---------------|----------|
| **No Encryption** | Port 1883, no certificates | Local testing only |
| **TLS Encryption** | Port 8883, CA certificate | Standard cloud brokers |
| **Mutual TLS** | Client certificates required | High-security environments |
| **Custom CA** | Private certificate authority | Enterprise deployments |

**Authentication Methods:**

- **Username/Password**: Basic authentication for most brokers
- **Client Certificates**: X.509 certificates for device authentication
- **API Keys**: Token-based authentication (AWS IoT, Azure IoT)
- **OAuth 2.0**: Modern authentication for cloud services

### Message Formatting and QoS

**Quality of Service Levels:**

| QoS | Delivery Guarantee | Use Case | Overhead |
|-----|-------------------|----------|----------|
| **QoS 0** | At most once | Non-critical data | Minimal |
| **QoS 1** | At least once | Important data | Low |
| **QoS 2** | Exactly once | Critical commands | High |

**Message Retention:**

- **Retained Messages**: Last value stored by broker for new subscribers
- **Session Persistence**: Maintain subscriptions across disconnections
- **Last Will and Testament**: Automatic status messages on unexpected disconnection

### Broker-Specific Configurations

#### AWS IoT Core
```yaml
Host: your-endpoint.iot.us-east-1.amazonaws.com
Port: 8883
TLS: Required
Authentication: X.509 Client Certificate
Topics: Must follow AWS IoT policies
```

#### Azure IoT Hub
```yaml
Host: your-hub.azure-devices.net
Port: 8883
TLS: Required
Authentication: Device Connection String or Certificate
Topics: devices/{deviceId}/messages/events/
```

#### HiveMQ Cloud
```yaml
Host: your-cluster.hivemq.cloud
Port: 8883
TLS: Required
Authentication: Username/Password
Topics: User-defined structure
```

## Troubleshooting

### Common Issues and Solutions

**Connection Problems:**

| Issue | Cause | Solution |
|-------|-------|----------|
| Connection refused | Wrong host/port | Verify broker hostname and port number |
| Authentication failed | Wrong credentials | Check username/password or certificate |
| TLS handshake failed | Certificate issues | Verify CA certificate and hostname matching |
| Connection timeout | Network/firewall | Check network connectivity and firewall rules |

**Message Flow Issues:**

| Issue | Cause | Solution |
|-------|-------|----------|
| Messages not published | Topic permissions | Check broker ACL and topic permissions |
| Subscription not working | Wildcard errors | Verify topic patterns and wildcard usage |
| JSON parsing errors | Format mismatches | Validate JSON structure against schema |
| QoS delivery issues | Broker configuration | Check broker QoS support and client settings |

### Diagnostic Tools

**XPF MQTT Add-on Diagnostics:**
- MQTT connection status indicator
- Message publish/subscribe counters
- Topic subscription management
- Communication error logging

**External MQTT Tools:**
- **MQTT Explorer**: Visual broker exploration and testing
- **Mosquitto Client**: Command-line publish/subscribe tools
- **MQTT.fx**: Desktop MQTT client for testing
- **Online MQTT Clients**: Web-based testing interfaces

## Best Practices

### Security Recommendations

1. **Use TLS Encryption**: Always enable TLS for production deployments
2. **Certificate Management**: Regularly rotate client certificates
3. **Topic Security**: Implement proper ACL policies on broker
4. **Network Segmentation**: Isolate MQTT traffic on dedicated networks

### Performance Optimization

1. **Topic Design**: Use hierarchical topic structures for efficient routing
2. **Message Size**: Keep messages small for better performance
3. **QoS Selection**: Use appropriate QoS for each use case
4. **Connection Pooling**: Reuse connections for multiple operations

### Monitoring and Maintenance

1. **Connection Health**: Monitor connection status and automatic reconnection
2. **Message Throughput**: Track publish/subscribe rates and errors
3. **Broker Performance**: Monitor broker metrics and resource usage
4. **Security Auditing**: Regular review of certificates and access logs

## Use Cases and Examples

### Industrial IoT Data Collection

**Scenario**: Collect data from multiple Modbus devices and publish to cloud MQTT broker

**Configuration**:
```yaml
Publishing Topics:
  - "factory/line-{UnitID}/temperature" → Temperature sensors
  - "factory/line-{UnitID}/pressure" → Pressure transmitters  
  - "factory/summary/json" → Combined status JSON

Message Format: JSON with timestamp and metadata
QoS: 1 (at least once delivery)
Retain: Enabled for status messages
```

### Remote Control and Monitoring

**Scenario**: Receive setpoint changes from cloud dashboard

**Configuration**:
```yaml
Subscription Topics:
  - "control/setpoints/+" → Individual setpoint changes
  - "commands/emergency" → Emergency shutdown commands

Publishing Topics:
  - "status/ack" → Command acknowledgments
  - "alarms/critical" → Critical alarm notifications
```

### Edge-to-Cloud Integration

**Scenario**: Bridge local Modbus networks to cloud analytics platform

**Configuration**:
```yaml
Local Collection:
  - Poll Modbus devices every 5 seconds
  - Aggregate data locally

Cloud Publishing:  
  - Publish summarized data every 60 seconds
  - Use QoS 1 for reliable delivery
  - Include metadata for cloud processing
```

## Support and Resources

### Official Documentation

- **MQTT Protocol**: [MQTT.org Official Specification](https://mqtt.org/)
- **Broker Documentation**: Refer to your specific broker documentation
- **XPF User Guide**: [Main user guide](../products/xpf/user-guide.md) for core XPF functionality
- **Monitor Points**: [Configuration guide](../products/xpf/user-guide.md#7-monitor-points-configuration) for data source setup

### Community Resources

- **MQTT Community**: Official MQTT forums and discussions
- **Modbus Monitor Community**: User discussions and examples
- **Broker Communities**: AWS IoT, Azure IoT, HiveMQ user groups

---

## Additional Add-ons

This MQTT Add-on is part of a growing ecosystem of XPF add-ons:

- **[ThingSpeak Add-on](thingspeak-addon.md)**: Dedicated ThingSpeak cloud integration
- **SQL Add-on**: Direct database logging and integration *(coming soon)*
- **Email Add-on**: Automated email reporting and alerts *(coming soon)*
- **Custom Add-ons**: Contact us for specialized integration requirements

---

## Navigation

!!! tip "Return to Main Guide"
    **🔙 [← Back to XPF User Guide](../products/xpf/user-guide.md)**
    
    **Related Sections:**
    - [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) - Configure data sources
    - [ThingSpeak Add-on](thingspeak-addon.md) - Dedicated cloud platform integration
    - [Client Operations](../products/xpf/user-guide.md#4-modbus-client-operations) - Core client functionality

**Next Steps:**
- Return to [main user guide](../products/xpf/user-guide.md) for core XPF features
- Explore [Monitor Points configuration](../products/xpf/user-guide.md#7-monitor-points-configuration)
- Check out [ThingSpeak Add-on](thingspeak-addon.md) for cloud-specific features