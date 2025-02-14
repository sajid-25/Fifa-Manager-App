import 'package:fifa_v1/models/team_model.dart';

class Tournament {
    String tournamentName;
    String tournamentType;
    int totalTeams;
    int currentSeason;
    List<TeamModel> teams = [];

    Tournament({
      required this.tournamentName,
      required this.tournamentType,
      required this.totalTeams,
      required this.currentSeason,
    });

    void addTeam(TeamModel teamModel) {
      teams.add(teamModel);
    }
}

List<Tournament> tournamentList = [
  Tournament(tournamentName: 'Ashes', tournamentType: 'League', totalTeams: 14, currentSeason: 2)
];