import 'package:bilty/utils/widgets/screen_sizes.dart';
import 'package:bilty/utils/widgets/sizedbox_widgets.dart';
import 'package:bilty/utils/widgets/text_size.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, this.title, this.message, this.btnText});

  final String? title;
  final String? message;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        width: Sizes.screenWidth(context) * .8,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ),
            verticalSpace(5),
            AlignText(
              text: title,
              align: Alignment.center,
              textSize: 18,
              textAlign: TextAlign.center,
              textColor: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            verticalSpace(14),
            AlignText(
              text: message,
              align: Alignment.center,
              textAlign: TextAlign.center,
              textSize: 14,
              textColor: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            verticalSpace(30),
            MyButton(
              btnText: btnText,
              ontap: () => Navigator.pop(context),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 28),
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
