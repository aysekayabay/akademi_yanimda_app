import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  final _firestore = FirebaseFirestore.instance;

  Future<void> firestoreSendDataMap({required String collectionID, required String docID, required Map<String, dynamic> data}) async {
    await _firestore.collection(collectionID).doc(docID).set(data);
  }
}
