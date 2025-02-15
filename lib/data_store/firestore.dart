import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifa_v1/models/team_model.dart';

class Firestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTeamToDatabase(TeamModel teamModel) async {
    try {
      await _firestore.collection('teams').doc('').set(
        {
          
        }
      );
    } on FirebaseException catch (e) {
      throw Exception(e.hashCode);
    }
  }
}