
class Tournament {
    String tournamentName;
    String tournamentType;
    int totalTeams;
    int currentSeason;
    List<String> teams = [];

    Tournament({
      required this.tournamentName,
      required this.tournamentType,
      required this.totalTeams,
      required this.currentSeason,
      required this.teams
    });

    void addTeam(String teamUid) {
      teams.add(teamUid);
    }

    void removeTeam(int index) {
      teams.removeAt(index);
    }

    factory Tournament.fromMap(Map<String, dynamic> data) {
      return Tournament(
        tournamentName: data["tournamentName"] ?? "Unknown",
        tournamentType: data["tournamentType"] ?? "Unkonwn",
        totalTeams: data["totalTeams"] ?? 10,
        currentSeason: data["currentSeasone"] ?? 0,
        teams: List<String>.from(data["teams"] ?? []),
      );
    }
}