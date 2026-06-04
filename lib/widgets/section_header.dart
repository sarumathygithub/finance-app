import 'package:flutter/material.dart';

import '../common_widgets/common_text.dart';
import '../utils/app_text_styles.dart';

/// Section title row for Categories and Recent Transactions.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          style: AppTextStyles.titleLarge,
        ),
        ?trailing,
      ],
    );
  }
}
