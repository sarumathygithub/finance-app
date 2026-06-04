import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/transaction_model.dart';
import '../utils/app_colors.dart';

/// Mock spend summary data — kept separate from UI widgets.
class MockData {
  MockData._();

  static const double monthlySpend = 24500;
  static const double spendChangePercent = 12.4;
  static const int recentTransactionCount = 7;

  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'food',
      name: 'Food',
      amount: 8400,
      icon: Icons.restaurant_rounded,
      iconColor: Color(0xFFFF6B6B),
    ),
    CategoryModel(
      id: 'travel',
      name: 'Travel',
      amount: 5200,
      icon: Icons.flight_rounded,
      iconColor: Color(0xFF4ECDC4),
    ),
    CategoryModel(
      id: 'shopping',
      name: 'Shopping',
      amount: 6100,
      icon: Icons.shopping_bag_rounded,
      iconColor: Color(0xFFFFE66D),
    ),
    CategoryModel(
      id: 'bills',
      name: 'Bills',
      amount: 3800,
      icon: Icons.receipt_long_rounded,
      iconColor: Color(0xFF95E1D3),
    ),
    CategoryModel(
      id: 'entertainment',
      name: 'Entertainment',
      amount: 2100,
      icon: Icons.movie_rounded,
      iconColor: Color(0xFFDDA0DD),
    ),
    CategoryModel(
      id: 'health',
      name: 'Health',
      amount: 1900,
      icon: Icons.favorite_rounded,
      iconColor: Color(0xFFFF8A80),
    ),
  ];

  static final List<TransactionModel> recentTransactions = [
    TransactionModel(
      id: 't1',
      name: 'Swiggy',
      date: DateTime(2026, 6, 4),
      amount: 450,
      icon: Icons.delivery_dining_rounded,
      iconColor: AppColors.accent,
    ),
    TransactionModel(
      id: 't2',
      name: 'Uber',
      date: DateTime(2026, 6, 3),
      amount: 320,
      icon: Icons.local_taxi_rounded,
      iconColor: AppColors.white,
    ),
    TransactionModel(
      id: 't3',
      name: 'Amazon',
      date: DateTime(2026, 6, 2),
      amount: 2899,
      icon: Icons.shopping_cart_rounded,
      iconColor: AppColors.secondary,
    ),
    TransactionModel(
      id: 't4',
      name: 'Netflix',
      date: DateTime(2026, 6, 1),
      amount: 649,
      icon: Icons.play_circle_fill_rounded,
      iconColor: AppColors.error,
    ),
    TransactionModel(
      id: 't5',
      name: 'Zomato',
      date: DateTime(2026, 5, 31),
      amount: 580,
      icon: Icons.fastfood_rounded,
      iconColor: AppColors.primary,
    ),
    TransactionModel(
      id: 't6',
      name: 'Electricity Bill',
      date: DateTime(2026, 5, 30),
      amount: 1850,
      icon: Icons.bolt_rounded,
      iconColor: Color(0xFFFFD54F),
    ),
    TransactionModel(
      id: 't7',
      name: 'Apollo Pharmacy',
      date: DateTime(2026, 5, 29),
      amount: 720,
      icon: Icons.medical_services_rounded,
      iconColor: Color(0xFF81C784),
    ),
  ];
}
