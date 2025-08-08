import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Community Board',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            background: Image.asset(
              'assets/images/community_header.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final post = _posts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(post['avatar']!),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['name']!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  post['time']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          post['message']!,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up_outlined),
                              onPressed: () {},
                            ),
                            Text(
                              post['likes']!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              icon: const Icon(Icons.comment_outlined),
                              onPressed: () {},
                            ),
                            Text(
                              post['comments']!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _posts.length,
            ),
          ),
        ),
      ],
    );
  }

  final List<Map<String, String>> _posts = [
    {
      'avatar': 'assets/images/avatar1.jpg',
      'name': 'Alex Johnson',
      'time': '2 hours ago',
      'message':
          'Looking for study partners for CS101 midterms next week. We can meet at the library or online. DM if interested!',
      'likes': '12',
      'comments': '5',
    },
    {
      'avatar': 'assets/images/avatar2.jpg',
      'name': 'Maria Garcia',
      'time': '5 hours ago',
      'message':
          'Found this great coffee shop near campus with free WiFi and student discounts. Perfect for study sessions!',
      'likes': '24',
      'comments': '8',
    },
    {
      'avatar': 'assets/images/avatar3.jpg',
      'name': 'Sam Wilson',
      'message':
          'Selling my calculus textbook from last semester - barely used. $30 or best offer. DM me if interested!',
      'time': '1 day ago',
      'likes': '8',
      'comments': '3',
    },
  ];
}