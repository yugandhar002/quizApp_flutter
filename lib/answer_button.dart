import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(this.optionText, this.onTap, {super.key});
  final String optionText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          backgroundColor: Color.fromARGB(255, 33, 96, 139),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        optionText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
