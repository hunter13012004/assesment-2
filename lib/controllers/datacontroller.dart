import 'dart:async';

import 'package:assesment/data/dummydata.dart';
import 'package:assesment/model/datamodel.dart';
import 'package:get/get.dart';

class Datacontroller extends GetxController {
  // Use RxList for reactive state
  RxList<Datamodel> finaldata = <Datamodel>[].obs;

  // Fetch data from dummy source
  Future<List<Datamodel>> fetchdata() async {
    List result = await Dummydata().data;
    final data = result.map((m) => Datamodel.fromJson(m)).toList();
    return data;
  }

  // Assign fetched data to the RxList
  Future<void> fetcheddata() async {
    try {
      List<Datamodel> finalresult = await fetchdata();
      finaldata.assignAll(finalresult); // Use assignAll to update RxList
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void onInit() {
    fetcheddata(); // Only need to call fetcheddata
    super.onInit();
  }
}
