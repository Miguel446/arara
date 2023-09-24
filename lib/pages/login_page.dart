import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../config/theme.dart';
import '../shared/repositories/auth_repository.dart';
import '../widgets/app_logo.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const path = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  bool shouldRemember = true;

  final formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() != true) return;

    await GetIt.I<AuthRepository>().login(email, password);

    if (!mounted) return;
    context.replace(HomePage.path);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppTheme.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const AppLogo(height: 140),
                Text('Já possui uma conta?', style: textTheme.headlineMedium),
                const SizedBox(height: 40),
                TextFormField(
                  onChanged: (value) => email = value,
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  onChanged: (value) => password = value,
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => shouldRemember = !shouldRemember),
                      child: Row(
                        children: [
                          Checkbox(
                            value: shouldRemember,
                            onChanged: (value) =>
                                setState(() => shouldRemember = value!),
                          ),
                          const Text('Lembrar sempre'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
