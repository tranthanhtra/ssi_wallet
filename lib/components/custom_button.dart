import 'package:flutter/material.dart';
// import 'package:webtoonz_mobile/utils/constants/color_resources.dart';

/// Customize button for app
///
/// [text] button text
/// [textColor] button text color
/// [onClick] button onClick event
/// [backgroundColor] button background color
/// [borderColor] button border color
class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.backgroundColor = Colors.green,
      this.borderColor = Colors.green,
      this.textColor = Colors.white,
      this.textStyle = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      this.icon})
      : super(key: key);

  final String text;
  final GestureTapCallback onClick;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final TextStyle textStyle;
  final Image? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(
                color: borderColor,
                width: 1,
              )),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: icon ?? Text(
                  text,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
