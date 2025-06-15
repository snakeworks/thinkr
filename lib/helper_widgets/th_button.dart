import 'package:flutter/material.dart';

class ThButton extends StatelessWidget {
  const ThButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.iconData,
  });

  final String text;
  final void Function() onPressed;
  final IconData? iconData;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: isLoading ? (){} : onPressed,
      child:
          isLoading
              ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.5,
                ),
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconData != null) ...[
                    Icon(iconData, size: 20, color: Colors.white),
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
    );
  }
}
