import 'package:flutter/material.dart';

enum ButtonType { elevated, outlined, text }

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.type,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.disabled = false,
  });

  const Button.elevated({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.disabled = false,
  }) : type = ButtonType.elevated;

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.disabled = false,
  }) : type = ButtonType.outlined;

  const Button.text({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.disabled = false,
  }) : type = ButtonType.text;

  final ButtonType type;
  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;
  final bool disabled;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isLoading = false;

  bool get isLoading => _isLoading || widget.isLoading;
  VoidCallback? get onPressed => isLoading || widget.disabled
      ? null
      : () {
          setState(() => _isLoading = true);
          widget.onPressed();
          setState(() => _isLoading = false);
        };

  Widget get child => isLoading
      ? const SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(),
        )
      : widget.child;

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      ButtonType.elevated => ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      ButtonType.outlined => OutlinedButton(
          onPressed: onPressed,
          child: child,
        ),
      ButtonType.text => TextButton(
          onPressed: onPressed,
          child: child,
        ),
    };
  }
}
