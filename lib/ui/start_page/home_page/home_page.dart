
import 'package:coreapp1/Models/space.dart';
import 'package:coreapp1/constants/colors.dart';
import 'package:coreapp1/constants/text_sizes.dart';
import 'package:coreapp1/services/facilities_api.dart';
import 'package:coreapp1/ui/person_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/facilities_api.dart';
import '../../../services/facilities_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Facility>> futurefacility;
  @override
  void initState() {
    super.initState();
    futurefacility = getFacilities();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorApp.backGround,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 120),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our offices",
                      style: TextStyle(
                          fontSize: middleTextFontSize,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.bigText),
                    ),
                    FutureBuilder<List<Facility>>(
                        future: futurefacility,
                        builder: (context,snapshot){
                          if (snapshot.hasData){
                            return Text(
                              "${snapshot.data!.length.toString()} Offices",
                              style: TextStyle(
                                  fontSize: smallTextFontSize, color: ColorApp.bigText),
                            );
                          }else if (snapshot.hasError){
                            print("${snapshot.hasError}");
                          }
                          return const CircularProgressIndicator();
                        }
                    ),

                  ],
                ),
                FutureBuilder<List<Facility>>(
                    future: futurefacility,
                    builder: (context,snapshot){
                      if (snapshot.hasData){
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (buildContext, int index) {
                              Facility facility = snapshot.data![index];
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
                                              child: Image.network(
                                                facility.photos[0],
                                                fit: BoxFit.cover,
                                              ),
                                            )),

                                        Text(
                                          facility.name,
                                          style: TextStyle(
                                              color: ColorApp.bigText,
                                              fontSize: officeName,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Text(
                                              facility.capacity,
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
                            });
                      }else if (snapshot.hasError){
                        return Text("${snapshot.hasError}");
                      }
                      return  CircularProgressIndicator();
                    }
                ),

              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
            left: 0,
            right: 0,
            child: PersonHeader()
        ),


      ],
    );
  }
}

// FutureBuilder(
//     future: futurefacility,
//     builder: (context,snapshot){
//       if (snapshot.hasData){
//         return Text(snapshot.data!.name);
//       }else if(snapshot.hasError){
//         return Text("${snapshot.data}");
//       }
//       return const CircularProgressIndicator();
//     }
// )