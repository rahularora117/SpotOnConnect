class BluetoothService {
  BluetoothService._();

  static final BluetoothService instance = BluetoothService._();

  bool _isScanning = false;

  bool get isScanning => _isScanning;

  Future<void> startScan() async {
    _isScanning = true;
  }

  Future<void> stopScan() async {
    _isScanning = false;
  }

  Future<List<Map<String, dynamic>>> getNearbyDevices() async {
    return [];
  }
}