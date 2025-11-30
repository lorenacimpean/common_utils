import 'package:project_starter_kit/src/utils/debug_logger.dart';

void main() {
  DebugLogger.log('test');
  DebugLogger.logData('data', 1);
  DebugLogger.logError('error', ArgumentError("test invalid "));
  Test().test();
}

class Test {
  void test() {
    DebugLogger.log('test');
    DebugLogger.logData('test', 1);
    DebugLogger.logError('test', ArgumentError("test invalid "));
  }
}
