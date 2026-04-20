import '../../../tokens/ds_icons_tokens.dart';
import '../../../extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../icon/ds_icon.dart';
import '../../text/ds_text.dart';
import 'link_button_types.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final LinkButtonStyle style;
  final LinkButtonState state;
  final LinkButtonSize size;
  final bool? underline;
  final void Function()? onTap;
  final DsIconToken? leftIcon;
  final DsIconToken? rightIcon;
  const LinkButton({
    super.key,
    required this.text,
    required this.style,
    required this.state,
    required this.size,
    this.underline,
    this.onTap,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    textColor() {
      if (state == LinkButtonState.disabled) {
        return context.colors.textDisabled;
      }
      switch (style) {
        case LinkButtonStyle.gray:
          if (state == LinkButtonState.focus) {
            return context.colors.textStrong950;
          }
          return context.colors.textSub600;
        case LinkButtonStyle.black:
          return context.colors.textStrong950;
        case LinkButtonStyle.primary:
          return context.colors.themeBlueBase;
        case LinkButtonStyle.error:
          return context.colors.errorBase;
        case LinkButtonStyle.modifiable:
          return context.colors.staticWhite;
      }
    }

    double textSize() {
      switch (size) {
        case LinkButtonSize.small:
          return 16;
        case LinkButtonSize.medium:
          return 20;
      }
    }

    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 4,
        children: [
          if (leftIcon != null)
            DsIcon(icon: leftIcon!, color: textColor(), size: textSize()),
          DsText(
            text: text,
            color: textColor(),
            fontSize: textSize(),
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.5,
            underline: underline,
          ),
          if (rightIcon != null)
            DsIcon(icon: rightIcon!, color: textColor(), size: textSize()),
        ],
      ),
    );
  }
}
