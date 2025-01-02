import 'package:flutter/material.dart';

class CheatSheetScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const CheatSheetScreen({super.key, required this.matchDetails});

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
          'Cheat Sheet',
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
                      _buildSection(
                        'Pitch Insights (Eden Gardens)',
                        [
                          'Batting First Advantage: Early bounce; good for stroke play.',
                          'Spinners Dominate: Post middle overs, spin becomes key.',
                          'Dew Factor: Evening matches favor chasing teams.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildSection(
                        'Recent Form',
                        [
                          'India: Strong performances across all formats.',
                          'Bangladesh: Competitive in ODIs but inconsistent in T20s and Tests.',
                        ],
                        icon: Icons.trending_up,
                      ),
                      const SizedBox(height: 24),
                      _buildWinningStrategy(),
                      const SizedBox(height: 24),
                      _buildSection(
                        'Quick Stats',
                        [
                          'ODI Average Score: 240-280 runs.',
                          'India\'s ODI Win Rate: 77% against Bangladesh.',
                          'Bangladesh\'s T20 Win: Came in 2019 (Delhi).',
                        ],
                        icon: Icons.bolt,
                      ),
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

  Widget _buildSection(String title, List<String> points, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFFFFD700)),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                '• $point',
                style: const TextStyle(fontSize: 16),
              ),
            )),
      ],
    );
  }

  Widget _buildWinningStrategy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.search, color: Color(0xFFFFD700)),
            SizedBox(width: 8),
            Text(
              'Winning Strategy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTeamStrategy(
          '1. India:',
          [
            'Bat first, post a big total.',
            'Use spinners in the middle overs.',
          ],
        ),
        const SizedBox(height: 16),
        _buildTeamStrategy(
          '2. Bangladesh:',
          [
            'Bowl first in evening games (dew advantage).',
            'Shakib and Mehidy key with spin control.',
          ],
        ),
      ],
    );
  }

  Widget _buildTeamStrategy(String team, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                '• $point',
                style: const TextStyle(fontSize: 16),
              ),
            )),
      ],
    );
  }
}
