import 'package:fifa_v1/models/player_model.dart';

class TeamModel {
  String uid;
  late int squadSize;
  String teamName;
  String country;
  String budget;
  late int tablePosition;
  List<Player> squad = [];

  TeamModel({
    required this.uid,
    required this.teamName,
    required this.country,
    required this.budget
  });

  void setSquadSize() {
    squadSize = squad.length;
  }

  void setTablePosition(int position) {
    tablePosition = position;
  }

  void addPlayer(Player playerModel) {
    squad.add(playerModel);
  }

  void setBudget(String newBudget) {
    budget = newBudget;
  }

  factory TeamModel.fromMap(Map<String, dynamic> data) {
    return TeamModel(uid: data["uid"] ?? "Not Registerd",
    teamName: data["teamName"] ?? "Not Registerd",
    country: data["country"] ?? "Not Registerd",
    budget: data["budget"] ?? "Not Registerd"
    );
  }
}