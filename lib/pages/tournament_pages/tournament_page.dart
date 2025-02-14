import 'package:fifa_v1/models/tournament_model.dart';
import 'package:fifa_v1/actions/add_team.dart';
import 'package:fifa_v1/pages/team_pages/team_page.dart';
import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  final Tournament tournament;
  const TournamentPage({
    super.key,
    required this.tournament
  });

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.tournament.tournamentName,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: widget.tournament.teams.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPage(teamModel: widget.tournament.teams[index]))),
          title: Text(
            widget.tournament.teams[index].teamName,
          ),
          titleTextStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 20
          ),
          leading: Icon(
            Icons.flag_outlined,
            color: Colors.blue,
          ),
          splashColor: Colors.transparent,
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTeam(tournament: widget.tournament))
            ).then((_) {
             setState(() {
               
             }); 
            });
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}