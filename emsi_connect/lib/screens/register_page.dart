import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nom complet', prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) return 'Nom obligatoire';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Adresse email', prefixIcon: Icon(Icons.email_outlined)),
                      validator: (value) {
                        final email = (value ?? '').trim();
                        if (email.isEmpty) return 'Email obligatoire';
                        if (!email.contains('@')) return 'Email invalide';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _showPassword = !_showPassword),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Mot de passe obligatoire';
                        if (value.length < 8) return 'Au moins 8 caractères';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _confirmController,
                      obscureText: !_showPassword,
                      decoration: const InputDecoration(labelText: 'Confirmer le mot de passe', prefixIcon: Icon(Icons.lock)),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Confirmez votre mot de passe';
                        if (value != _passwordController.text) return 'Les mots de passe ne correspondent pas';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Formulaire valide — compte non créé')),
                          );
                        }
                      },
                      child: const Text('Créer mon compte'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
