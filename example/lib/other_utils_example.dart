import 'package:flutter/material.dart';
import 'package:project_starter_kit/common_utils.dart';

class OtherUtilsExample extends StatelessWidget {
  const OtherUtilsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other Utilities Example')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // BuildContextShortcuts Example
          const Text(
            'BuildContextShortcuts',
            style: TextStyle(
              fontSize: FontSizes.fontSizeL,
              fontWeight: FontSizes.bold,
            ),
          ),
          const AppSpacer.verticalS(),
          Text(
            'Screen Width: ${context.screenWidth}\nScreen Height: ${context.screenHeight}',
            style: context.textTheme.titleMedium,
          ),
          const AppSpacer.verticalM(),

          // PlatformUtils Example
          const Text(
            'PlatformUtils',
            style: TextStyle(
              fontSize: FontSizes.fontSizeL,
              fontWeight: FontSizes.bold,
            ),
          ),
          const AppSpacer.verticalS(),
          Text(
            'You are running on: ${_getPlatform()}',
            style: context.textTheme.titleMedium,
          ),
          const AppSpacer.verticalM(),

          // DebugLogger Example
          const Text(
            'DebugLogger',
            style: TextStyle(
              fontSize: FontSizes.fontSizeL,
              fontWeight: FontSizes.bold,
            ),
          ),
          const AppSpacer.verticalS(),
          ElevatedButton(
            onPressed: _showLogs,
            child: const Text('Show Logs in Console'),
          ),
        ],
      ),
    );
  }

  String _getPlatform() {
    if (PlatformUtils.isIOS) return 'iOS';
    if (PlatformUtils.isAndroid) return 'Android';
    if (PlatformUtils.isWeb) return 'Web';
    if (PlatformUtils.isDesktop) return 'Desktop';
    return 'Unknown Platform';
  }

  void _showLogs() {
    DebugLogger.log('This is an informational message.');
    DebugLogger.logData('User data', {'name': 'John Doe', 'age': 30});
    try {
      throw Exception('This is a test exception.');
    } catch (e, s) {
      DebugLogger.logError('An error occurred', e, s);
    }
  }
}
