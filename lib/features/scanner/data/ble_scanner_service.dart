import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScannerService {
  /// Stream of discovered scan results from the native OS
  Stream<List<ScanResult>> get scanResultsStream => FlutterBluePlus.scanResults;

  /// Check if a scan is currently active
  bool get isScanning => FlutterBluePlus.isScanningNow;

  /// Start scanning for BLE devices
  Future<void> startScan() async {
    if (FlutterBluePlus.isScanningNow) return;

    // Start scanning with a 15-second timeout (or set to null for continuous scan)
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 15),
    );
  }

  /// Stop scanning
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }
}