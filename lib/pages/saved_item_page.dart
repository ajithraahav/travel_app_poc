import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/app_text.dart';

class SavedItemPage extends StatelessWidget {
  const SavedItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: AppText(text: 'Saved Items Page')),
    );
  }
}