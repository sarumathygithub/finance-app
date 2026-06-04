import 'package:flutter/material.dart';

/// Reusable text widget — all project text must use [CommonText].
class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.align,
    this.maxLines,
    this.overflow,
    this.style,
    this.letterSpacing,
    this.height,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final double? letterSpacing;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? Theme.of(context).textTheme.bodyMedium;
    final effectiveStyle = (baseStyle ?? const TextStyle()).copyWith(
      color: color ?? baseStyle?.color,
      fontSize: size ?? baseStyle?.fontSize,
      fontWeight: weight ?? baseStyle?.fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );

    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: effectiveStyle,
    );
  }
}
