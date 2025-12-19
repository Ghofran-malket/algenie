import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final GestureTapCallback function;
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  const TextButtonWidget({super.key, required this.function, required this.text, this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF252B37),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return Color(0xFFAB2929).withAlpha(100);
          }
          return null;
        }),
      ),
      child: Text(
        text,
        style: textStyle == null ?Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Color(0xFFAB2929),
          shadows: [
            Shadow(
              color: const Color(0xFF252B37).withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 10
            ),
          ],
        ) : textStyle!.copyWith(
          color: color ?? Color(0xFFAB2929),
          shadows: [
            Shadow(
              color: const Color(0xFF252B37).withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 10
            ),
          ],
        )
      ),
    );
  }
}
