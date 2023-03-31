import 'dart:convert';
import 'package:coreapp1/Models/space.dart';
import 'package:coreapp1/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class FacilitiesAPI {
  bookFacility(userID, startTime, endTime, facilityID) async {
    var body = jsonEncode(<String, dynamic>{
      "user_id": userID,
      "start_time": startTime, //"2023-04-01T14:30:00",
      "end_time": endTime,
    });
    String url =
        "${APIConstants.BASE_API_URL}/facilities/${facilityID.toString()}/reservations";
    var response = await http.post(Uri.parse(url),
        headers: <String,String>{
        "Content-Type": "application/json"
        },
        body: body);

    if (response.statusCode == 201) {
      return ("Reservation created successfully");
    } else {
      return ("Reservation Failed");
    }
  }

  Future<List<Facility>> getFacilities() async {
    String url = "${APIConstants.BASE_API_URL}/facilities";
    List<Facility> facilities = [];

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        var responseJson = jsonDecode(response.body);

        for (var item in responseJson["data"]) {
          Facility facility = Facility.fromJson(item);
          facilities.add(facility);
        }
      } catch (e) {
        throw Exception("failed to parse facilities");
      }
      return facilities;
    } else if (response.statusCode == 404) {
      throw Exception("URL not found");
    } else {
      throw Exception("Failed to load facilities");
    }
  }
}
