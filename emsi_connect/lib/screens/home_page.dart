import 'package:flutter/material.dart';
import 'courses_page.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'multimedia_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMSI Connect'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () => debugPrint('Notifications consultées')),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: colors.primary),
              accountName: const Text('Étudiant EMSI'),
              accountEmail: const Text('etudiant@emsi.ma'),
              currentAccountPicture: CircleAvatar(backgroundColor: colors.onPrimary, child: Icon(Icons.person, color: colors.primary)),
            ),
            ListTile(leading: const Icon(Icons.home_outlined), title: const Text('Accueil'), selected: true, onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.menu_book_outlined), title: const Text('Mes cours'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursesPage())); }),
            ListTile(leading: const Icon(Icons.person_outline), title: const Text('Mon profil'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())); }),
            ListTile(leading: const Icon(Icons.perm_media), title: const Text('Espace multimédia'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const MultimediaPage())); }),
            ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('Paramètres'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())); }),
            ListTile(leading: const Icon(Icons.info_outline), title: const Text('À propos'), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())); }),
            const Divider(),
            ListTile(leading: const Icon(Icons.logout), title: const Text('Déconnexion'), onTap: () { Navigator.pop(context); Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false); }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/campus.jpg', height: 160, fit: BoxFit.cover),
              const SizedBox(height: 16),
              const Text('Bienvenue sur EMSI Connect', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Votre espace universitaire pour accéder à vos cours, votre planning et vos informations personnelles.', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth < 600 ? 2 : 3;
                  return GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _card(context, Icons.menu_book, 'Mes cours', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursesPage()))),
                      _card(context, Icons.calendar_month, 'Planning', null),
                      _card(context, Icons.person, 'Mon profil', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()))),
                      _card(context, Icons.task_alt, 'Mes tâches', null),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => debugPrint('Fonctionnalité bientôt disponible'), child: const Icon(Icons.add)),
    );
  }

  Widget _card(BuildContext context, IconData icon, String label, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blue.shade100)),
        child: Column(children: [Icon(icon), const SizedBox(height: 8), Text(label)]),
      ),
    );
  }
}
