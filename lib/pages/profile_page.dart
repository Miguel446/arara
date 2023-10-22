import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../config/theme.dart';
import '../providers/user_provider.dart';
import '../widgets/account_menu_item.dart';
import '../widgets/account_menu_title.dart';
import '../widgets/app_logo.dart';
import '../widgets/buttons/button.dart';
import '../widgets/dialogs/dialog.dart';
import 'login_page.dart';
import 'settings/accessibility_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              const AppLogo(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),

              // Meus dados
              const AccountMenuTitle(title: 'Meus dados'),
              const AccountMenuItem(
                  title: 'Perfil', iconData: Icons.account_circle),
              const AccountMenuItem(
                  title: 'Alterar senha', iconData: Icons.key),
              const AccountMenuItem(
                  title: 'Favoritos', iconData: Icons.favorite),
              const SizedBox(
                height: 20,
              ),

              // Configuracoes da conta
              const AccountMenuTitle(title: 'Configurações da conta'),
              AccountMenuItem(
                title: 'Acessibilidade',
                iconData: Icons.settings_accessibility,
                onPressed: () => context.push(AccessibilityPage.path),
              ),
              const AccountMenuItem(
                  title: 'Notificações', iconData: Icons.notifications),
              const AccountMenuItem(
                  title: 'Encerrar conta', iconData: Icons.warning),
              const SizedBox(
                height: 20,
              ),

              // Suporte
              const AccountMenuTitle(title: 'Suporte'),
              const AccountMenuItem(
                  title: 'Tutorial rápido', iconData: Icons.support),
              const AccountMenuItem(
                  title: 'Fale conosco', iconData: Icons.support_agent),
              const AccountMenuItem(
                  title: 'Sobre o Arara', iconData: Icons.info),
              const SizedBox(
                height: 24,
              ),

              // Sair da conta
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: AppDialog.choice(
                    context: context,
                    title: 'Sair da conta',
                    text: 'Deseja realmente sair da sua conta?',
                    rightButtonText: 'Sim',
                    onRightButtonPressed: () {
                      context.pop();
                      context.go(LoginPage.path);
                      ref.read(userProvider.notifier).unsetUser();
                    },
                    rightButtonType: ButtonType.outlined,
                    leftButtonText: 'Não',
                    onLeftButtonPressed: context.pop,
                    leftButtonType: ButtonType.elevated,
                  ).show,
                  child: const Text('Sair da conta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
