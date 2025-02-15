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
        //

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
          },
        );
      }
    );
  }

  Widget _buildTournamentTile(Tournament tournament, BuildContext context) {
    return ListTile(
      title: Text(
        tournament.tournamentName
      ),
      subtitle: Text(
        tournament.tournamentType
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
}