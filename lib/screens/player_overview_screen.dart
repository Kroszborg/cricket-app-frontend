import 'package:flutter/material.dart';

class PlayerOverviewScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const PlayerOverviewScreen({super.key, required this.matchDetails});

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
          'Player Overview',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMatchHeader(matchDetails),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildKeyPlayers('Key Indian Players'),
                      const SizedBox(height: 24),
                      _buildKeyPlayers('Key Bangladeshi Players'),
                      const SizedBox(height: 24),
                      _buildKeyBattles(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchHeader(Map<String, dynamic> details) {
    return Container(
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
        children: [
          Image.asset(details['flag1'], width: 40, height: 40),
          const SizedBox(width: 8),
          Text(
            'vs',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(details['flag2'], width: 40, height: 40),
          const SizedBox(width: 16),
          Text(
            details['time'],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Playing 11 not announced',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyPlayers(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        if (title == 'Key Indian Players')
          ..._buildIndianPlayers()
        else
          ..._buildBangladeshiPlayers(),
      ],
    );
  }

  List<Widget> _buildIndianPlayers() {
    return [
      _buildPlayerCard(
        'Virat Kohli',
        'Batsman',
        'assets/players/virat_kohli.png',
        'Consistent performer, strong against spin',
      ),
      _buildPlayerCard(
        'Rohit Sharma',
        'Batsman',
        'assets/players/rohit_sharma.png',
        'Explosive opener, good against pace',
      ),
      _buildPlayerCard(
        'Jasprit Bumrah',
        'Bowler',
        'assets/players/jasprit_bumrah.png',
        'Yorker specialist, economical in death overs',
      ),
    ];
  }

  List<Widget> _buildBangladeshiPlayers() {
    return [
      _buildPlayerCard(
        'Shakib Al Hasan',
        'All-rounder',
        'assets/players/shakib_al_hasan.png',
        'Experienced all-rounder, key wicket',
      ),
      _buildPlayerCard(
        'Mushfiqur Rahim',
        'Wicket-keeper Batsman',
        'assets/players/mushfiqur_rahim.png',
        'Reliable middle-order batsman',
      ),
      _buildPlayerCard(
        'Mustafizur Rahman',
        'Bowler',
        'assets/players/mustafizur_rahman.png',
        'Crafty left-arm pacer, good at variations',
      ),
    ];
  }

  Widget _buildPlayerCard(
      String name, String role, String imagePath, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyBattles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Player Battles to Watch',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBattle(
          'Rohit Sharma vs Mustafizur Rahman',
          'Rohit\'s aggressive start vs Mustafizur\'s variations.',
        ),
        _buildBattle(
          'Virat Kohli vs Shakib Al Hasan',
          'Kohli\'s chase mastery against Shakib\'s accurate spin.',
        ),
        _buildBattle(
          'Jasprit Bumrah vs Litton Das',
          'Bumrah\'s new ball control vs Litton\'s attacking approach.',
        ),
        _buildBattle(
          'Kuldeep Yadav vs Mushfiqur Rahim',
          'Kuldeep\'s spin against Mushfiqur\'s ability to handle pressure.',
        ),
      ],
    );
  }

  Widget _buildBattle(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('• ', style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
