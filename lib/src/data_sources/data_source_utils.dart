import 'dart:math';

/// Utility functions for data sources
class DataSourceUtils {
  static final _random = Random();
  
  /// Simulates network latency with a delay between 300-500ms
  static Future<void> simulateNetworkDelay() async {
    final delayMs = 300 + _random.nextInt(201); // 300 to 500ms
    await Future.delayed(Duration(milliseconds: delayMs));
  }
  
  /// Generates a unique ID using timestamp and random value
  static String generateId({String prefix = ''}) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomValue = _random.nextInt(10000);
    final id = '$timestamp$randomValue';
    return prefix.isEmpty ? id : '$prefix-$id';
  }
}
