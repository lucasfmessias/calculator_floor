import 'package:calculator_floor/core/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const PrimaryButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: kButtonFontSize,
        ),
      ),
      // Deixando o estilo do botão arredondado
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(kButtonWidth, kButtonHeight),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
