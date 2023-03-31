
import 'package:coreapp1/Models/space.dart';
import 'package:coreapp1/constants/colors.dart';
import 'package:coreapp1/constants/text_sizes.dart';
import 'package:coreapp1/providers/provider_facilities_page.dart';
import 'package:coreapp1/ui/home/facilities_page/facility_item_booking.dart';
import 'package:coreapp1/ui/person_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacilitiesPage extends StatelessWidget {

  List<Facility> futurefacility = [];

  FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.13),
        child: const PersonHeader(),
      ),
      body: Container(
        color: ColorApp.backGround,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children:  [
              OurOffices(),
              FacilitiesList(),
            ],
          ),
        ),
      ),
    );
  }
}

class OurOffices extends StatelessWidget {
  ListFacilitiesState listFacilitiesState = ListFacilitiesState.loading;
  List<Facility> futurefacility = [];

  OurOffices({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FacilitiesPageState>(context);
    futurefacility = provider.facilities;
    if (provider.facilitiesstates == ListFacilitiesState.initial){
      provider.getFacilitiesDate();
      return  Center(child: Container());

    }else if (provider.facilitiesstates == ListFacilitiesState.failed){

      return  Center(child: Text(provider.errorMessage,style: TextStyle(color: ColorApp.error),),);

    }else{
      return Row(
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
              "${provider.facilities.length} offices",
              style:
              TextStyle(fontSize: smallTextFontSize, color: ColorApp.bigText),
            ),


          ]

      );
    }

  }
}

class FacilitiesList extends StatelessWidget {
  ListFacilitiesState listFacilitiesState = ListFacilitiesState.loading;
  List<Facility> futurefacility = [];
  FacilitiesList( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FacilitiesPageState>(context);
    futurefacility = provider.facilities;

      if (provider.facilitiesstates == ListFacilitiesState.loading){
        provider.getFacilitiesDate();
        return const Center(child: CircularProgressIndicator());

      }else{
        return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: futurefacility.length,
                itemBuilder: (buildContext, int index) {
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FacilityItemBooking(facility: futurefacility[index])));
                      },
                      child: FacilitiesItem(facility: futurefacility[index],));
                });}


  }
}

class FacilitiesItem extends StatelessWidget {
  const FacilitiesItem({
  super.key,
  required this.facility,
  });

  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              color: ColorApp.whiteText,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
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
                    "Capacity:${facility.capacity}",
                    style: TextStyle(
                      color: ColorApp.bigText,
                      fontSize: officeType,
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          color: ColorApp.available,
                          borderRadius: BorderRadius.circular(20)),
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
  }
}


// Stack(
// children: [
// Container(
// color: ColorApp.backGround,
// child: Padding(
// padding: const EdgeInsets.only(left: 20,right: 20,top: 120),
// child: ListView(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Our offices",
// style: TextStyle(
// fontSize: middleTextFontSize,
// fontWeight: FontWeight.bold,
// color: ColorApp.bigText),
// ),
// FutureBuilder<List<Facility>>(
// future: futurefacility,
// builder: (context,snapshot){
// if (snapshot.hasData){
// return Text(
// "${snapshot.data!.length.toString()} Offices",
// style: TextStyle(
// fontSize: smallTextFontSize, color: ColorApp.bigText),
// );
// }else if (snapshot.hasError){
// print("${snapshot.hasError}");
// }
// return const CircularProgressIndicator();
// }
// ),
//
// ],
// ),
// FutureBuilder<List<Facility>>(
// future: futurefacility,
// builder: (context,snapshot){
// if (snapshot.hasData){
// return ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemCount: snapshot.data!.length,
// itemBuilder: (buildContext, int index) {
// Facility facility = snapshot.data![index];
// return Column(
// children: [
//
// Container(
// padding: const EdgeInsets.all(10),
// width: double.infinity,
// height: MediaQuery.of(context).size.height * 0.25,
// decoration: BoxDecoration(
// color: ColorApp.whiteText,
// borderRadius: BorderRadius.circular(15)),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: [
// SizedBox(
// width: double.infinity,
// height: MediaQuery.of(context).size.height *
// 0.15,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(15),
// child: Image.network(
// facility.photos[0],
// fit: BoxFit.cover,
// ),
// )),
//
// Text(
// facility.name,
// style: TextStyle(
// color: ColorApp.bigText,
// fontSize: officeName,
// fontWeight: FontWeight.w800),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//
// Text(
// facility.capacity,
// style: TextStyle(
// color: ColorApp.bigText,
// fontSize: officeType,
// ),
// ),
// Container(
// height: MediaQuery.of(context).size.height*0.03,
// width: MediaQuery.of(context).size.width*0.2,
// decoration: BoxDecoration(
// color: ColorApp.available,
// borderRadius: BorderRadius.circular(20)
// ),
//
// child: const Center(child: Text("Available")))
// ],
// )
// ],
// ),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.015,
// )
// ],
// );
// });
// }else if (snapshot.hasError){
// return Text("${snapshot.hasError}");
// }
// return  CircularProgressIndicator();
// }
// ),
//
// ],
// ),
// ),
// ),
// const Positioned(
// top: 0,
// left: 0,
// right: 0,
// child: PersonHeader()
// ),
//
//
// ],
// )

/*
// Consumer<FacilitiesPageState>(
          //     builder: (context, state, _) {
          //       return
          FutureBuilder(
            future: FacilitiesAPI().getFacilities(),
            builder: (context,snapshot){
              if (snapshot.hasData) {
                return Text(
                // "${state.facilities.length} Offices",
                "${snapshot.data!.length} offices",
                style:
                TextStyle(fontSize: smallTextFontSize, color: ColorApp.bigText),
              );
              }else{
                return Container();
              }
            },

          )
 */