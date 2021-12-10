import 'package:hauglid_design_system/src/shared/app_colors.dart';
import 'package:hauglid_design_system/src/shared/styles.dart';
import 'package:flutter/material.dart';

class AButton extends StatelessWidget {
  const AButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
  })  : outline = false,
        super(key: key);

  const AButton.outline({
    required this.title,
    this.onTap,
    this.leading,
    Key? key,
  })  : disabled = false,
        busy = false,
        outline = true,
        super(key: key);

  final void Function()? onTap;
  final bool busy;
  final bool disabled;
  final Widget? leading;
  final bool outline;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? kcPrimaryColor : kcMediumGreyColor,
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kcPrimaryColor,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 5),
                  ],
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline ? Colors.white : kcPrimaryColor,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }
}
