import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyTipsScreen extends StatelessWidget {
  const StudyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Study Zone',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            background: Image.asset(
              'assets/images/study_header.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final tip = _studyTips[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: tip['color'] as Color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            tip['icon'] as IconData,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          tip['title'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip['description'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _studyTips.length,
            ),
          ),
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> _studyTips = [
    {
      'title': 'Pomodoro Technique',
      'description':
          'Study for 25 minutes, then take a 5 minute break. Repeat 4 times, then take a longer break.',
      'icon': Icons.timer,
      'color': Colors.blue,
    },
    {
      'title': 'Active Recall',
      'description':
          'Test yourself on the material instead of just rereading. This strengthens memory retention.',
      'icon': Icons.psychology,
      'color': Colors.green,
    },
    {
      'title': 'Spaced Repetition',
      'description':
          'Review material over increasing intervals of time to combat the forgetting curve.',
      'icon': Icons.calendar_today,
      'color': Colors.orange,
    },
    {
      'title': 'Mind Mapping',
      'description':
          'Create visual diagrams to organize and connect concepts in a non-linear way.',
      'icon': Icons.account_tree,
      'color': Colors.purple,
    },
    {
      'title': 'Feynman Technique',
      'description':
          'Explain concepts in simple terms as if teaching someone else to identify gaps in understanding.',
      'icon': Icons.record_voice_over,
      'color': Colors.red,
    },
    {
      'title': 'Interleaving',
      'description':
          'Mix different topics or subjects during study sessions to improve learning.',
      'icon': Icons.shuffle,
      'color': Colors.teal,
    },
  ];
}