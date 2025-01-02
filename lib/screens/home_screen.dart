import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'Logo',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.notifications_outlined),
                      const SizedBox(width: 16),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9E7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.campaign_outlined,
                          color: Color(0xFFFFD700),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Big Update for Cricket !!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'We think you\'re going to love our new lineup builder',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {},
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMatchCard(
                    context,
                    'BAN',
                    'IND',
                    'assets/flags/ban.png',
                    'assets/flags/ind.png',
                    '8 Nov',
                    '7:50 pm',
                    'Bangladesh Tour of India - T20',
                  ),
                  const SizedBox(height: 16),
                  _buildMatchCard(
                    context,
                    'AUS',
                    'NZ',
                    'assets/flags/aus.png',
                    'assets/flags/nz.png',
                    '8 Nov',
                    '7:50 am',
                    'New Zealand Tour of Australia - Test',
                  ),
                  const SizedBox(height: 16),
                  _buildMatchCard(
                    context,
                    'SL',
                    'AFG',
                    'assets/flags/sl.png',
                    'assets/flags/afg.png',
                    '22 - 26 Nov',
                    '7:50 am',
                    'Afghanistan Tour of Srilanka - ODI',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchCard(
    BuildContext context,
    String team1,
    String team2,
    String flag1,
    String flag2,
    String date,
    String time,
    String series,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/create-team',
          arguments: {
            'team1': team1,
            'team2': team2,
            'flag1': flag1,
            'flag2': flag2,
            'time': time,
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flag1,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    team1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    team2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flag2,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                series,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
