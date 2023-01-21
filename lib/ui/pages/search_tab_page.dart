import 'package:arara/ui/widgets/search_list_item_card.dart';
import 'package:flutter/material.dart';

class SearchTabPage extends StatelessWidget {
  final bool isOnline;

  const SearchTabPage(this.isOnline, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        ...cards(isOnline),
      ],
    );
  }

  List<Widget> cards(bool isOnline) {
    return isOnline
        ? [
            SearchListItemCard.virtual(
              imgPathList: const [
                'assets/brecho.png',
                'assets/brecho12.jpeg',
                'assets/brecho13.jpeg'
              ],
              title: 'Pinguinho Brechó Space',
              instagram: '@brecho_pinguinho',
              phone: '(91) 98337-5857',
              paymentMethods: 'Formas de pagamento: pix, débito e crédito',
            ),
            SearchListItemCard.virtual(
              imgPathList: const [
                'assets/brecho2.png',
                'assets/brecho22.jpeg',
                'assets/brecho23.jpeg'
              ],
              title: 'Brechó de Elite',
              instagram: '@brecho_elite',
              phone: '(91) 98337-5857',
              paymentMethods: 'Formas de pagamento: pix e dinheiro',
            ),
            SearchListItemCard.virtual(
              imgPathList: const [
                'assets/brecho3.png',
                'assets/brecho32.jpeg',
                'assets/brecho33.jpeg'
              ],
              title: 'Brechó Stylus',
              instagram: '@stylus_brecho',
              phone: '(91) 3212-0413',
              paymentMethods: 'Formas de pagamento: pix, débito e crédito',
            ),
          ]
        : [
            SearchListItemCard.physical(
              imgPathList: const [
                'assets/brecho.png',
                'assets/brecho12.jpeg',
                'assets/brecho13.jpeg'
              ],
              title: 'Pinguinho Brechó Space',
              address: 'Rua Domingos Marreiros, 727 - Umarizal',
              horary: 'Seg. a Sex. - 08:00 às 18:00',
            ),
            SearchListItemCard.physical(
              imgPathList: const [
                'assets/brecho2.png',
                'assets/brecho22.jpeg',
                'assets/brecho23.jpeg'
              ],
              title: 'Brechó de Elite',
              address: 'Tv. 14 de Março, 1304 - Umarizal',
              horary: 'Seg. a Sab. - 09:00 às 18:00',
              phone: '(91) 98337-5857',
            ),
            SearchListItemCard.physical(
              imgPathList: const [
                'assets/brecho3.png',
                'assets/brecho32.jpeg',
                'assets/brecho33.jpeg'
              ],
              title: 'Brechó Stylus',
              address: 'Tv. Padre Eutíquio, 218 - Campina',
              horary: 'Seg. a Sab. - 08:00 às 18:00',
              phone: '(91) 3212-0413',
            ),
          ];
  }
}
