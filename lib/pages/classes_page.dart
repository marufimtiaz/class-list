import 'package:classes/pages/details_page.dart';
import 'package:classes/pages/notification_page.dart';
import 'package:flutter/material.dart';

class ClassesList extends StatelessWidget {
  const ClassesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Card
            classCard(
              context,
              titleText: 'French',
              leftSubText: '$totalStudents students',
              rightSubText: '3 notifications',
              baseColor: Colors.blue, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NoticePage(
                            className: 'French',
                          )),
                );
              },
            ),
            const SizedBox(height: 16),
            // Second Card
            classCard(
              context,
              titleText: 'German',
              leftSubText: '10 students',
              rightSubText: '3 notifications',
              baseColor: Colors.green, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NoticePage(
                            className: 'German',
                          )),
                );
              },
            ),
            // You can add more cards here as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle FAB action
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget classCard(
    BuildContext context, {
    required String titleText,
    required String leftSubText,
    required String rightSubText,
    required MaterialColor baseColor,
    required VoidCallback onPressed,
  }) {
    final backgroundColor = baseColor.shade50;
    final titleColor = baseColor.shade800;

    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor, // Set the background color
        padding: EdgeInsets.zero, // Remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      leftSubText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      rightSubText,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
