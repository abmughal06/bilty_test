import 'package:bilty/utils/widgets/sizedbox_widgets.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../utils/widgets/applogo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Images.appLogo,
          height: 55,
          fit: BoxFit.fill,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: truckData.length,
        itemBuilder: (context, index) {
          var truck = truckData[index];

          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  Images.appLogo,
                  height: 40,
                ),
                title: Text(truck.driverName),
                subtitle: Text(truck.companyName),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(truck.truckNumber),
                    verticalSpace(5),
                    const Icon(Icons.navigate_next),
                  ],
                ),
                onTap: () {},
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
