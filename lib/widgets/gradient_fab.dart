import 'package:flutter/material.dart';

import '../common_widgets/common_container.dart';
import '../common_widgets/common_icon_widget.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

/// Gradient FAB with plus icon and hero animation support.
class GradientFab extends StatelessWidget {
  const GradientFab({
    super.key,
    required this.heroTag,
    required this.onPressed,
  });

  final Object heroTag;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: CommonContainer(
            width: AppConstants.fabSize,
            height: AppConstants.fabSize,
            borderRadius: AppConstants.fabSize / 2,
            gradient: AppColors.fabGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.45),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
            child: const Center(
              child: CommonIconWidget(
                icon: Icons.add_rounded,
                size: 32,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
