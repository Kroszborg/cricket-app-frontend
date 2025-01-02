import 'package:flutter/material.dart';

class ExpertCornerScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const ExpertCornerScreen({super.key, required this.matchDetails});

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
          'Expert Corner',
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
                      _buildPitchConditions(),
                      const SizedBox(height: 24),
                      _buildKeyStrategies(),
                      const SizedBox(height: 24),
                      _buildKeyPlayers(),
                      const SizedBox(height: 24),
                      _buildMatchInsights(),
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

  Widget _buildPitchConditions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pitch Conditions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 12),
        _buildBulletPoint(
            'Batting-friendly initially; spinners dominate later.'),
        _buildBulletPoint('Dew factor in the evening makes chasing easier.'),
      ],
    );
  }

  Widget _buildKeyStrategies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.key, color: Color(0xFFFFD700)),
            SizedBox(width: 8),
            Text(
              'Key Strategies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTeamStrategies(
          '1. India:',
          [
            'Bat First: Post a big total and let spinners dominate.',
            'Top Order: Key focus on Rohit Sharma and Virat Kohli for steady starts.',
            'Bowlers: Use Kuldeep Yadav and Jadeja in middle overs to break partnerships.',
          ],
        ),
        const SizedBox(height: 16),
        _buildTeamStrategies(
          '2. Bangladesh:',
          [
            'Bowl First if dew is expected.',
            'Shakib & Mehidy Hasan: Leverage spin in the middle overs.',
            'Batters: Litton Das and Shanto must counter India\'s spinners.',
          ],
        ),
      ],
    );
  }

  Widget _buildTeamStrategies(String team, List<String> strategies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 8),
        ...strategies.map((strategy) => _buildBulletPoint(strategy)),
      ],
    );
  }

  Widget _buildKeyPlayers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.person, color: Color(0xFFFFD700)),
            SizedBox(width: 8),
            Text(
              'Key Players',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('India: Rohit Sharma, Kuldeep Yadav, Hardik Pandya.'),
        _buildBulletPoint(
            'Bangladesh: Shakib Al Hasan, Litton Das, Taskin Ahmed.'),
      ],
    );
  }

  Widget _buildMatchInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.insights, color: Color(0xFFFFD700)),
            SizedBox(width: 8),
            Text(
              'Match Insights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('India\'s win rate against BAN: 75% overall.'),
        _buildBulletPoint(
            'Bangladesh can upset if they bowl tight in powerplay.'),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
