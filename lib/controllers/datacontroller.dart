import 'dart:async';

import 'package:assesment/data/dummydata.dart';
import 'package:assesment/model/datamodel.dart';
import 'package:get/get.dart';

class Datacontroller extends GetxController {
  List<Datamodel>? finaldata;
  Future<List<Datamodel>> fetchdata() async {
    List result = await Dummydata().data;

    update();
    final data = result.map((m) => Datamodel.fromJson(m)).toList();
    return data;
  }

  Future<List<Datamodel>> fetcheddata() async {
    List<Datamodel> finalresult = await fetchdata();
    finaldata = finalresult;
    update();

    if (finaldata != null) {
      update();
      return finaldata!;
    } else {
      throw Exception();
    }
  }

  @override
  void onInit() {
    fetchdata();
    fetcheddata();
    super.onInit();
  }
}
