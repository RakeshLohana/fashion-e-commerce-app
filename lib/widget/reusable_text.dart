import 'package:fashion_e_commerce_app/Utils/constants.dart';
import 'package:flutter/material.dart';


class ReusableTextForDetails extends StatelessWidget {
   ReusableTextForDetails({
    super.key,
    required this.text,
   
  });

  final  String text;

  @override
  Widget build(BuildContext context) {
     var theme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
          text: "\u{20AC} ",
          style: theme.titleSmall?.copyWith(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
                text: text,
                style: theme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ))
          ]),
    );
  }
}
