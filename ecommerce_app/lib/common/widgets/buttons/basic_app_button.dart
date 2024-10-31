import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  BasicAppButton(this.onPressed, this.title, this.height);

  final VoidCallback onPressed;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 50)),
        onPressed: onPressed,
        child: Text(
          title,
        ));
  }
}
