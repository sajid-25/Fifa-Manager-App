import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifa_v1/models/team_model.dart';
import 'package:fifa_v1/models/tournament_model.dart';

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

  Future<void> addTournamentToDatabase(Tournament tournament) async {
    try {
      await _firestore.collection('tournament').doc().set(
        {
          'tournamentName': tournament.tournamentName,
          'tournamentType': tournament.tournamentType,
          'currentSeason': tournament.currentSeason,
          'totalTeams': tournament.totalTeams
        }
      );
    } on FormatException catch(e) {
      throw Exception(e.hashCode);
    }
  }
}