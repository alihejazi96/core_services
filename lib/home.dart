import 'package:coreapp1/account.dart';
import 'package:coreapp1/constant/colors.dart';
import 'package:coreapp1/facilities_page/facilities.dart';
import 'package:coreapp1/setting.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final List pages = [
    const FacilitiesPage(),
    const AccountPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_currentindex),
      bottomNavigationBar: Container(
        color: ColorApp.backGround,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
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
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 15),
      //   child: Container(
      //     width: MediaQuery.of(context).size.width*0.6,
      //     height: MediaQuery.of(context).size.height*0.08,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: BottomNavigationBar(
      //
      //         type: BottomNavigationBarType.fixed,
      //         selectedFontSize: 0,
      //         unselectedFontSize: 0,
      //         currentIndex: _currentindex,
      //         onTap: (value){
      //           setState(() {
      //             _currentindex = value;
      //           });
      //         },
      //         backgroundColor: ColorApp.bigText,
      //         selectedItemColor: ColorApp.buttons,
      //
      //         items:  [
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home,color: ColorApp.whiteText,),
      //             label: "",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.account_circle,color: ColorApp.whiteText,),
      //             label: "",
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.settings,color: ColorApp.whiteText,),
      //             label: "",
      //           ),
      //         ],
      //
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
