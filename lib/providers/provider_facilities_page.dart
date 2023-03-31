import 'package:coreapp1/services/facilities_api.dart';
import 'package:flutter/cupertino.dart';

import '../Models/space.dart';

enum ListFacilitiesState { initial, loading, failed, success }

class FacilitiesPageState extends ChangeNotifier {
  String errorMessage = "";

  ListFacilitiesState facilitiesstates = ListFacilitiesState.initial;

  List<Facility> facilities = [];

  getFacilitiesDate() async {
    // facilitiesstates = ListFacilitiesState.loading;
    // notifyListeners();

    try {
      facilities = await FacilitiesAPI().getFacilities();
      // var response = await FacilitiesAPI()
      //     .bookFacility(1, "2023-04-03T16:30:00", "2023-04-03T18:30:00", 1);
      // print(response);

      UpadateState(ListFacilitiesState.success);
    } catch (e) {
      errorMessage = e.toString();
      UpadateState(ListFacilitiesState.failed);
    }
  }

  UpadateState(ListFacilitiesState state) {
    facilitiesstates = state;
    notifyListeners();
  }
}
