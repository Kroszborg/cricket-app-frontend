import 'package:flutter/material.dart';

class CreateTeamScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const CreateTeamScreen({super.key, required this.matchDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create Team',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          matchDetails['flag1'],
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        matchDetails['team1'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    matchDetails['time'],
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        matchDetails['team2'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          matchDetails['flag2'],
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: const Text(
                'Playing 11 not announced',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMenuItem(
                    context,
                    'Squad',
                    Icons.group_outlined,
                    '/squad',
                  ),
                  _buildMenuItem(
                    context,
                    'Pitch Report',
                    Icons.landscape_outlined,
                    '/pitch-report',
                  ),
                  _buildMenuItem(
                    context,
                    'Batting Statistics',
                    Icons.sports_cricket_outlined,
                    '/batting-statistics',
                  ),
                  _buildMenuItem(
                    context,
                    'Bowling Statistics',
                    Icons.sports_cricket_outlined,
                    '/bowling-statistics',
                  ),
                  _buildMenuItem(
                    context,
                    'Player Overview',
                    Icons.person_outline,
                    '/player-overview',
                  ),
                  _buildMenuItem(
                    context,
                    'Team H2H',
                    Icons.compare_arrows_outlined,
                    '/team-head-to-head',
                  ),
                  _buildMenuItem(
                    context,
                    'CheatSheet',
                    Icons.description_outlined,
                    '/cheat-sheet',
                  ),
                  _buildMenuItem(
                    context,
                    'Expert Corner',
                    Icons.psychology_outlined,
                    '/expert-corner',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          route,
          arguments: matchDetails,
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFD700),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  