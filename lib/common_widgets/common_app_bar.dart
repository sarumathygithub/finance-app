import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
import 'common_spacing.dart';
import 'common_text.dart';

/// Custom app bar with greeting and profile avatar.
class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    this.opacity = 1,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: AppConstants.entranceDuration,
      curve: Curves.easeOut,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenHorizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CommonText(
                text: AppConstants.userGreeting,
                style: AppTextStyles.titleMedium,
              ),
            ),
            horizontalSpace(12),
            _ProfileAvatar(),
          ],
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.avatarRadius * 2,
      height: AppConstants.avatarRadius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: CommonText(
          text: 'S',
          color: AppColors.white,
          size: 18,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}
