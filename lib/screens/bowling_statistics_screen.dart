import 'package:flutter/material.dart';

class BowlingStatisticsScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const BowlingStatisticsScreen({super.key, required this.matchDetails});

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
          'Bowling Statistics',
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
                      _buildFormatOverview(),
                      const SizedBox(height: 24),
                      _buildKeyStats(),
                      const SizedBox(height: 24),
                      _buildPerformanceTrends(),
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

  Widget _buildFormatOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Format-Wise Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        Table(
          border: TableBorder.all(color: Colors.grey[300]!),
          children: [
            _buildTableRow(['Bowling Type', 'Effectiveness'], isHeader: true),
            _buildTableRow(['Fast Bowlers', 'Early swing (1st innings)']),
            _buildTableRow(['Spinners', 'More turn later in the match']),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.grey[100] : Colors.white,
      ),
      children: cells
          .map((cell) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    cell,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          isHeader ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildKeyStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Stats',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBowlerSection(
          '1. Fast Bowlers',
          [
            'Early overs: Swing and seam movement.',
            'Economy: 4.5-5.0 runs/over in ODIs.',
            'Wickets: High in the powerplay (1st 10 overs).',
          ],
        ),
        const SizedBox(height: 16),
        _buildBowlerSection(
          '2. Spinners',
          [
            'Middle overs: Key breakthroughs.',
            'Economy: 4.0-4.3 runs/over.',
            'Late Innings: Increased grip and turn.',
          ],
        ),
      ],
    );
  }

  Widget _buildBowlerSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                '• $point',
                style: const TextStyle(fontSize: 14),
              ),
            )),
      ],
    );
  }

  Widget _buildPerformanceTrends() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Performance Trends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBulletPoint('Best Phase for Pacers: First 10 overs (new ball).'),
        _buildBulletPoint('Best Phase for Spinners: Middle and death overs.'),
        _buildBulletPoint('Pace vs Spin (ODIs):'),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: _buildBulletPoint('Wickets: 60% (Pace) | 40% (Spin)'),
        ),
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
        _buildBulletPoint('Economy Leaders: Spinners dominate in Tests.'),
        _buildBulletPoint(
            'Death Overs Challenge: Pacers concede more in T20s.'),
        _buildBulletPoint(
            'Best Bowling Strategy: Vary pace and use the crease.'),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '• $text',
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
