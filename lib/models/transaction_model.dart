import 'package:flutter/material.dart';

/// Represents a single expense transaction.
class TransactionModel {
  const TransactionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });

  final String id;
  final String name;
  final DateTime date;
  final double amount;
  final IconData icon;
  final Color iconColor;
}
