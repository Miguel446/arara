import 'package:flutter/material.dart';

import '../widgets/account_menu_item.dart';
import '../widgets/account_menu_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Logo
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Image(
                      height: 80,
                      image: AssetImage('assets/icone.png'),
                    )),

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
                const AccountMenuItem(
                    title: 'Acessibilidade',
                    iconData: Icons.settings_accessibility),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sair da conta',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ));
  }
}
