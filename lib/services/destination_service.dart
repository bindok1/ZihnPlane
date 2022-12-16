import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/destination_model.dart';

class DestinationService {
  //collectionReference untuk ambil dari firebase
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}

class NewDestinationService {
  //collectionReference untuk ambil dari firebase
  CollectionReference _newdestinationRef =
      FirebaseFirestore.instance.collection('new_destinations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _newdestinationRef.get();

      List<DestinationModel> new_destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return new_destinations;
    } catch (e) {
      throw e;
    }
  }
}