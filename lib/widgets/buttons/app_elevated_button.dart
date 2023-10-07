import 'package:flutter/material.dart';

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.disabled = false,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;
  final bool disabled;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  bool _isLoading = false;
  bool get isLoading => _isLoading || widget.isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading || widget.disabled
          ? null
          : () {
              setState(() => _isLoading = true);
              widget.onPressed();
              setState(() => _isLoading = false);
            },
      child: isLoading
          ? const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(),
            )
          : widget.child,
    );
  }
}
