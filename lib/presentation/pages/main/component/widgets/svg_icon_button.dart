import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    super.key,
    this.padding = 4,
    required this.icon,
    required this.color,
    this.size = 24,
    required this.onPressed,
  });

  final double padding;
  final String icon;
  final Color color;
  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
