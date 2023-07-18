import 'package:bilty/screens/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/applogo.dart';
import '../../utils/widgets/buttons.dart';
import '../../utils/widgets/sizedbox_widgets.dart';
import '../../utils/widgets/text_size.dart';
import '../../utils/widgets/textfields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneService = Provider.of<AuthenticationProvider>(context);
    final phoneController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(20),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              Images.appLogo,
              height: 250,
            ),
          ),
          verticalSpace(10),
          const AlignText(
            text:
                'Welcome to the bilty, a transport app to make your life easier than it ever was.',
            padding: EdgeInsets.symmetric(horizontal: 56),
            textAlign: TextAlign.center,
            textSize: 16,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
          ),
          verticalSpace(40),
          const AlignText(
            padding: EdgeInsets.only(left: 33),
            text: 'Enter your Number',
            textSize: 16,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
          ),
          verticalSpace(12),
          PhoneNumberTextField(
            controller: phoneController,
            hint: "+92 300 0000000",
          ),
          verticalSpace(200),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 75,
        child: MyButton(
          isLoading: phoneService.isLoading,
          btnText: "Next",
          ontap: () {
            phoneService.loginWithPhone(
                phoneController.text.replaceAll(" ", ""), context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        ),
      ),
    );
  }
}
