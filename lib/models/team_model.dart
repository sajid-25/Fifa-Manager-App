import 'package:fifa_v1/models/player_model.dart';

class TeamModel {
  int id;
  late int squadSize;
  String teamName;
  double budget;
  late int tablePosition;
  List<PlayerModel> squad = [];

  TeamModel({
    required this.id,
    required this.budget,
    required this.teamName,
  });

  void setSquadSize() {
    squadSize = squad.length;
  }

  void setTablePosition(int position) {
    tablePosition = position;
  }

  void addPlayer(PlayerModel playerModel) {
    squad.add(playerModel);
  }
}