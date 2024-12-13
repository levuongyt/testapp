import 'package:cloud_firestore/cloud_firestore.dart';

class ThingBought {
  String? id;
  String? cost;
  String? title;

  ThingBought(this.id, this.cost, this.title);
  factory ThingBought.fromDocument(DocumentSnapshot doc) {
    return ThingBought(
      doc.id,
      doc.get('cost'),
      doc.get('thingName'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cost': cost,
      'thingName': title,
    };
  }
}
