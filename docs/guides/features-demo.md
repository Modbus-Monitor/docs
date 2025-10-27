# 📚 Complete Documentation Features Demo

!!! info "Feature Demo Page"
    This page demonstrates all available documentation features for complex technical documentation.

[TOC]

## 🎨 Visual Elements

### Admonitions (Info Boxes)

!!! note "Information"
    General information and notes

!!! tip "Pro Tip"
    Helpful tips and best practices

!!! warning "Important"
    Warnings and cautions

!!! danger "Critical"
    Critical warnings

!!! example "Example"
    Code examples and demonstrations

!!! question "FAQ"
    Frequently asked questions

??? abstract "Collapsible Section"
    This content is collapsible - click to expand/collapse
    
    - Hidden content here
    - Multiple lines supported
    - Great for advanced topics

## 📋 Tabbed Content

=== "Windows Setup"

    **Installation on Windows:**
    
    1. Download installer
    2. Run as Administrator
    3. Follow wizard steps
    
    ```batch
    # Windows batch command
    installer.exe /silent /dir="C:\Program Files\App"
    ```

=== "Linux Setup"

    **Installation on Linux:**
    
    1. Add repository
    2. Update package list
    3. Install via package manager
    
    ```bash
    # Linux commands
    sudo apt update
    sudo apt install application
    ```

=== "macOS Setup"

    **Installation on macOS:**
    
    1. Download .dmg file
    2. Mount disk image
    3. Drag to Applications
    
    ```bash
    # macOS commands
    brew install application
    ```

## 📊 Diagrams and Charts

### System Architecture

```mermaid
graph TB
    subgraph "User Layer"
        A[User Interface]
        B[Documentation]
    end
    
    subgraph "Application Layer"
        C[Modbus Monitor XPF]
        D[Configuration Manager]
    end
    
    subgraph "Network Layer"
        E[Modbus TCP/IP]
        F[Serial Communication]
    end
    
    subgraph "Device Layer"
        G[PLC Controllers]
        H[Field Devices]
        I[Sensors]
    end
    
    A --> C
    B --> C
    C --> D
    C --> E
    C --> F
    E --> G
    F --> G
    G --> H
    G --> I
    
    style A fill:#e1f5fe
    style C fill:#fff3e0
    style G fill:#f3e5f5
```

### Process Flow

```mermaid
sequenceDiagram
    participant User
    participant XPF as Modbus Monitor XPF
    participant PLC as PLC Device
    participant DB as Database
    
    User->>XPF: Configure Connection
    XPF->>PLC: Connect via Modbus
    PLC-->>XPF: Connection Established
    
    loop Data Monitoring
        XPF->>PLC: Read Registers
        PLC-->>XPF: Return Data
        XPF->>DB: Log Data
        XPF->>User: Display Values
    end
    
    User->>XPF: Export Report
    XPF->>DB: Query Historical Data
    DB-->>XPF: Return Dataset
    XPF-->>User: Generated Report
```

### Network Topology

```mermaid
graph LR
    subgraph "Control Room"
        PC[Engineer PC<br/>Modbus Monitor XPF]
        HMI[HMI Panel]
    end
    
    subgraph "Network Infrastructure"
        SW1[Ethernet Switch]
        SW2[Field Switch]
    end
    
    subgraph "Field Devices"
        PLC1[PLC Controller 1<br/>192.168.1.10]
        PLC2[PLC Controller 2<br/>192.168.1.11]
        VFD[Variable Frequency Drive<br/>192.168.1.20]
        METER[Power Meter<br/>192.168.1.30]
    end
    
    PC --- SW1
    HMI --- SW1
    SW1 --- SW2
    SW2 --- PLC1
    SW2 --- PLC2
    SW2 --- VFD
    SW2 --- METER
    
    style PC fill:#4a90e2,color:#fff
    style PLC1 fill:#ff9800,color:#fff
    style PLC2 fill:#ff9800,color:#fff
```

## 📝 Code Examples

### Syntax Highlighting

```python title="modbus_client.py" linenums="1"
import pymodbus
from pymodbus.client.sync import ModbusTcpClient

# Connect to Modbus device
client = ModbusTcpClient('192.168.1.10', port=502)

# Read holding registers
def read_sensors():
    """Read temperature and pressure sensors."""
    try:
        # Read registers 40001-40010 (1)
        result = client.read_holding_registers(0, 10, unit=1)
        
        if result.isError():
            print(f"Error: {result}")
            return None
            
        # Extract values
        temperature = result.registers[0] / 10.0  # (2)
        pressure = result.registers[1] / 100.0
        
        return {
            'temperature': temperature,
            'pressure': pressure,
            'timestamp': datetime.now()
        }
        
    except Exception as e:
        print(f"Connection error: {e}")
        return None

# Main monitoring loop
if __name__ == "__main__":
    while True:
        data = read_sensors()
        if data:
            print(f"Temperature: {data['temperature']}°C")
            print(f"Pressure: {data['pressure']} bar")
        time.sleep(1)
```

1. Register addresses are 0-based in pymodbus
2. Apply scaling factor for sensor readings

### Configuration Examples

```yaml title="config.yml"
# Modbus Monitor XPF Configuration
connection:
  type: tcp
  host: 192.168.1.10
  port: 502
  timeout: 3000
  
registers:
  - address: 40001
    name: "Temperature Sensor"
    type: float
    scaling: 0.1
    unit: "°C"
    
  - address: 40002  
    name: "Pressure Sensor"
    type: float
    scaling: 0.01
    unit: "bar"

logging:
  enabled: true
  interval: 1000  # milliseconds
  format: csv
  destination: "data/logs/"
```

## 📊 Tables and Data

### Register Mapping

| Address | Name | Type | Range | Unit | Description |
|---------|------|------|-------|------|-------------|
| 40001 | TEMP_01 | Float | 0-1000 | °C | Reactor temperature |
| 40002 | PRESS_01 | Float | 0-100 | bar | System pressure |
| 40003 | FLOW_01 | Integer | 0-500 | L/min | Flow rate |
| 40004 | LEVEL_01 | Float | 0-100 | % | Tank level |

### Communication Parameters

| Parameter | Standard Value | Range | Notes |
|-----------|----------------|-------|--------|
| Baud Rate | 19200 | 1200-115200 | For serial communication |
| Data Bits | 8 | 7-8 | Standard is 8 |
| Stop Bits | 1 | 1-2 | Typically 1 |
| Parity | None | None/Even/Odd | Most devices use None |
| Timeout | 3000ms | 100-10000ms | Adjust for network latency |

## ⌨️ Keyboard Shortcuts

Use these keyboard shortcuts for efficient operation:

- ++ctrl+n++ : New connection
- ++ctrl+o++ : Open configuration
- ++ctrl+s++ : Save current settings
- ++f5++ : Refresh data
- ++ctrl+shift+e++ : Export data
- ++alt+f4++ : Exit application

## 🧮 Mathematical Expressions

For complex calculations, you can use mathematical notation:

The Modbus register scaling formula is:

$$
\text{Scaled Value} = \frac{\text{Raw Value} \times \text{Scale Factor}}{10^{\text{Decimal Places}}}
$$

For temperature conversion:
$$
\text{Temperature}_{°F} = \text{Temperature}_{°C} \times 1.8 + 32
$$

Inline math: The power calculation $P = V \times I \times \cos(\phi)$ where $\phi$ is the phase angle.

## 📝 Task Lists and Checklists

### Pre-Installation Checklist

- [x] Verify system requirements
- [x] Download latest version
- [x] Backup existing configuration
- [ ] Stop existing Modbus services
- [ ] Install new version
- [ ] Test connections
- [ ] Restore configuration
- [ ] Validate functionality

### Troubleshooting Steps

1. **Connection Issues**
   - [ ] Check network connectivity
   - [ ] Verify IP address and port
   - [ ] Test with ping command
   - [ ] Check firewall settings

2. **Data Quality Issues**  
   - [ ] Validate register addresses
   - [ ] Check data scaling factors
   - [ ] Verify device configuration
   - [ ] Test with known good values

## 🔗 Cross-References and Links

- See [Installation Guide](installation-guide.md) for setup instructions
- Refer to [Configuration](xpf-users-guide.md#configuration) section
- Check [Troubleshooting](#troubleshooting-steps) above
- External link: [Modbus Specification](https://modbus.org/docs/Modbus_Application_Protocol_V1_1b3.pdf)

## 📸 Screenshots and Images

!!! example "Adding Screenshots"
    To add screenshots to your documentation:
    
    1. Take screenshot of the application
    2. Save as PNG in `docs/images/` folder  
    3. Reference with: `![Description](images/screenshot.png){: .screenshot}`
    4. The `.screenshot` class applies custom styling

**Placeholder for screenshots:**

![XPF Main Interface](https://via.placeholder.com/800x500/4a90e2/ffffff?text=Modbus+Monitor+XPF+Main+Interface){: .screenshot}

*Figure 1: Main application interface showing connection status and data monitoring*

## 📚 Content Inclusion

You can include content from other files:

```markdown
<!-- Include shared configuration -->
--8<-- "includes/common-config.md"

<!-- Include code snippets -->
--8<-- "code-examples/basic-connection.py"
```

## 🎯 Summary

This documentation system now supports:

- ✅ **Rich formatting**: Admonitions, tabs, collapsible sections
- ✅ **Interactive diagrams**: Mermaid flowcharts, sequences, network diagrams  
- ✅ **Advanced code blocks**: Syntax highlighting, line numbers, annotations
- ✅ **Mathematical expressions**: LaTeX-style math rendering
- ✅ **Professional tables**: Sortable, styled data tables
- ✅ **Cross-references**: Internal and external linking
- ✅ **Task management**: Checklists and progress tracking
- ✅ **Media support**: Screenshots, images with custom styling
- ✅ **Keyboard shortcuts**: Formatted key combinations
- ✅ **Content inclusion**: Reusable snippets and code files

Your documentation system is now enterprise-ready for complex technical documentation!