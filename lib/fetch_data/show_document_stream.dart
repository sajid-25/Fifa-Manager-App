import 'package:fifa_v1/information_pages/detailed_tournament.dart';
import 'package:fifa_v1/models/player_model.dart';
import 'package:fifa_v1/models/team_model.dart';
import 'package:fifa_v1/models/tournament_model.dart';
import 'package:flutter/material.dart';

class ShowDocumentStream extends StatelessWidget {
  final Stream documentStream;
  const ShowDocumentStream({
    super.key,
    required this.documentStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: documentStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Center(child: Text("Error loading tournaments"));
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const Center(child: Text("No tournaments available"));
        

        List<dynamic> documents = snapshot.data;
        
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var doc = documents[index];
            if(doc is Tournament) {
              return _buildTournamentTile(doc, context);
            }
            if (doc is TeamModel) {
              return _buildTeamTile(doc, context);
            }
            if(doc is Player) {
              return _buildPlayerTile(doc, context);
            }
          },
        );
      }
    );
  }

  Widget _buildTournamentTile(Tournament tournament, BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedTournament(
        tournament: tournament,
      ))),
      title: Center(
        child: Text(
          tournament.tournamentName
        ),
      ),
      titleTextStyle: TextStyle(
        color: Colors.green,
        fontSize: 30
      ),
      subtitle: Center(
        child: Text(
          tournament.tournamentType
        ),
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.yellow
      ),
    );
  }

  Widget _buildTeamTile(TeamModel teammodel, BuildContext context) {
    return ListTile(
      title: Text(
        teammodel.teamName
      ),
      subtitle: Text(
        teammodel.budget
      ),
    );
  }

  Widget _buildPlayerTile(Player player, BuildContext context) {
    return ListTile(
      title: Text(
        player.name
      ),
      subtitle: Text(
        player.position
      ),
    );
  }
}