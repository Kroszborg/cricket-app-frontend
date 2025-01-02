import 'package:flutter/material.dart';

class BattingStatisticsScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const BattingStatisticsScreen({super.key, required this.matchDetails});

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
          'Batting Statistics',
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
                      _buildKeyBattingInsights(),
                      const SizedBox(height: 24),
                      _buildBestBattingStrategies(),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            dataTextStyle: const TextStyle(
              color: Colors.black87,
            ),
            columns: const [
              DataColumn(label: Text('Format')),
              DataColumn(label: Text('Average 1st Innings Score')),
              DataColumn(label: Text('Highest Score')),
              DataColumn(label: Text('Lowest Score')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('T20')),
                DataCell(Text('160-180')),
                DataCell(Text('201/5 (India)')),
                DataCell(Text('70/10 (Bangladesh)')),
              ]),
              DataRow(cells: [
                DataCell(Text('ODI')),
                DataCell(Text('240-280')),
                DataCell(Text('404/5 (India)')),
                DataCell(Text('123/10 (South Africa)')),
              ]),
              DataRow(cells: [
                DataCell(Text('Test')),
                DataCell(Text('350-400')),
                DataCell(Text('657/7 (India)')),
                DataCell(Text('90/10 (West Indies)')),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeyBattingInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Batting Insights',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildNumberedPoint(
            1, 'High-Scoring Ground: Ideal for stroke players.'),
        _buildNumberedPoint(
            2, '1st Innings Advantage: 65% of wins come when batting first.'),
        _buildNumberedPoint(
            3, 'Chasing Trend: Dew assists chasing teams in ODIs and T20s.'),
        _buildNumberedPoint(4,
            'Top Performers: Virat Kohli, Rohit Sharma, and Sachin Tendulkar dominate the records.'),
      ],
    );
  }

  Widget _buildNumberedPoint(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestBattingStrategies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Best Batting Strategies',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildBulletPoint('Play straight with timing on true bounce pitches.'),
        _buildBulletPoint(
            'Target the powerplay overs in T20s for high scores.'),
        _buildBulletPoint(
            'Rotate strike in middle overs when spinners dominate.'),
        _buildBulletPoint(
            'Build partnerships in Tests to capitalize on batting-friendly tracks.'),
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
