import 'package:coreapp1/ui/start_page/home_page/home_page.dart';
import 'package:coreapp1/ui/start_page/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'account_page/account_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentindex = 0;
  final List pages = [
    const HomePage(),
    const AccountPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldBackGroundColor,
      body: SafeArea(

        child: Stack(
          children: [
            IndexedStack(
              index: _currentindex,
              children: const [
                HomePage(),
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
