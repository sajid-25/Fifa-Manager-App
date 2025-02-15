import 'package:fifa_v1/models/player_model.dart';

class TeamModel {
  int uid;
  late int squadSize;
  String teamName;
  String country;
  late double budget;
  late int tablePosition;
  List<Player> squad = [];

  TeamModel({
    required this.uid,
    required this.teamName,
    required this.country
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

  void setBudget(double newBudget) {
    budget = newBudget;
  }
}