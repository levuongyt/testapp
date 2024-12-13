import 'package:btvn_buoi11/app_phone/model/thing_bought.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorage {
  static final FirebaseStorage singleton = FirebaseStorage._internal();
  factory FirebaseStorage() {
    return singleton;
  }
  FirebaseStorage._internal();
  final storage = FirebaseFirestore.instance;

  Future<bool> addThingsBought({required String nameThing, required String money}) async {
    bool result = false;
    try {
      await storage.collection('ThingsBought').doc(const Uuid().v1()).set({
        'thingName': nameThing,
        'cost': money,
      });
      result = true;
    } on FirebaseException catch (e) {
      result = false;
    }
    return result;
  }

  Future<List<ThingBought>> getThingsBought() async {
    final QuerySnapshot thingsBoughtResult =
        await storage.collection("ThingsBought").get();
    final List<ThingBought> result = thingsBoughtResult.docs
        .map((e) => ThingBought.fromDocument(e))
        .toList();
    return result;
  }

  Future<bool> updateThingsBought(String idUpdate, Map<String, dynamic> data) async {
    bool result = false;
    try {
      await storage.collection("ThingsBought").doc(idUpdate).update(data);
      result = true;
    } on FirebaseException catch (e) {
      result = false;
    }
    return result;
  }

  Future<bool> deleteThingsBought(String idXoa) async {
    bool result = false;
    try {
      await storage.collection("ThingsBought").doc(idXoa).delete();
      result = true;
    } on FirebaseException catch (e) {
      result = false;
    }
    return result;
  }
}
