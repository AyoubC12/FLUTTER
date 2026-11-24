import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À propos')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('EMSI Connect', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Version pédagogique 1.0'),
              const SizedBox(height: 8),
              const Text('Application étudiante EMSI.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Retour')),
            ],
          ),
        ),
      ),
    );
  }
}
