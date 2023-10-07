import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../config/theme.dart';
import '../shared/providers/user_provider.dart';
import '../shared/repositories/auth_repository.dart';
import '../shared/utils/validators.dart';
import '../widgets/app_logo.dart';
import 'home_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const path = '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String email = '';
  String password = '';

  bool shouldRemember = true;

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void login() async {
    if (formKey.currentState?.validate() != true) {
      return setState(
          () => autovalidateMode = AutovalidateMode.onUserInteraction);
    }

    final user = await GetIt.I<AuthRepository>().login(email, password);

    final userNotifier = ref.read(userProvider.notifier);
    userNotifier.user = user;

    if (shouldRemember) {
      userNotifier.storeUser();
    }

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
            autovalidateMode: autovalidateMode,
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
                  validator: Validators.email(),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  onChanged: (value) => password = value,
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                  ),
                  obscureText: true,
                  validator: Validators.password(),
                  onFieldSubmitted: (_) => login(),
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
