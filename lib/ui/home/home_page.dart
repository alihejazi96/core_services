
import 'package:coreapp1/constants/colors.dart';
import 'package:coreapp1/ui/account_page/account_page.dart';
import 'package:coreapp1/ui/home/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import 'facilities_page/facilities_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldBackGroundColor,
      body: SafeArea(

        child: Stack(
          children: [
            IndexedStack(
              index: _currentindex,
              children:  [
                FacilitiesPage(),
                AccountPage(),
                SettingPage()
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top*11.71,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildNavBar(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

    buildNavBar(BuildContext context) {
    return Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: ColorApp.bigText,
                    borderRadius: BorderRadius.circular(35)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _currentindex = 0;
                          });
                        },
                        icon: Icon(
                          Icons.home,
                          color: ColorApp.whiteText,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _currentindex = 1;
                          });
                        },
                        icon: Icon(
                          Icons.person,
                          color: ColorApp.whiteText,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _currentindex = 2;
                          });
                        },
                        icon: Icon(
                          Icons.settings,
                          color: ColorApp.whiteText,
                        )),
                  ],
                ),
              );
  }
}
