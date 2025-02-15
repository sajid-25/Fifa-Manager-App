import 'package:fifa_v1/controller/add_tournament_control.dart';
import 'package:fifa_v1/data_store/firestore.dart';
import 'package:fifa_v1/models/tournament_model.dart';
import 'package:flutter/material.dart';

class AddTournament extends StatefulWidget {
  const AddTournament({super.key});

  @override
  State<AddTournament> createState() => _AddTournamentState();
}

class _AddTournamentState extends State<AddTournament> {
  final Firestore _firestore = Firestore();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _seasonController = TextEditingController();
  final AddTournamentControl _addTournamentControl = AddTournamentControl();
  int? selectedTeamSize;
  String? selectedType;

  void onChangedTeam(int? value) {
    setState(() {
      selectedTeamSize = value;
    });
  }

  void onChangedType(String? value) {
    setState(() {
      selectedType = value;
    });
  }

  Tournament convertToTournamentObject(String name, String type, int teams, int season){
    return Tournament(tournamentName: name, tournamentType: type, totalTeams: teams, currentSeason: season, teams: []);
  }

  void registerTeam() {
    int teams = selectedTeamSize ?? 0;
    String type = selectedType ?? '';
    int season = int.tryParse(_seasonController.text) ?? 0;
    Tournament tournament = convertToTournamentObject(_nameController.text, type, teams, season);
    _firestore.addTournamentToDatabase(tournament);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Tournament'
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            color: const Color.fromARGB(167, 255, 255, 255)
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        prefixIcon: Icon(
                          Icons.flag,
                          color: Colors.green,
                        ),
                        //suffixIcon: Icon(Icons.clear)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: DropdownButton<int>(
                          hint: Text(
                          'Teams',
                          style: TextStyle(color: Colors.white),
                        ),
                            value: selectedTeamSize,
                            onChanged: onChangedTeam,
                            items: _addTournamentControl.teams.map((int team) {
                              return DropdownMenuItem<int>(
                                alignment: Alignment.center,
                                value: team,
                                child: Text(team.toString(), style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            dropdownColor: Colors.black,
                            underline: SizedBox(),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: DropdownButton<String>(
                          hint: Text(
                          'Type',
                          style: TextStyle(color: Colors.white),
                        ),
                            value: selectedType,
                            onChanged: onChangedType,
                            items: _addTournamentControl.types.map((String type) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.center,
                                value: type,
                                child: Text(type.toString(), style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            dropdownColor: Colors.black,
                            underline: SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: _seasonController,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        label: Text(
                          'Season',
                          style: TextStyle(
                            color: const Color.fromARGB(167, 255, 255, 255)
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        prefixIcon: Icon(
                          Icons.timeline_rounded,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  IconButton(
                    onPressed: () {
                      // if(_nameController.text.isNotEmpty && _seasonController.text.isNotEmpty && selectedTeamSize.toString() == 'Teams' && selectedType.toString() == 'Type') {
                      //   registerTeam();
                      // } else {
                      //   print('no');
                      // }
                      registerTeam();
                    },
                    icon: Icon(Icons.done_all),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}