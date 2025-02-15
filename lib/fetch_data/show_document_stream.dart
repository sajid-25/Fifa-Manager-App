import 'package:fifa_v1/fetch_data/build_document_stream.dart';
import 'package:fifa_v1/models/tournament_model.dart';
import 'package:flutter/material.dart';

class ShowDocumentStream extends StatelessWidget {
  ShowDocumentStream({super.key});
  final TournamentService _tournamentService = TournamentService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _tournamentService.getTournamentSteam(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Center(child: Text("Error loading tournaments"));
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty) return const Center(child: Text("No tournaments available"));
        List<Tournament> tournaments = snapshot.data!;
        return ListView.builder(
          itemCount: tournaments.length,
          itemBuilder: (context, index) {
            return _buildTournamentTile(tournaments[index], context);
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
}