import 'package:flutter/material.dart';

class SquadScreen extends StatelessWidget {
  final Map<String, dynamic> matchDetails;

  const SquadScreen({super.key, required this.matchDetails});

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
          'Squad',
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
                      const Text(
                        'Squad for Bangladesh tour of India',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildTeamSquad('India'),
                      const SizedBox(height: 24),
                      _buildTeamSquad('Bangladesh'),
                      const SizedBox(height: 24),
                      const Text(
                        'Notably, Mohammed Shami and Kuldeep Yadav are absent from this series due to injuries.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Additionally, there are retirement speculations surrounding senior players like Rohit Sharma, Virat Kohli, and Ravindra Jadeja, especially after Ravichandran Ashwin\'s recent retirement announcement.',
                        style: TextStyle(fontSize: 16),
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

  Widget _buildTeamSquad(String team) {
    List<String> batters = [];
    List<String> allRounders = [];
    List<String> wicketkeepers = [];
    List<String> bowlers = [];

    if (team == 'India') {
      batters = [
        'Rohit Sharma (Captain)',
        'Yashasvi Jaiswal',
        'Shubman Gill',
        'Virat Kohli',
        'Shreyas Iyer',
        'Ruturaj Gaikwad'
      ];
      allRounders = ['Ravindra Jadeja', 'Axar Patel', 'Hardik Pandya'];
      wicketkeepers = ['Rishabh Pant', 'KL Rahul'];
      bowlers = [
        'Jasprit Bumrah',
        'Mohammed Siraj',
        'Akash Deep',
        'Kuldeep Yadav',
        'Ravichandran Ashwin'
      ];
    } else {
      // Add Bangladesh squad here
      batters = [
        'Tamim Iqbal',
        'Litton Das',
        'Najmul Hossain Shanto',
        'Mushfiqur Rahim'
      ];
      allRounders = [
        'Shakib Al Hasan (Captain)',
        'Mehidy Hasan Miraz',
        'Mahmudullah'
      ];
      wicketkeepers = ['Nurul Hasan'];
      bowlers = [
        'Mustafizur Rahman',
        'Taskin Ahmed',
        'Shoriful Islam',
        'Taijul Islam'
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 16),
        _buildPlayerCategory('Batters:', batters),
        _buildPlayerCategory('All-rounders:', allRounders),
        _buildPlayerCategory('Wicketkeepers:', wicketkeepers),
        _buildPlayerCategory('Bowlers:', bowlers),
      ],
    );
  }

  Widget _buildPlayerCategory(String category, List<String> players) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...players.map((player) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                '• $player',
                style: const TextStyle(fontSize: 16),
              ),
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}
