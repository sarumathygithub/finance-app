import 'package:flutter/material.dart';

import '../common_widgets/common_app_bar.dart';
import '../common_widgets/common_spacing.dart';
import '../data/mock_data.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/responsive_helper.dart';
import '../widgets/category_card.dart';
import '../widgets/gradient_fab.dart';
import '../widgets/section_header.dart';
import '../widgets/spend_summary_card.dart';
import '../widgets/transaction_tile.dart';

/// Main Spend Summary screen — fintech dashboard with animations.
class SpendSummaryScreen extends StatefulWidget {
  const SpendSummaryScreen({super.key});

  @override
  State<SpendSummaryScreen> createState() => _SpendSummaryScreenState();
}

class _SpendSummaryScreenState extends State<SpendSummaryScreen> {
  double _appBarOpacity = 0;
  double _headerAnim = 0;
  double _categoriesAnim = 0;
  double _transactionsAnim = 0;

  @override
  void initState() {
    super.initState();
    _runEntranceAnimations();
  }

  void _runEntranceAnimations() {
    Future.microtask(() {
      if (!mounted) return;
      setState(() => _appBarOpacity = 1);
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      setState(() => _headerAnim = 1);
    });
    Future.delayed(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      setState(() => _categoriesAnim = 1);
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() => _transactionsAnim = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = MockData.categories;
    final transactions = MockData.recentTransactions;
    final horizontalPadding = ResponsiveHelper.horizontalPadding(context);
    final bottomPadding = ResponsiveHelper.scrollBottomPadding(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: GradientFab(
        heroTag: 'spend_summary_fab',
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: verticalSpace(16)),
            SliverToBoxAdapter(
              child: CommonAppBar(opacity: _appBarOpacity),
            ),
            SliverToBoxAdapter(child: verticalSpace(24)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SpendSummaryCard(
                  monthlySpend: MockData.monthlySpend,
                  changePercent: MockData.spendChangePercent,
                  animationValue: _headerAnim,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(AppConstants.sectionSpacing),
            ),
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: _categoriesAnim,
                duration: AppConstants.entranceDuration,
                curve: Curves.easeOut,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: const SectionHeader(title: 'Categories'),
                ),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(16)),
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: _categoriesAnim,
                duration: AppConstants.entranceDuration,
                child: SizedBox(
                  height: AppConstants.categoryCardHeight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) =>
                        horizontalSpace(AppConstants.categoryCardSpacing),
                    itemBuilder: (context, index) {
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: _categoriesAnim),
                        duration: Duration(
                          milliseconds: 400 + (index * 60),
                        ),
                        curve: Curves.easeOutBack,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: child,
                            ),
                          );
                        },
                        child: CategoryCard(
                          category: categories[index],
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(AppConstants.sectionSpacing),
            ),
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: _transactionsAnim,
                duration: AppConstants.entranceDuration,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: const SectionHeader(title: 'Recent Transactions'),
                ),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(16)),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                0,
                horizontalPadding,
                bottomPadding,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return AnimatedOpacity(
                      opacity: _transactionsAnim,
                      duration: Duration(
                        milliseconds: 300 + (index * 50),
                      ),
                      curve: Curves.easeOut,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: _transactionsAnim),
                        duration: Duration(
                          milliseconds: 350 + (index * 40),
                        ),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 12 * (1 - value)),
                            child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: child,
                            ),
                          );
                        },
                        child: TransactionTile(
                          transaction: transactions[index],
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                  childCount: transactions.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
