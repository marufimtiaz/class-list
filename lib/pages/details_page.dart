import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For copying to clipboard
import '../database/students_list.dart'; // Import the students list

int totalStudents = students.length;

class ClassDetailsPage extends StatelessWidget {
  final String className;
  final String classCode = "GHHF776"; // Class code

  const ClassDetailsPage({super.key, required this.className});

  @override
  Widget build(BuildContext context) {
    // Get the theme and colors
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary;
    final onPrimaryColor =
        colorScheme.onPrimary; // Text and icon color on primary background

    return Scaffold(
      appBar: AppBar(
        title: Text('$className Class Details'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Class code: $classCode",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: onPrimaryColor,
                        ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: onPrimaryColor),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: classCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Class code copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student List",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Total ${students.length} students",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.separated(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(student["image"]!),
                    ),
                    title: Text(student["name"]!),
                    subtitle: Text(student["email"]!),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(); // Add a divider between the ListTiles
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
