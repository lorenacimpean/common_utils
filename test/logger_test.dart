import 'package:common_utils/src/utils/debug_logger.dart';

void main() {
  DebugLogger.log('test');
  DebugLogger.logData('data', 1);
  DebugLogger.logError(
    'error',
    ArgumentError("fgfhjkljhsdfgsahjfghjsad,fbasdkjfbahs"),
  );
  Testt().testt();
}

class Testt{
  void testt(){
    DebugLogger.log('test');
    DebugLogger.logData('test', 1);
    DebugLogger.logError(
      'test',
      ArgumentError("fgfhjkljhsdfgsahjfghjsad,fbasdkjfbahs"),
    );
  }
}