// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneNumberTextField extends StatelessWidget {
  var controller = TextEditingController();
  final RegExp phoneRegex = RegExp(r'^\+\d{3} \d{4} \d{3}$');

  final maskFormatter = MaskTextInputFormatter(
      mask: '+## ### #######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final String? hint;

  PhoneNumberTextField({Key? key, required this.controller, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        height: 52,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.only(left: 16),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && value[0] != '+') {
              controller.text = '+$value';
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            }
          },
          inputFormatters: [maskFormatter],
        ),
      ),
    );
  }
}

//otp fields and pin fields

class OtpFields extends StatelessWidget {
  TextEditingController controller;
  final errorController = StreamController<ErrorAnimationType>();
  final int? length;
  final double? height;
  final double? width;
  OtpFields({
    super.key,
    this.length,
    this.height,
    this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: PinCodeTextField(
        appContext: context,
        textStyle: const TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
        length: length!,
        cursorHeight: 18,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        onChanged: (v) {},
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: height,
          fieldWidth: width,
          fieldOuterPadding: const EdgeInsets.all(5),
          activeFillColor: Colors.white,
          activeColor: Colors.white,
          disabledColor: Colors.white,
          errorBorderColor: Colors.red,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: Colors.red,
          inactiveColor: Colors.grey,
          borderWidth: 1,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: controller,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
      ),
    );
  }
}

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields(
      {super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        height: 52,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.only(left: 16),
          ),
        ),
      ),
    );
  }
}
