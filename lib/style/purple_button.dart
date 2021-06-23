// This is the stateless widget that the main application instantiates.
import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  void Function() onPressed;
  Widget child;

  PurpleButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.deepPurple.shade300;
    }

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
