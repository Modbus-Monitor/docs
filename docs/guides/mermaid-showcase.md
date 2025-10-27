# 📊 Mermaid Diagrams Showcase

!!! info "Complete Mermaid Reference"
    This page showcases all types of Mermaid diagrams you can use in your documentation.  
    Copy any example and customize for your needs!

[TOC]

## 🔄 Flowcharts & Process Diagrams

### Basic Flowchart

```mermaid
graph TD
    A[Start Process] --> B[Initialize System]
    B --> C{Check Configuration}
    C -->|Valid| D[Connect to Device]
    C -->|Invalid| E[Show Error]
    D --> F[Start Monitoring]
    E --> G[Fix Configuration]
    G --> C
    F --> H[Log Data]
    H --> I{Continue?}
    I -->|Yes| H
    I -->|No| J[Stop Process]
    
    style A fill:#4caf50,color:#fff
    style D fill:#2196f3,color:#fff
    style E fill:#f44336,color:#fff
    style F fill:#ff9800,color:#fff
```

### Complex System Architecture

```mermaid
graph TB
    subgraph "User Interface Layer"
        UI[Web Dashboard]
        API[REST API]
        WS[WebSocket Server]
    end
    
    subgraph "Application Layer"
        APP[Modbus Monitor XPF]
        CONFIG[Configuration Manager]
        LOGGER[Data Logger]
        ALERT[Alert System]
    end
    
    subgraph "Communication Layer"
        TCP[Modbus TCP/IP]
        RTU[Modbus RTU]
        ASCII[Modbus ASCII]
    end
    
    subgraph "Device Layer"
        PLC1[PLC Controller 1]
        PLC2[PLC Controller 2]
        VFD[Variable Frequency Drive]
        METER[Power Meter]
        SENSORS[Temperature Sensors]
    end
    
    subgraph "Data Storage"
        DB[(Database)]
        FILES[Log Files]
        BACKUP[(Backup Storage)]
    end
    
    UI --> API
    API --> APP
    WS --> APP
    APP --> CONFIG
    APP --> LOGGER
    APP --> ALERT
    APP --> TCP
    APP --> RTU
    APP --> ASCII
    
    TCP --> PLC1
    TCP --> PLC2
    TCP --> VFD
    RTU --> METER
    RTU --> SENSORS
    
    LOGGER --> DB
    LOGGER --> FILES
    DB --> BACKUP
    
    style UI fill:#e3f2fd
    style APP fill:#fff3e0
    style DB fill:#f3e5f5
    style PLC1 fill:#e8f5e8
    style PLC2 fill:#e8f5e8
```

### Network Topology Diagram

```mermaid
graph LR
    subgraph "Control Room"
        PC[Engineer Workstation<br/>192.168.1.100]
        HMI[HMI Terminal<br/>192.168.1.101]
        SERVER[Data Server<br/>192.168.1.102]
    end
    
    subgraph "Network Infrastructure"
        CORE[Core Switch<br/>Cisco 2960]
        FIELD[Field Switch<br/>Industrial Ethernet]
        WIRELESS[Wireless AP<br/>802.11n]
    end
    
    subgraph "Field Devices - Zone 1"
        PLC_A[Allen-Bradley PLC<br/>192.168.1.10<br/>Modbus TCP]
        DRIVE_A[ABB Drive<br/>192.168.1.11<br/>Modbus TCP]
        METER_A[Power Meter<br/>192.168.1.12<br/>Modbus RTU]
    end
    
    subgraph "Field Devices - Zone 2"
        PLC_B[Schneider PLC<br/>192.168.1.20<br/>Modbus TCP]
        TEMP[Temperature Controller<br/>192.168.1.21<br/>Modbus RTU]
        FLOW[Flow Meter<br/>192.168.1.22<br/>Modbus RTU]
    end
    
    PC ---|Gigabit Ethernet| CORE
    HMI ---|Gigabit Ethernet| CORE
    SERVER ---|Gigabit Ethernet| CORE
    
    CORE ---|Fiber Optic| FIELD
    CORE --- WIRELESS
    
    FIELD ---|CAT5e| PLC_A
    FIELD ---|CAT5e| DRIVE_A
    FIELD ---|RS485| METER_A
    
    FIELD ---|CAT5e| PLC_B
    FIELD ---|RS485| TEMP
    FIELD ---|RS485| FLOW
    
    style PC fill:#4285f4,color:#fff
    style SERVER fill:#34a853,color:#fff
    style PLC_A fill:#ff9800,color:#fff
    style PLC_B fill:#ff9800,color:#fff
```

## 📋 Sequence Diagrams

### Modbus Communication Flow

```mermaid
sequenceDiagram
    participant Client as Modbus Monitor XPF
    participant Master as Modbus Master
    participant Slave as PLC Device
    participant Sensor as Field Sensor
    
    Note over Client,Sensor: Initialization Phase
    
    Client->>Master: Configure Connection
    Master->>Slave: Establish TCP Connection
    Slave-->>Master: Connection ACK
    Master-->>Client: Connection Established
    
    Note over Client,Sensor: Data Reading Cycle
    
    loop Every 1 second
        Client->>Master: Read Holding Registers (40001-40010)
        Master->>Slave: Modbus Request (FC03)
        Slave->>Sensor: Get Current Values
        Sensor-->>Slave: Return Sensor Data
        Slave-->>Master: Modbus Response + Data
        Master-->>Client: Parsed Register Values
        
        Client->>Client: Log Data to Database
        Client->>Client: Update Dashboard
        
        alt Error Condition
            Slave-->>Master: Exception Response
            Master-->>Client: Communication Error
            Client->>Client: Trigger Alert
            Client->>Client: Retry Logic
        end
    end
    
    Note over Client,Sensor: Shutdown Phase
    
    Client->>Master: Disconnect Request
    Master->>Slave: Close TCP Connection
    Slave-->>Master: Connection Closed
    Master-->>Client: Disconnected
```

### User Workflow Process

```mermaid
sequenceDiagram
    participant User
    participant UI as Web Interface
    participant Backend as XPF Backend
    participant Device as Modbus Device
    participant DB as Database
    
    User->>UI: Login to System
    UI->>Backend: Authenticate User
    Backend-->>UI: Login Success
    UI-->>User: Show Dashboard
    
    User->>UI: Create New Connection
    UI->>Backend: Submit Connection Config
    Backend->>Device: Test Connection
    
    alt Connection Successful
        Device-->>Backend: Connection OK
        Backend->>DB: Save Configuration
        Backend-->>UI: Configuration Saved
        UI-->>User: Connection Active
        
        loop Data Monitoring
            Backend->>Device: Read Registers
            Device-->>Backend: Return Values
            Backend->>DB: Store Data
            Backend->>UI: Push Live Data
            UI->>User: Update Charts
        end
        
    else Connection Failed
        Device-->>Backend: Connection Timeout
        Backend-->>UI: Connection Error
        UI-->>User: Show Error Message
        User->>UI: Modify Configuration
        UI->>Backend: Retry Connection
    end
    
    User->>UI: Export Historical Data
    UI->>Backend: Request Export
    Backend->>DB: Query Data Range
    DB-->>Backend: Return Dataset
    Backend->>Backend: Generate Report
    Backend-->>UI: Download Link
    UI-->>User: File Download
```

## 📊 Charts & Graphs

### State Diagram

```mermaid
stateDiagram-v2
    [*] --> Disconnected
    
    Disconnected --> Connecting : Connect()
    Connecting --> Connected : Success
    Connecting --> Error : Timeout/Failure
    Connected --> Monitoring : Start Monitoring
    
    Monitoring --> Reading : Read Registers
    Reading --> Processing : Data Received
    Processing --> Monitoring : Continue
    Processing --> Error : Communication Error
    
    Error --> Reconnecting : Auto Retry
    Reconnecting --> Connected : Success
    Reconnecting --> Disconnected : Max Retries Exceeded
    
    Connected --> Disconnected : User Disconnect
    Monitoring --> Disconnected : User Stop
    Error --> Disconnected : User Cancel
    
    state Monitoring {
        [*] --> Idle
        Idle --> ReadHolding : Timer Tick
        ReadHolding --> ReadInput : Success
        ReadInput --> ReadCoils : Success
        ReadCoils --> Idle : Complete Cycle
        ReadHolding --> ErrorState : Failure
        ReadInput --> ErrorState : Failure
        ReadCoils --> ErrorState : Failure
        ErrorState --> Idle : Retry
    }
```

### Class Diagram (System Architecture)

```mermaid
classDiagram
    class ModbusMonitor {
        +String deviceIP
        +int port
        +int timeout
        +ConnectionStatus status
        +connect()
        +disconnect()
        +readRegisters()
        +writeRegisters()
    }
    
    class ConnectionManager {
        +List~Connection~ connections
        +addConnection()
        +removeConnection()
        +getActiveConnections()
    }
    
    class DataLogger {
        +String logPath
        +LogFormat format
        +bool enabled
        +logData()
        +exportData()
        +clearLogs()
    }
    
    class RegisterMap {
        +int address
        +DataType type
        +String name
        +float scaleFactor
        +String unit
        +validate()
        +convert()
    }
    
    class AlertSystem {
        +List~AlertRule~ rules
        +addRule()
        +removeRule()
        +checkAlerts()
        +sendNotification()
    }
    
    class WebInterface {
        +startServer()
        +handleRequest()
        +pushUpdate()
    }
    
    ModbusMonitor "1" --> "1..*" RegisterMap
    ConnectionManager "1" --> "0..*" ModbusMonitor
    ModbusMonitor "1" --> "1" DataLogger
    ModbusMonitor "1" --> "1" AlertSystem
    WebInterface "1" --> "1" ConnectionManager
    
    <<interface>> IModbusClient
    ModbusMonitor ..|> IModbusClient
    
    <<enumeration>> ConnectionStatus
    ConnectionStatus : DISCONNECTED
    ConnectionStatus : CONNECTING
    ConnectionStatus : CONNECTED
    ConnectionStatus : ERROR
    
    <<enumeration>> DataType
    DataType : INT16
    DataType : INT32
    DataType : FLOAT32
    DataType : BOOL
```

### Entity Relationship Diagram

```mermaid
erDiagram
    DEVICE ||--o{ CONNECTION : has
    CONNECTION ||--o{ REGISTER_MAP : contains
    CONNECTION ||--o{ DATA_LOG : generates
    DEVICE ||--o{ ALERT_RULE : monitors
    
    DEVICE {
        int device_id PK
        string name
        string ip_address
        int port
        string protocol
        datetime created_at
        datetime updated_at
        bool active
    }
    
    CONNECTION {
        int connection_id PK
        int device_id FK
        string name
        int timeout_ms
        int poll_interval
        datetime last_connected
        string status
    }
    
    REGISTER_MAP {
        int register_id PK
        int connection_id FK
        int address
        string name
        string data_type
        float scale_factor
        string unit
        string description
    }
    
    DATA_LOG {
        int log_id PK
        int connection_id FK
        int register_id FK
        datetime timestamp
        float raw_value
        float scaled_value
        string quality
    }
    
    ALERT_RULE {
        int rule_id PK
        int device_id FK
        string name
        string condition
        float threshold
        string severity
        bool enabled
    }
    
    USER {
        int user_id PK
        string username
        string email
        string role
        datetime last_login
    }
    
    USER ||--o{ DEVICE : owns
    USER ||--o{ ALERT_RULE : creates
```

## 📈 Timeline & Gantt Charts

### Project Timeline

```mermaid
gantt
    title Modbus Monitor XPF Development Timeline
    dateFormat  YYYY-MM-DD
    section Planning Phase
    Requirements Analysis    :done, req, 2024-01-01, 2024-01-15
    System Design          :done, design, 2024-01-10, 2024-01-25
    Architecture Review    :done, review, 2024-01-20, 2024-01-30
    
    section Development Phase
    Core Engine            :done, core, 2024-02-01, 2024-03-15
    Modbus Communication   :done, modbus, 2024-02-15, 2024-03-30
    User Interface         :active, ui, 2024-03-01, 2024-04-15
    Data Logging           :logging, 2024-03-15, 2024-04-30
    Alert System           :alerts, 2024-04-01, 2024-05-15
    
    section Testing Phase
    Unit Testing           :testing, 2024-04-15, 2024-05-30
    Integration Testing    :integration, 2024-05-01, 2024-06-15
    System Testing         :system, 2024-05-15, 2024-06-30
    User Acceptance        :uat, 2024-06-01, 2024-07-15
    
    section Deployment
    Production Setup       :deploy, 2024-07-01, 2024-07-30
    Documentation          :docs, 2024-07-15, 2024-08-15
    Training               :training, 2024-08-01, 2024-08-30
    Go Live                :milestone, golive, 2024-09-01, 0d
```

### Feature Implementation Roadmap

```mermaid
gantt
    title Feature Implementation Roadmap
    dateFormat YYYY-MM-DD
    
    section Core Features
    Basic Modbus TCP       :done, tcp, 2024-01-01, 2024-02-15
    Register Reading       :done, read, 2024-01-15, 2024-02-28
    Data Visualization     :done, viz, 2024-02-01, 2024-03-15
    Historical Logging     :done, log, 2024-02-15, 2024-03-30
    
    section Advanced Features  
    Modbus RTU Support     :active, rtu, 2024-03-01, 2024-04-15
    Alert & Notifications  :alert, 2024-03-15, 2024-04-30
    Report Generation      :report, 2024-04-01, 2024-05-15
    REST API               :api, 2024-04-15, 2024-05-30
    
    section Enterprise Features
    Multi-Device Support   :multi, 2024-05-01, 2024-06-15
    User Management        :users, 2024-05-15, 2024-06-30
    Database Integration   :db, 2024-06-01, 2024-07-15
    Redundancy & Failover  :ha, 2024-06-15, 2024-07-30
    
    section Future Enhancements
    Machine Learning       :ml, 2024-08-01, 2024-09-30
    Cloud Integration      :cloud, 2024-08-15, 2024-10-15
    Mobile App             :mobile, 2024-09-01, 2024-11-15
    IoT Gateway           :iot, 2024-09-15, 2024-12-01
```

## 🔀 Git Flow & Workflow

### Development Workflow

```mermaid
gitgraph
    commit id: "Initial Setup"
    branch develop
    checkout develop
    commit id: "Core Framework"
    
    branch feature/modbus-tcp
    checkout feature/modbus-tcp
    commit id: "TCP Implementation"
    commit id: "Connection Pool"
    commit id: "Error Handling"
    
    checkout develop
    merge feature/modbus-tcp
    commit id: "Integrate TCP Support"
    
    branch feature/ui-dashboard
    checkout feature/ui-dashboard
    commit id: "Dashboard Layout"
    commit id: "Real-time Charts"
    
    branch feature/data-logging
    checkout feature/data-logging
    commit id: "Logger Framework"
    commit id: "Database Schema"
    
    checkout develop
    merge feature/ui-dashboard
    merge feature/data-logging
    commit id: "Feature Integration"
    
    checkout main
    merge develop
    commit id: "v1.0 Release" tag: "v1.0.0"
    
    checkout develop
    branch feature/alerts
    checkout feature/alerts
    commit id: "Alert Rules Engine"
    commit id: "Notification System"
    
    checkout develop
    merge feature/alerts
    
    checkout main
    merge develop
    commit id: "v1.1 Release" tag: "v1.1.0"
```

## 🗺️ Mind Maps & Hierarchies

### System Components Mind Map

```mermaid
mindmap
  root((Modbus Monitor XPF))
    Communication
      Modbus TCP/IP
        Standard Port 502
        Custom Ports
        SSL/TLS Support
      Modbus RTU
        RS485/RS232
        Baud Rate Config
        Parity Settings
      Modbus ASCII
        Serial Communication
        Error Checking
    
    Data Management
      Real-time Data
        Live Updates
        Buffering
        Filtering
      Historical Data
        Database Storage
        Time Series
        Compression
      Export Functions
        CSV Format
        Excel Reports
        PDF Documents
        JSON API
    
    User Interface
      Web Dashboard
        Responsive Design
        Real-time Charts
        Configuration Panel
      Desktop App
        Native Performance
        Offline Mode
        Advanced Features
      Mobile App
        Remote Monitoring
        Push Notifications
        Quick Actions
    
    Integration
      APIs
        REST Endpoints
        WebSocket Streams
        Authentication
      Third-party Systems
        SCADA Integration
        ERP Systems
        Cloud Platforms
      Protocols
        OPC UA
        MQTT
        HTTP/HTTPS
```

## 🔄 Pie Charts & Quadrant Charts

### System Resource Usage

```mermaid
pie title System Resource Distribution
    "Communication Engine" : 35
    "Data Processing" : 25
    "User Interface" : 20
    "Logging System" : 12
    "Configuration" : 5
    "Other Services" : 3
```

### Feature Priority Matrix

```mermaid
quadrantChart
    title Feature Priority Matrix
    x-axis Low Effort --> High Effort
    y-axis Low Impact --> High Impact
    
    quadrant-1 Quick Wins
    quadrant-2 Major Projects  
    quadrant-3 Fill-ins
    quadrant-4 Avoid
    
    Real-time Alerts: [0.8, 0.9]
    Mobile App: [0.9, 0.8]
    Report Generator: [0.6, 0.7]
    User Management: [0.7, 0.6]
    Cloud Integration: [0.9, 0.9]
    Theme Customization: [0.2, 0.3]
    Advanced Charting: [0.5, 0.8]
    API Documentation: [0.3, 0.6]
    Performance Optimization: [0.7, 0.9]
    Multi-language Support: [0.8, 0.4]
```

## 📋 Use These Templates!

### Quick Copy Templates

**Basic Flowchart Template:**
```markdown
```mermaid
graph TD
    A[Start] --> B[Step 1]
    B --> C{Decision?}
    C -->|Yes| D[Action 1]
    C -->|No| E[Action 2]
    D --> F[End]
    E --> F
```
```

**Sequence Diagram Template:**
```markdown
```mermaid
sequenceDiagram
    participant A as System A
    participant B as System B
    
    A->>B: Request
    B-->>A: Response
    
    loop Process
        A->>B: Data
        B-->>A: Acknowledgment
    end
```
```

**Network Diagram Template:**
```markdown
```mermaid
graph LR
    subgraph "Location A"
        A1[Device 1]
        A2[Device 2]
    end
    
    subgraph "Location B"  
        B1[Device 3]
        B2[Device 4]
    end
    
    A1 --- SW[Switch]
    A2 --- SW
    SW --- B1
    SW --- B2
```
```

!!! tip "Mermaid Tips"
    - **Styling**: Add `style NodeID fill:#color` for custom colors
    - **Subgraphs**: Group related components together
    - **Links**: Use `-->`, `---`, `-.-`, `==>` for different arrow types
    - **Classes**: Define reusable styles with `classDef className fill:#color`
    - **Themes**: Available themes: default, dark, forest, neutral

Your Mermaid showcase is now complete with all major diagram types! 🎉