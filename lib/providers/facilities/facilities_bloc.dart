import 'package:coreapp1/models/response.dart';
import 'package:coreapp1/models/space.dart';
import 'package:coreapp1/services/mock_facilites_service.dart';
import 'package:flutter/cupertino.dart';

enum FacilitiesState { loading, failed, succeeded }

class FacilitesBloc extends ChangeNotifier {
  //make singleton
  FacilitesBloc._privateConstructor();
  static final FacilitesBloc _instance = FacilitesBloc._privateConstructor();
  factory FacilitesBloc() {
    return _instance;
  }
  FacilitiesState state = FacilitiesState.loading;
  List<Space> facilities = [];
  String errorMessage = "";

  fetchFacilities() async {
    //call facilites api
    try {
      Response response = await MockFacilitiesService.getFacilites();
      if (response.isOperationSuccessful) {
        updateState(FacilitiesState.succeeded);
        facilities = response.data;
      } else {
        errorMessage = response.message;
        updateState(FacilitiesState.failed);
      }
    } catch (e) {
      errorMessage = e.toString();
      updateState(FacilitiesState.failed);
    }
  }

  updateState(FacilitiesState state) {
    this.state = state;
    notifyListeners();
  }
}
