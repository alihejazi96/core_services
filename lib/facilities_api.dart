import 'package:http/http.dart' as http;

class FacilitiesApi{
  getFacilities()async{
    var response = await http.get(Uri.parse("https://google.com"));
    print(response.body);
  }
}