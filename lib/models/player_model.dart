class Player {
  String uid;
  String name;
  int age;
  String country;
  String position;
  int overall;
  int playedMinitues;
  String value;
  String wage;
  String team;
  int motm;

  Player({
    required this.uid,
    required this.name,
    required this.age,
    required this.country,
    required this.position,
    required this.overall,
    this.playedMinitues = 0,
    required this.value,
    required this.wage,
    required this.team,
    this.motm = 0
  });

  void setAge() { age++; }
  void setPosition(String newPosition) { position = newPosition; }
  void setOverall(int newOverall) { overall = newOverall; }
  void setValue(String newValue) { value = newValue; }
  void setWage(String newWage) { wage = newWage; }
  void setTeam(String newTeam) { team = newTeam; }

  factory Player.fromMap(Map<String, dynamic> data) {
    return Player(
      uid: data["uid"] ?? "Not Registerd",
      name: data["name"] ?? "Not Registerd",
      age: data["age"] ?? 0,
      country: data["country"] ?? "Not Registerd",
      position: data["position"] ?? "Not Registerd",
      overall: data["overall"] ?? 0,
      value: data["value"] ?? "Not Registerd",
      wage: data["wage"] ?? "Not Registerd",
      team: data["team"] ?? "Not Registerd",
    );
  }
}

class Attacker extends Player {
  int goalScorred;
  int assists;

  Attacker({
    required super.uid,
    required super.name,
    required super.age,
    required super.country,
    required super.position,
    required super.overall,
    super.playedMinitues = 0,
    required super.value,
    required super.wage,
    required super.team,
    super.motm =0,
    this.goalScorred = 0,
    this.assists = 0,
  });

  void setGoalScorred(int goals) { goalScorred = goals; }
  void setAssist(int assist) { assists = assist; }
}

class MidFielder extends Player {
  int goalScorred;
  int assists;
  int dribbling;
  int tackleWon;

  MidFielder({
    required super.uid,
    required super.name,
    required super.age,
    required super.country,
    required super.position,
    required super.overall,
    super.playedMinitues = 0,
    required super.value,
    required super.wage,
    required super.team,
    super.motm =0,
    this.goalScorred = 0,
    this.assists = 0,
    this.dribbling = 0,
    this.tackleWon = 0
  });

  void setGoalScorred(int goals) { goalScorred = goals; }
  void setAssist(int assist) { assists = assist; }
  void setDribbling(int dribbles) { dribbling = dribbles; }
  void setTackles(int tackle) { tackleWon = tackle; }
}

class Diffender extends Player {
  int dribbleWon;
  int cleanSheets;
  int fauls;
  int passAcc;

  Diffender({
    required super.uid,
    required super.name,
    required super.age,
    required super.country,
    required super.position,
    required super.overall,
    super.playedMinitues = 0,
    required super.value,
    required super.wage,
    required super.team,
    super.motm =0,
    this.cleanSheets = 0,
    this.dribbleWon = 0,
    this.fauls = 0,
    this.passAcc = 0
  });

  void setDribbleWons(int dribble) { dribbleWon = dribble; }
  void setCleanSheets(int cleanSheet) { cleanSheets = cleanSheet; }
  void setFauls(int faul) { fauls = faul; }
  void setPassAccuracy( int passes) { passAcc = passes; }
}

class GoalKeeper extends Player {
  int cleanSheets;
  int saves;
   
  GoalKeeper({
    required super.uid,
    required super.name,
    required super.age,
    required super.country,
    required super.position,
    required super.overall,
    super.playedMinitues = 0,
    required super.value,
    required super.wage,
    required super.team,
    super.motm =0,
    this.cleanSheets = 0,
    this.saves = 0
  });

  void setCleanSheets(int cleanSheet) { cleanSheets = cleanSheet; }
  void setSaves(int save) { saves = save; }
}
