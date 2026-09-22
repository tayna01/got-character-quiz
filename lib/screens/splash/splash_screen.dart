import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService.instance.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _LoadingView();
        }

        final user = snapshot.data;
        return user != null ? _LoggedInView(email: user.email!) : _LoggedOutView();
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_fire_department, size: 64, color: Color(0xFF8B0000)),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _LoggedInView extends StatelessWidget {
  const _LoggedInView({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GOT Character Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logado como', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(email, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => AuthService.instance.signOut(),
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoggedOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_fire_department, size: 64, color: Color(0xFF8B0000)),
            const SizedBox(height: 16),
            Text('Não autenticado', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('A tela de login será criada na próxima etapa'),
          ],
        ),
      ),
    );
  }
}