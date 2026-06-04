import 'package:flutter/material.dart';

import '../common_widgets/common_container.dart';
import '../common_widgets/common_icon_widget.dart';
import '../common_widgets/common_spacing.dart';
import '../common_widgets/common_text.dart';
import '../models/category_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
import '../utils/currency_formatter.dart';

/// Glassmorphism category card with scale animation on tap.
class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  final CategoryModel category;
  final VoidCallback? onTap;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  double _scale = 1;

  void _onTapDown(TapDownDetails _) => setState(() => _scale = 0.92);
  void _onTapUp(TapUpDetails _) => setState(() => _scale = 1);
  void _onTapCancel() => setState(() => _scale = 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: SizedBox(
          width: AppConstants.categoryCardWidth,
          height: AppConstants.categoryCardHeight,
          child: CommonContainer(
            borderRadius: AppConstants.categoryCardRadius,
            padding: const EdgeInsets.all(12),
            color: AppColors.glassFill,
            border: Border.all(color: AppColors.glassBorder, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonIconWidget(
                  icon: widget.category.icon,
                  size: 22,
                  color: widget.category.iconColor,
                  backgroundColor:
                      widget.category.iconColor.withValues(alpha: 0.2),
                  padding: const EdgeInsets.all(8),
                  borderRadius: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: widget.category.name,
                      style: AppTextStyles.bodyLarge,
                      size: 13,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    CommonText(
                      text: CurrencyFormatter.format(widget.category.amount),
                      style: AppTextStyles.titleMedium,
                      size: 15,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
