import 'package:fifa_v1/pages/player_page.dart';
import 'package:fifa_v1/pages/team_page.dart';
import 'package:fifa_v1/pages/tournament_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> screensName = [
    'Tournaments', 'Teams', 'Players'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      TournamentPage(),
      TeamPage(),
      PlayerPage()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screensName[_currentIndex]
        ),
        centerTitle: true,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              activeIcon: Icon(Icons.emoji_events),
              label: 'Tournaments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag_circle_outlined),
              activeIcon: Icon(Icons.flag),
              label: 'Teams',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.face_retouching_natural),
              icon: Icon(Icons.face_retouching_natural_outlined),
              label: 'Players',
            ),
        ],
      ),
    );
  }
}