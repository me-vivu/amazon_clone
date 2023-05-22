import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtons(text: 'Your Orders', onTap: (){}),
            AccountButtons(text: 'Turn Seller', onTap: (){}),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButtons(text: 'Log out', onTap: (){}),
            AccountButtons(text: 'Your Wish List', onTap: (){}),
            
          ],
        )
      ],
    );
  }
}
