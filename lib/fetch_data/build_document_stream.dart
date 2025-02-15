import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifa_v1/models/player_model.dart';
import 'package:fifa_v1/models/team_model.dart';
import 'package:fifa_v1/models/tournament_model.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream <List<Tournament>> getTournamentStream() {
    return _firestore.collection('tournament').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Tournament.fromMap(doc.data());
      }).toList();
    });
  }

  Stream <List<TeamModel>> getTeamStream() {
    return _firestore.collection('teams').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TeamModel.fromMap(doc.data());
      }).toList();
    });
  }

  Stream <List<Player>> getPlayerStream() {
    return _firestore.collection('players').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Player.fromMap(doc.data());
      }).toList();
    });
  }

}