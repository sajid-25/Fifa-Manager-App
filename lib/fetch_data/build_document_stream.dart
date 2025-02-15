import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifa_v1/models/tournament_model.dart';

class TournamentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream <List<Tournament>> getTournamentSteam() {
    return _firestore.collection('tournament').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Tournament.fromMap(doc.data());
      }).toList();
    });
  }
}