import 'package:fifa_v1/actions/add_player.dart';
import 'package:fifa_v1/models/team_model.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  final TeamModel teamModel;
  const TeamPage({
    super.key,
    required this.teamModel
  });

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.teamModel.teamName,
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
        itemCount: widget.teamModel.squad.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            widget.teamModel.squad[index].name,
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddPlayer(teamModel: widget.teamModel,))
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