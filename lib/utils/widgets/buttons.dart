import 'package:bilty/utils/widgets/text_size.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? btnText;
  final EdgeInsets? padding;
  final double? height;
  final VoidCallback? ontap;
  final bool isLoading;
  const MyButton(
      {super.key,
      this.btnText,
      this.padding,
      this.height,
      this.ontap,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: Size(double.infinity, height ?? 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : AlignText(
                align: Alignment.center,
                text: "$btnText",
                textSize: 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w700,
              ),
      ),
    );
  }
}
