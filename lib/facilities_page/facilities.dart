import 'package:coreapp1/constant/colors.dart';
import 'package:coreapp1/constant/text_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacilitiesPage extends StatefulWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage> {



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorApp.buttons,
                radius: 40,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    "images/profile.jpeg",
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: ColorApp.bigText,
                        fontSize: middleTextFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Fewzy Fawaz",
                    style: TextStyle(
                        color: ColorApp.bigText,
                        fontSize: normalTextFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          color: ColorApp.backGround,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our offices",
                      style: TextStyle(
                          fontSize: middleTextFontSize,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.bigText),
                    ),
                    Text(
                      "16 Office",
                      style: TextStyle(
                          fontSize: smallTextFontSize, color: ColorApp.bigText),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 16,
                    itemBuilder: (BuildContext, int index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                color: ColorApp.whiteText,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "images/meeting.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Text(
                                  "The Training Hall",
                                  style: TextStyle(
                                      color: ColorApp.bigText,
                                      fontSize: officeName,
                                      fontWeight: FontWeight.w800),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      "Office Type",
                                      style: TextStyle(
                                        color: ColorApp.bigText,
                                        fontSize: officeType,
                                      ),
                                    ),
                                    Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.2,
                                        decoration: BoxDecoration(
                                            color: ColorApp.available,
                                            borderRadius: BorderRadius.circular(20)
                                        ),

                                        child: const Center(child: Text("Available")))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
