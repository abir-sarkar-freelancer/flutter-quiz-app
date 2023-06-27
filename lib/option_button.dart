import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.optionText,
    required this.onTap,
  });
  final String optionText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 40,
          ),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          optionText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
