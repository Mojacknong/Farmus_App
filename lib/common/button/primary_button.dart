import 'package:farmus/common/base/base_button.dart';
import 'package:flutter/material.dart';

import '../base/bouncing.dart';

class PrimaryButton extends StatelessWidget implements BaseButton {
  @override
  final double? width;
  @override
  final double? height;
  @override
  final String text;
  @override
  final VoidCallback? onPressed;
  @override
  final bool enabled;
  @override
  final Color textColor;
  @override
  final Color backgroundColor;
  @override
  final Color borderColor;
  @override
  final double? borderRadius;

  const PrimaryButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.onPressed,
    required this.enabled,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
      textAlign: TextAlign.center,
    );

    return SizedBox(
      width: width,
      height: height,
      child: enabled
          ? Bouncing(
              onPress: onPressed,
              child: TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(backgroundColor),
                  side: MaterialStateProperty.resolveWith(
                    (states) {
                      return BorderSide(
                        color: borderColor,
                        width: 1.0,
                      );
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: borderRadius == null
                          ? BorderRadius.circular(8.0)
                          : BorderRadius.circular(borderRadius!),
                    ),
                  ),
                ),
                child: buttonChild,
              ),
            )
          : TextButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                side: MaterialStateProperty.resolveWith(
                  (states) {
                    return BorderSide(
                      color: borderColor,
                      width: 1.0,
                    );
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius == null
                        ? BorderRadius.circular(8.0)
                        : BorderRadius.circular(borderRadius!),
                  ),
                ),
              ),
              child: buttonChild,
            ),
    );
  }
}