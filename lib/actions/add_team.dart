import 'package:fifa_v1/models/team_model.dart';
import 'package:fifa_v1/models/tournament_model.dart';
import 'package:flutter/material.dart';

class AddTeam extends StatelessWidget {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _teamBudgetController = TextEditingController();
  final Tournament tournament;
  AddTeam({
    super.key,
    required this.tournament
  });

  void createNewTeam(BuildContext context) {
    double? budget = double.parse(_teamBudgetController.text);
    //TeamModel teamModel = TeamModel(uid: 00, teamName: _teamNameController.text);
    //tournament.addTeam(teamModel);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Add a team',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Team Name:'
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _teamNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Budget:'
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _teamBudgetController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
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
                      Icons.euro,
                      color: Colors.yellow,
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  createNewTeam(context);
                },
                child: Text(
                  'Add Team '
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}