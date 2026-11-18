import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothPermissionService {
  /// Request necessary Bluetooth and Location permissions for Android & iOS
  Future<bool> requestPermissions() async {
    // Request Bluetooth Scan and Connect permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    // Check if all essential permissions are granted
    bool scanGranted = statuses[Permission.bluetoothScan]?.isGranted ?? false;
    bool connectGranted = statuses[Permission.bluetoothConnect]?.isGranted ?? false;
    bool locationGranted = statuses[Permission.location]?.isGranted ?? false;

    return scanGranted && connectGranted && locationGranted;
  }

  /// Check if Bluetooth adapter is turned on and supported
  Future<bool> isBluetoothReady() async {
    if (await FlutterBluePlus.isSupported == false) {
      return false;
    }
    
    // Check current adapter state
    BluetoothAdapterState state = await FlutterBluePlus.adapterState.first;
    return state == BluetoothAdapterState.on;
  }
}