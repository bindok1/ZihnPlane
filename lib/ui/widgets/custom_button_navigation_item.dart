import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class customButton extends StatelessWidget {
  final String title;
  final double witdh;
  final Function() onPressed;
  final EdgeInsets margin;

  const customButton(
      {Key? key,
      required this.title,
      this.witdh = double.infinity,
      this.margin = EdgeInsets.zero,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: witdh,
      height: 55,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          )),
    );
  }
}
