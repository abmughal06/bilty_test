import 'package:bilty/screens/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/buttons.dart';
import '../../utils/widgets/screen_sizes.dart';
import '../../utils/widgets/sizedbox_widgets.dart';
import '../../utils/widgets/text_size.dart';
import '../../utils/widgets/textfields.dart';

class OTPView extends StatelessWidget {
  OTPView({super.key, this.verificationId});

  final otpController = TextEditingController();
  final String? verificationId;

  @override
  Widget build(BuildContext context) {
    final phoneAuth = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: SizedBox()),

          verticalSpace(40),
          const AlignText(
            text: 'OTP',
            align: Alignment.center,
            textColor: Colors.black,
            fontWeight: FontWeight.w700,
            textSize: 24,
          ),
          verticalSpace(16),
          const AlignText(
            text:
                "Check your mobile phone, Fill out the code you have recieved",
            padding: EdgeInsets.symmetric(horizontal: 60),
            textAlign: TextAlign.center,
            textColor: Colors.grey,
            fontWeight: FontWeight.w400,
            textSize: 16,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: verticalSpace(60),
          ),
          //otp fields here
          OtpFields(
            controller: otpController,
            length: 6,
            height: 48,
            width: Sizes.screenWidth(context) * .1,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: verticalSpace(23),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AlignText(
                text: "Didn't get the code?",
                textColor: Colors.grey,
                fontWeight: FontWeight.w500,
                textSize: 14,
              ),
              TextButton(
                onPressed: () {},
                child: const AlignText(
                  text: 'Send Again',
                  textColor: Colors.red,
                  fontWeight: FontWeight.w500,
                  textSize: 14,
                ),
              )
            ],
          ),
          const Expanded(flex: 2, child: SizedBox()),
          phoneAuth.isLoading
              ? const CircularProgressIndicator()
              : MyButton(
                  btnText: "Verify",
                  ontap: () {
                    // print(otpController.text);
                    phoneAuth.verifyOTP(
                        context: context,
                        code: otpController.text.toString(),
                        verifyId: verificationId);
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
