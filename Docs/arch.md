# Architecture 

## Screens
Home
Services
- App Development
- Embedded Systems
- IoT/IIoT
- PWA Development
- Schematic & PCB Design
- Project Management
Projects
- Proofing Ovens
- Embedded Linux
- IoT
- RFID
- Apps
- Other
About
Privacy

## Use Flutter Responsive and Adaptive Best Practices
https://github.com/flutter/website/tree/main/sites/docs/src/content/ui/adaptive-responsive


```
  DeviceType _getDeviceType(double width) {
    if (width >= 1024) return DeviceType.desktop;
    if (width >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }
```

## Navigation
Material Design tabs and/or a drawer
Use routes if this is the best way to handle PWA navigation

## State Management
Provider https://pub.dev/packages/provider
https://github.com/rrousselGit/provider



