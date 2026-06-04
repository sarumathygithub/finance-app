import 'package:flutter/material.dart';

import '../common_widgets/common_container.dart';
import '../common_widgets/common_icon_widget.dart';
import '../common_widgets/common_spacing.dart';
import '../common_widgets/common_text.dart';
import '../models/transaction_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
import '../utils/currency_formatter.dart';
import '../utils/date_formatter.dart';

/// Card-style transaction row with ripple effect.
class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    this.onTap,
  });

  final TransactionModel transaction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormatter.formatTransactionDate(transaction.date);
    final amountStr = CurrencyFormatter.formatExpense(transaction.amount);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(AppConstants.transactionTileRadius),
        splashColor: AppColors.primary.withValues(alpha: 0.15),
        highlightColor: AppColors.primary.withValues(alpha: 0.08),
        child: CommonContainer(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          borderRadius: AppConstants.transactionTileRadius,
          color: AppColors.card,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonIconWidget(
                icon: transaction.icon,
                size: 22,
                color: transaction.iconColor,
                backgroundColor:
                    transaction.iconColor.withValues(alpha: 0.15),
                padding: const EdgeInsets.all(10),
                borderRadius: 12,
              ),
              horizontalSpace(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: transaction.name,
                      style: AppTextStyles.bodyLarge,
                      size: 15,
                      weight: FontWeight.w600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    CommonText(
                      text: dateStr,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              horizontalSpace(8),
              CommonText(
                text: amountStr,
                color: AppColors.error,
                size: 15,
                weight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
