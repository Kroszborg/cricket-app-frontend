import 'package:flutter/material.dart';

class TeamHeadToHeadScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const TeamHeadToHeadScreen({super.key, required this.matchDetails});

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
          'Team Head to Head',
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
                      _buildStatsTable(),
                      const SizedBox(height: 24),
                      _buildFormatSection(
                        'ODIs:',
                        [
                          'India has consistently dominated Bangladesh in the 50-over format, winning 31 out of 40 matches.',
                          'Bangladesh\'s victories have mostly come in recent years, showcasing their improvement in the ODI format.',
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildFormatSection(
                        'T20Is:',
                        [
                          'India holds a massive edge with 12 wins out of 13 matches.',
                          'Bangladesh\'s only T20I victory came in 2019, when they defeated India by 7 wickets in Delhi.',
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildFormatSection(
                        'Tests:',
                        [
                          'India remains unbeaten in the Test format against Bangladesh, winning 11 matches and drawing 2.',
                          'Bangladesh has struggled to challenge India in Tests due to India\'s superior pace and spin attack.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Key Factors in India\'s Dominance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildKeyFactor(
                        'Strong Batting Lineup',
                        'India\'s top-order batsmen like Rohit Sharma, Virat Kohli, and Shubman Gill have been consistent against Bangladesh\'s bowling attack.',
                      ),
                      _buildKeyFactor(
                        'Spin Dominance',
                        'Indian spinners, particularly R Ashwin and Ravindra Jadeja, have consistently troubled Bangladesh\'s batsmen.',
                      ),
                      _buildKeyFactor(
                        'Experience',
                        'India\'s squad has more experienced players who have performed well in high-pressure situations.',
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

  Widget _buildStatsTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!),
      columnWidths: const {
        0: FlexColumnWidth(1.2),
        1: FlexColumnWidth(1.0),
        2: FlexColumnWidth(1.0),
        3: FlexColumnWidth(1.0),
        4: FlexColumnWidth(1.2),
      },
      children: [
        _buildTableRow(
          [
            'Format',
            'Matches Played',
            'India Won',
            'Bangladesh Won',
            'No Result/Tied'
          ],
          isHeader: true,
        ),
        _buildTableRow(['ODIs', '40', '31', '8', '1']),
        _buildTableRow(['T20Is', '13', '12', '1', '0']),
        _buildTableRow(['Tests', '13', '11', '0', '2']),
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
                  padding: const EdgeInsets.all(8.0),
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

  Widget _buildFormatSection(String title, List<String> points) {
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
        const SizedBox(height: 8),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                '• $point',
                style: const TextStyle(fontSize: 16),
              ),
            )),
      ],
    );
  }

  Widget _buildKeyFactor(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
