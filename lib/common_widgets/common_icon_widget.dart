import 'package:flutter/material.dart';

/// Reusable icon widget with optional background and tap handling.
class CommonIconWidget extends StatelessWidget {
  const CommonIconWidget({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.onTap,
  });

  final IconData icon;
  final double size;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget iconChild = Icon(icon, size: size, color: color);

    if (backgroundColor != null || padding != null) {
      iconChild = Container(
        padding: padding ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
        ),
        child: iconChild,
      );
    }

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          child: iconChild,
        ),
      );
    }

    return iconChild;
  }
}
