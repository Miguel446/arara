import 'package:flutter/material.dart';

import '../widgets/account_menu_item.dart';
import '../widgets/account_menu_title.dart';
import '../widgets/app_logo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppLogo(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),

                // Meus dados
                AccountMenuTitle(title: 'Meus dados'),
                AccountMenuItem(
                    title: 'Perfil', iconData: Icons.account_circle),
                AccountMenuItem(title: 'Alterar senha', iconData: Icons.key),
                AccountMenuItem(title: 'Favoritos', iconData: Icons.favorite),
                SizedBox(
                  height: 20,
                ),

                // Configuracoes da conta
                AccountMenuTitle(title: 'Configurações da conta'),
                AccountMenuItem(
                    title: 'Acessibilidade',
                    iconData: Icons.settings_accessibility),
                AccountMenuItem(
                    title: 'Notificações', iconData: Icons.notifications),
                AccountMenuItem(
                    title: 'Encerrar conta', iconData: Icons.warning),
                SizedBox(
                  height: 20,
                ),

                // Suporte
                AccountMenuTitle(title: 'Suporte'),
                AccountMenuItem(
                    title: 'Tutorial rápido', iconData: Icons.support),
                AccountMenuItem(
                    title: 'Fale conosco', iconData: Icons.support_agent),
                AccountMenuItem(title: 'Sobre o Arara', iconData: Icons.info),
                SizedBox(
                  height: 24,
                ),

                // Sair da conta
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sair da conta',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ));
  }
}
