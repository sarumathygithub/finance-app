import 'package:flutter/material.dart';

import '../common_widgets/common_container.dart';
import '../common_widgets/common_icon_widget.dart';
import '../common_widgets/common_spacing.dart';
import '../common_widgets/common_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
import '../utils/currency_formatter.dart';
import '../utils/responsive_helper.dart';

/// Gradient header card showing monthly spend and trend.
class SpendSummaryCard extends StatelessWidget {
  const SpendSummaryCard({
    super.key,
    required this.monthlySpend,
    required this.changePercent,
    this.animationValue = 1,
  });

  final double monthlySpend;
  final double changePercent;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    final formattedAmount = CurrencyFormatter.format(monthlySpend);
    final isPositive = changePercent >= 0;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: animationValue),
      duration: AppConstants.entranceDuration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.92 + (0.08 * value),
          child: Opacity(opacity: value.clamp(0.0, 1.0), child: child),
        );
      },
      child: CommonContainer(
        height: ResponsiveHelper.headerCardHeight(context),
        borderRadius: AppConstants.cardBorderRadius,
        gradient: AppColors.headerCardGradient,
        padding: const EdgeInsets.all(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
        child: Stack(
          children: [
            Positioned(
              right: -8,
              top: -8,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.elasticOut,
                builder: (context, rot, _) {
                  return Transform.rotate(
                    angle: rot * 0.1,
                    child: CommonContainer(
                      padding: const EdgeInsets.all(14),
                      borderRadius: 50,
                      color: AppColors.white.withValues(alpha: 0.15),
                      child: const CommonIconWidget(
                        icon: Icons.pie_chart_rounded,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(
                  text: 'Monthly Spend',
                  color: AppColors.white,
                  size: 16,
                  weight: FontWeight.w500,
                ),
                verticalSpace(8),
                CommonText(
                  text: formattedAmount,
                  style: AppTextStyles.headlineLarge,
                ),
                verticalSpace(12),
                Row(
                  children: [
                    CommonContainer(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      borderRadius: 20,
                      color: AppColors.white.withValues(alpha: 0.2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonIconWidget(
                            icon: isPositive
                                ? Icons.trending_up_rounded
                                : Icons.trending_down_rounded,
                            size: 18,
                            color:
                                isPositive ? AppColors.accent : AppColors.error,
                          ),
                          horizontalSpace(6),
                          CommonText(
                            text:
                                '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(1)}% vs last month',
                            color: AppColors.white,
                            size: 13,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
