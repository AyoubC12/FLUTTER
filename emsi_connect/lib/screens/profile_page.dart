import 'package:flutter/material.dart';
import 'student_details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Sara El Amrani';

  void _modifierNom() {
    final controller = TextEditingController(text: _name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modifier le nom'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Nom'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () {
              setState(() => _name = controller.text.trim().isEmpty ? _name : controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Valider'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon profil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/profil.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Informations personnelles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _info(Icons.person, 'Nom', _name),
              _info(Icons.school, 'Filière', 'Informatique'),
              _info(Icons.grade, 'Niveau', 'S5'),
              _info(Icons.email, 'Email', 'sara@example.com'),
              _info(Icons.calendar_today, 'Année universitaire', '2026–2027'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: _modifierNom, child: const Text('Modifier le nom'))),
                  const SizedBox(width: 8),
                  Expanded(child: ElevatedButton(onPressed: () => debugPrint('Contacter'), child: const Text('Contacter'))),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsPage(
                        studentName: _name,
                        program: 'Intelligence Artificielle',
                      ),
                    ),
                  );
                },
                child: const Text('Voir les détails'),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage('assets/images/profil.jpg')),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Informatique - S5'),
                        const Text('N° 2026001'),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.school),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Text('$label : $value'),
        ],
      ),
    );
  }
}
