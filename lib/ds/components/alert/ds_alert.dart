import '../button/link_button/link_button.dart';
import '../../tokens/ds_icons_tokens.dart';
import '../../extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../icon/ds_icon.dart';
import '../text/ds_text.dart';
import 'ds_alert_types.dart';

class DsAlert extends StatelessWidget {
  final DsAlertStatus status;
  final DsAlertStyle style;
  final DsAlertSize size;
  final String text;
  final String? description;
  final List<LinkButton>? linkButtons;
  final bool dismissIcon;

  const DsAlert({
    super.key,
    required this.status,
    required this.style,
    required this.size,
    required this.text,
    this.description,
    this.linkButtons,
    required this.dismissIcon,
  });

  @override
  Widget build(BuildContext context) {
    double sizePading() {
      switch (size) {
        case DsAlertSize.xSmall:
          return 8;
        case DsAlertSize.small:
          return 10;
        case DsAlertSize.large:
          return 14;
      }
    }

    double sizeSpacing() {
      switch (size) {
        case DsAlertSize.xSmall:
          return 8;
        case DsAlertSize.small:
          return 8;
        case DsAlertSize.large:
          return 12;
      }
    }

    double fontSize() {
      switch (size) {
        case DsAlertSize.xSmall:
          return 12;
        case DsAlertSize.small:
          return 14;
        case DsAlertSize.large:
          return 14;
      }
    }

    selectIcon() {
      switch (status) {
        case DsAlertStatus.error:
          return DsIconToken.errorWarningFill;
        case DsAlertStatus.warning:
          return DsIconToken.alertFill;
        case DsAlertStatus.information:
          return DsIconToken.informationFill;
        case DsAlertStatus.success:
          return DsIconToken.selectBoxCircleFill;
        case DsAlertStatus.feature:
          return DsIconToken.magicFill;
      }
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sizePading()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: sizeSpacing(),
            children: [
              DsIcon(
                icon: selectIcon(),
                color: context.colors.staticWhite,
                size: 20,
              ),
              Column(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DsText(
                    text: text,
                    color: context.colors.staticWhite,
                    fontSize: fontSize(),
                    fontWeight: FontWeight.w400,
                  ),
                  if (description != null)
                    DsText(
                      text: description!,
                      color: context.colors.staticWhite,
                      fontSize: fontSize(),
                      fontWeight: FontWeight.w400,
                    ),
                  const SizedBox(height: 6),
                  if (linkButtons != null)
                    ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: linkButtons!.length,
                      itemBuilder: (context, index) => linkButtons![index],
                      separatorBuilder: (_, _) => DsText(
                        text: "∙",
                        color: context.colors.staticWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (dismissIcon)
            InkWell(
              onTap: () => Navigator.pop(context),
              child: DsIcon(
                icon: DsIconToken.closeLine,
                color: context.colors.staticWhite,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
