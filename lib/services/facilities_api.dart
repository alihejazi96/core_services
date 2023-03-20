import 'dart:convert';
import 'package:coreapp1/Models/space.dart';
import 'package:http/http.dart' as http;


  String url = "https://gist.githubusercontent.com/mhassanist/38201f235f6c1b7a0b4f89effb89a399/raw/96ae3599141d35af90337b9d24b8550e36ed1a87/facilities.json";

Future<List<Facility>> getFacilities() async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var responseJson = jsonDecode(response.body);
    List<Facility> facilities = [];
    for (var item in responseJson["data"]) {
      Facility facility = Facility.fromJson(item);
      facilities.add(facility);
    }
    return facilities;
  } else {
    throw Exception("Failed to load facilities");
  }
}
  // Future<List<Facility>> getFacilities()async{
  //   var response = await http.get(Uri.parse(url));
  //
  //
  //   dynamic data;
  //   if (response.statusCode == 200){
  //     var responseJson = jsonDecode(response.body);
  //     data = responseJson["data"];
  //     List<Facility> facilities = [];
  //
  //     for(var item in data){
  //       Facility facility = Facility.fromJson(item);
  //       facilities.add(facility);
  //     }
  //   }else{
  //     print("error ${response.statusCode}" );
  //   }
  //   print("This is The data: --- $data");
  //   return data;
  //
  // }
