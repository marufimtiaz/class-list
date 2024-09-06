import 'package:classes/components/notice_card.dart';
import 'package:classes/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/date_divider.dart';
import '../components/providers.dart';

class NoticePage extends ConsumerWidget {
  final String className;
  const NoticePage({super.key, required this.className});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStudent = ref.watch(isStudentProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('$className Notifications'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClassDetailsPage(
                          className: className,
                        )),
              );
            },
            child: const Text(
              'Details',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // First Component: Row with Dividers and Text
          DividerRow(
            noticeDate: 'Monday, 23 sept',
          ),
          // Second Component: Card with Conditional Layout
          NoticeCard(
            titleText: 'Pronunciation Challenge',
            completionNum: 7,
            isDone: true, // Adjust the condition accordingly
            smallText: 'Created at 23 sept; 4:50 PM',
            chipText: 'Deadline Reached : 20 Sep; 6:00 PM',
            isActive: false,
          ),
          NoticeCard(
            titleText: 'Quiz for similar words',
            completionNum: 6,
            isDone: true, // Adjust the condition accordingly
            smallText: 'Created at 23 sept; 4:50 PM',
            chipText: 'Deadline : 25 Sep; 6:00 PM',
            isActive: true,
          ),
          DividerRow(
            noticeDate: 'Tuesday, 24 sept',
          ),
          // Second Component: Card with Conditional Layout
          NoticeCard(
            titleText: 'Learn Daily Vocabulary',
            completionNum: 5,
            isDone: false, // Adjust the condition accordingly
            smallText: 'Created at 23 sept; 4:50 PM',
            chipText: 'Deadline : 25 Sep; 6:00 PM',
            isActive: true,
          ),
        ],
      ),
      floatingActionButton: !isStudent
          ? FloatingActionButton.extended(
              onPressed: () {
                // Handle FAB action
              },
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}
