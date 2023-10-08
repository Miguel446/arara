import 'package:flutter/material.dart';

import '../buttons/button.dart';

class AppDialog {
  const AppDialog.choice({
    required this.context,
    this.title,
    this.text,
    required this.rightButtonText,
    required this.onRightButtonPressed,
    this.rightButtonType = ButtonType.elevated,
    required String this.leftButtonText,
    required VoidCallback this.onLeftButtonPressed,
    this.leftButtonType = ButtonType.outlined,
  });

  final BuildContext context;
  final String? title;
  final String? text;
  final String rightButtonText;
  final VoidCallback onRightButtonPressed;
  final ButtonType rightButtonType;
  final String? leftButtonText;
  final VoidCallback? onLeftButtonPressed;
  final ButtonType leftButtonType;

  void show() {
    showDialog(
      context: context,
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(title!, style: textTheme.headlineMedium),
                  ),
                if (text != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(text!, style: textTheme.bodyMedium),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (leftButtonText != null) ...[
                        Expanded(
                          child: Button(
                            type: leftButtonType,
                            onPressed: onLeftButtonPressed!,
                            child: Text(leftButtonText!),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Expanded(
                        child: Button(
                          type: rightButtonType,
                          onPressed: onRightButtonPressed,
                          child: Text(rightButtonText),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
