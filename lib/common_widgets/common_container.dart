import 'package:flutter/material.dart';

/// Reusable container with padding, margin, radius, color, and gradient.
class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.gradient,
    this.child,
    this.width,
    this.height,
    this.border,
    this.boxShadow,
    this.alignment,
    this.constraints,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? color;
  final Gradient? gradient;
  final Widget? child;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: gradient == null ? color : null,
      gradient: gradient,
      borderRadius: borderRadius != null
          ? BorderRadius.circular(borderRadius!)
          : null,
      border: border,
      boxShadow: boxShadow,
    );

    Widget content = Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      constraints: constraints,
      decoration: decoration,
      child: child,
    );

    if (margin != null) {
      content = Padding(padding: margin!, child: content);
    }

    return content;
  }
}
