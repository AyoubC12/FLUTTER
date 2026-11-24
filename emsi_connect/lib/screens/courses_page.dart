import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {'nom': 'Développement Multi-Plateforme', 'enseignant': 'Mme Aouraghe', 'heures': 32, 'icon': Icons.menu_book},
      {'nom': 'Bases de données avancées', 'enseignant': 'M. Exemple', 'heures': 24, 'icon': Icons.storage},
      {'nom': 'Réseaux informatiques', 'enseignant': 'M. Réseau', 'heures': 28, 'icon': Icons.network_check},
      {'nom': 'Intelligence artificielle', 'enseignant': 'Mme IA', 'heures': 30, 'icon': Icons.psychology},
      {'nom': 'Cybersécurité', 'enseignant': 'M. Secu', 'heures': 26, 'icon': Icons.security},
      {'nom': 'Gestion de projet', 'enseignant': 'M. Gestion', 'heures': 20, 'icon': Icons.computer},
      {'nom': 'Cloud Computing', 'enseignant': 'M. Cloud', 'heures': 22, 'icon': Icons.cloud},
      {'nom': 'Mobile Avancé', 'enseignant': 'Mme Mobile', 'heures': 34, 'icon': Icons.phone_android},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mes cours')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Modules du semestre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final m = modules[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(m['nom'] as String),
                    subtitle: Text('${m['enseignant']} • ${m['heures']}h'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Module sélectionné : ${m['nom']}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
