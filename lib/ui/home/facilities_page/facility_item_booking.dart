import 'package:coreapp1/Models/space.dart';
import 'package:coreapp1/constants/colors.dart';
import 'package:flutter/material.dart';

class FacilityItemBooking extends StatefulWidget {
  final Facility facility;
  const FacilityItemBooking({Key? key, required this.facility}) : super(key: key);

  @override
  _FacilityItemBookingState createState() => _FacilityItemBookingState();
}

class _FacilityItemBookingState extends State<FacilityItemBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.bigText,
        title: Text("Facility Booking",),
      ),
      body: Center(child: Column(
        children: [
          Text(widget.facility.name),
          ElevatedButton(
            style: ButtonStyle(    backgroundColor: MaterialStateProperty.all<Color>(ColorApp.bigText),
            ),
              onPressed: (){}, child: Text("book"),)
        ],
      )),
    );
  }
}
