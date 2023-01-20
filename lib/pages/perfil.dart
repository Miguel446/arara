import 'package:arara/enums/color_enum.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  Widget itemOpcao(String nome, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icone,
                      color: ColorEnum.verde,
                      size: 22,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  nome,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: ColorEnum.roxo,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget itemTitulo(String titulo) {
    return Column(
      children: [
        Row(
          children: [
            Text(titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }

  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Image(
                      height: 80,
                      image: AssetImage('assets/icone.png'),
                    )),
                itemTitulo('Meus dados'),
                itemOpcao('Perfil', Icons.account_circle),
                itemOpcao('Alterar senha', Icons.key),
                itemOpcao('Favoritos', Icons.favorite),
                const SizedBox(
                  height: 20,
                ),
                itemTitulo('Configurações da conta'),
                itemOpcao('Acessibilidade', Icons.settings_accessibility),
                itemOpcao('Notificações', Icons.notifications),
                itemOpcao('Encerrar conta', Icons.warning),
                const SizedBox(
                  height: 20,
                ),
                itemTitulo('Suporte'),
                itemOpcao('Tutorial rápido', Icons.support),
                itemOpcao('Fale conosco', Icons.support_agent),
                itemOpcao('Sobre o Arara', Icons.info),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: const [
                    Text(
                      'Sair da conta',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
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
