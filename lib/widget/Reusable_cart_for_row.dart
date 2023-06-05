import 'package:fashion_e_commerce_app/widget/reusable_text.dart';
import 'package:flutter/material.dart';

class ReusableRowForCart extends StatelessWidget {
  final double price;
  final String text;
  const ReusableRowForCart({super.key, required this.price,required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return  Padding(
        padding: const EdgeInsets.only(top:12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: theme.headline3?.copyWith(fontSize: 16,color: Colors.grey),),
            ReusableTextForDetails(text: price.toString()),
          ],
        ),
      
      
    );
  }
}