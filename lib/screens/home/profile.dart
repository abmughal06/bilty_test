import 'package:bilty/screens/auth/provider/auth_provider.dart';
import 'package:bilty/utils/widgets/applogo.dart';
import 'package:bilty/utils/widgets/buttons.dart';
import 'package:bilty/utils/widgets/text_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Images.appLogo,
                    height: 200,
                  ),
                ),
                Consumer<UserModel?>(
                  builder: (context, user, b) {
                    if (user == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.person),
                            horizontalTitleGap: 0,
                            title: AlignText(
                              text: user.name!,
                              textSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            horizontalTitleGap: 0,
                            title: AlignText(
                              text: user.number!,
                              textSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: const Text("Terms and Conditions"),
                  onTap: () {},
                  trailing: const Icon(Icons.navigate_next),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: const Text("Help Center"),
                  onTap: () {},
                  trailing: const Icon(Icons.navigate_next),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: const Text("FAQ's"),
                  onTap: () {},
                  trailing: const Icon(Icons.navigate_next),
                ),
              ],
            ),
            MyButton(
              isLoading: auth.isLoading,
              btnText: "Sign out",
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 56,
              ontap: () {
                auth.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
