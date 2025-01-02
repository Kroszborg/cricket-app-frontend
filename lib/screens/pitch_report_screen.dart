import 'package:flutter/material.dart';

class PitchReportScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const PitchReportScreen({super.key, required this.matchDetails});

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
          'Pitch Report',
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
                      _buildPitchBehavior(),
                      const SizedBox(height: 24),
                      _buildPlayerTips(),
                      const SizedBox(height: 24),
                      _buildQuickInsights(),
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

  Widget _buildPitchBehavior() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pitch Behavior Over Time',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildSubSection('1. 1st Innings:', [
          'Batting-friendly, with true bounce.',
          'Fast bowlers get swing with the new ball.',
        ]),
        const SizedBox(height: 16),
        _buildSubSection('2. 2nd Innings:', [
          'Slows slightly; spinners get more turn.',
          'Batters can chase effectively under lights (D/N).',
        ]),
      ],
    );
  }

  Widget _buildPlayerTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Player Tips',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
            'Batters: Focus on timing; true bounce supports stroke play.'),
        _buildBulletPoint('Fast Bowlers: Target early swing with a new ball.'),
        _buildBulletPoint('Spinners: Use variations as the pitch slows down.'),
      ],
    );
  }

  Widget _buildQuickInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Insights',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
            'High-Scoring Venue: 80% of T20 matches see scores above 160.'),
        _buildBulletPoint(
            'Spin-Friendly: Economy rates for spinners improve in the 2nd innings.'),
        _buildBulletPoint(
            'Night Advantage: Chasing teams have a 10% better win rate due to dew.'),
      ],
    );
  }

  Widget _buildSubSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 8),
        ...points.map((point) => _buildBulletPoint(point)),
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
