import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/providers.dart';
import 'login_page.dart';

class SelectorPage extends ConsumerWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void updateAndNavigate(bool student) {
      ref.read(isStudentProvider.notifier).state = student;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am a',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(
                  onPressed: () => updateAndNavigate(true),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.school),
                        Text('Student'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FilledButton.tonal(
                  onPressed: () => updateAndNavigate(false),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.work),
                        Text('Teacher'),
                      ],
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
