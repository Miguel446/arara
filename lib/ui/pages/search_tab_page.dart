import 'package:arara/ui/widgets/search_list_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/models/shop.dart';
import '../../shared/repositories/shop_repository.dart';

class SearchTabPage extends StatefulWidget {
  final ShopType shopType;

  const SearchTabPage(this.shopType, {super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage> {
  List<Shop> shops = [];
  bool isLoading = false;

  Future<void> getShops() async {
    setState(() => isLoading = true);

    try {
      shops = await GetIt.I<ShopRepository>().getShops();
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        ...cards(widget.shopType == ShopType.virtual),
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
