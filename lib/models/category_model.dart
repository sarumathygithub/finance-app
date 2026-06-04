import 'package:flutter/material.dart';

/// Represents a spending category with icon and amount.
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });

  final String id;
  final String name;
  final double amount;
  final IconData icon;
  final Color iconColor;
}
