import 'package:bilty/screens/dashboard/dashboard.dart';
import 'package:bilty/utils/widgets/buttons.dart';
import 'package:bilty/utils/widgets/textfields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/applogo.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final nameController = TextEditingController();
  final cnicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            Images.appLogo,
            height: 250,
          ),
          const SizedBox(height: 40),
          RegisterTextFields(controller: nameController, hint: "Enter Name"),
          const SizedBox(height: 10),
          RegisterTextFields(controller: cnicController, hint: "Enter CNIC"),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 75,
        child: MyButton(
          isLoading: false,
          btnText: "Register",
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ontap: () async {
            FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              "name": nameController.text,
              "cnic": cnicController.text,
              "phoneNumber": FirebaseAuth.instance.currentUser!.phoneNumber,
              "id": FirebaseAuth.instance.currentUser!.uid,
            }).whenComplete(() => Get.offAll(() => Dashboard()));
          },
        ),
      ),
    );
  }
}
