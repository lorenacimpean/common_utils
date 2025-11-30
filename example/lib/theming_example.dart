import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class ThemingExample extends StatelessWidget {
  const ThemingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theming Example')),
      body: ListView(
        padding: const EdgeInsets.all(SoftGrid.spaceL),
        children: [
          const Text(
            'This example demonstrates the theming utilities in the common_utils package.',
            style: TextStyle(
              fontSize: FontSizes.fontSizeM,
              fontWeight: FontSizes.regular,
            ),
          ),
          const AppSpacer.verticalL(),

          // SoftGrid and AppSpacer Example
          Container(
            padding: const EdgeInsets.all(SoftGrid.spaceM),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SoftGrid.radiusM),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SoftGrid and AppSpacer',
                  style: TextStyle(
                    fontSize: FontSizes.fontSizeL,
                    fontWeight: FontSizes.bold,
                  ),
                ),
                const AppSpacer.verticalS(),
                const Text(
                  'This card uses SoftGrid for padding and border radius, and AppSpacer for vertical spacing.',
                  style: TextStyle(
                    fontSize: FontSizes.fontSizeS,
                    height: FontSizes.regularHeight,
                  ),
                ),
                const AppSpacer.verticalM(),
                SizedBox(
                  height: SoftGrid.buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button with SoftGrid height'),
                  ),
                ),
              ],
            ),
          ),
          const AppSpacer.verticalL(),

          // FontSizes Example
          const Text(
            'FontSizes',
            style: TextStyle(
              fontSize: FontSizes.fontSizeL,
              fontWeight: FontSizes.bold,
            ),
          ),
          const AppSpacer.verticalS(),
          const Text(
            'fontSizeS',
            style: TextStyle(fontSize: FontSizes.fontSizeS),
          ),
          const Text(
            'fontSizeM',
            style: TextStyle(fontSize: FontSizes.fontSizeM),
          ),
          const Text(
            'fontSizeL',
            style: TextStyle(fontSize: FontSizes.fontSizeL),
          ),
          const AppSpacer.verticalM(),
          const Text('Bold', style: TextStyle(fontWeight: FontSizes.bold)),
          const Text(
            'Regular',
            style: TextStyle(fontWeight: FontSizes.regular),
          ),
        ],
      ),
    );
  }
}
