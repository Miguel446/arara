import '../extensions.dart';
import '../models/shop.dart';

class ShopRepository {
  Future<List<Shop>> getShops({String? name, ShopType? type}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    List<Shop> shops = [...mockPhysicalShops, ...mockVirtualShops];

    if (name != null) {
      shops = shops
          .where((shop) => shop.name
              .toLowerCaseWithNoDiacritics()
              .contains(name.toLowerCaseWithNoDiacritics()))
          .toList();
    }

    if (type != null) {
      shops = shops.where((shop) => shop.type == type).toList();
    }

    return shops;
  }
}

const List<Shop> mockPhysicalShops = [
  Shop(
    name: 'Pinguinho Brechó Space',
    type: ShopType.physical,
    address: 'Rua Domingos Marreiros, 727 - Umarizal',
    openingHours: 'Seg. a Sex. - 08:00 às 18:00',
    averageRating: 4.8,
    numberOfRatings: 9,
    imageUrls: [
      'assets/brecho.png',
      'assets/brecho12.jpeg',
      'assets/brecho13.jpeg'
    ],
  ),
  Shop(
    name: 'Brechó de Elite',
    type: ShopType.physical,
    address: 'Tv. 14 de Março, 1304 - Umarizal',
    phone: '(91) 98337-5857',
    openingHours: 'Seg. a Sab. - 09:00 às 18:00',
    imageUrls: [
      'assets/brecho2.png',
      'assets/brecho22.jpeg',
      'assets/brecho23.jpeg'
    ],
  ),
  Shop(
    name: 'Brechó Stylus',
    type: ShopType.physical,
    address: 'Tv. Padre Eutíquio, 218 - Campina',
    openingHours: 'Seg. a Sab. - 08:00 às 18:00',
    phone: '(91) 3212-0413',
    averageRating: 3.7,
    numberOfRatings: 3,
    imageUrls: [
      'assets/brecho3.png',
      'assets/brecho32.jpeg',
      'assets/brecho33.jpeg'
    ],
  )
];

const List<Shop> mockVirtualShops = [
  Shop(
    name: 'Pinguinho Brechó Space',
    type: ShopType.virtual,
    instagram: 'pinguinho_brecho_space',
    openingHours: 'Seg. a Sex. - 08:00 às 18:00',
    imageUrls: [
      'assets/brecho.png',
      'assets/brecho12.jpeg',
      'assets/brecho13.jpeg'
    ],
  ),
  Shop(
    name: 'Brechó de Elite',
    type: ShopType.virtual,
    instagram: 'brecho_elite',
    phone: '(91) 98337-5857',
    openingHours: 'Seg. a Sab. - 09:00 às 18:00',
    averageRating: 5.0,
    numberOfRatings: 2,
    imageUrls: [
      'assets/brecho2.png',
      'assets/brecho22.jpeg',
      'assets/brecho23.jpeg'
    ],
  ),
  Shop(
    name: 'Brechó Stylus',
    type: ShopType.virtual,
    instagram: 'stylus_brecho',
    openingHours: 'Seg. a Sab. - 08:00 às 18:00',
    phone: '(91) 3212-0413',
    imageUrls: [
      'assets/brecho3.png',
      'assets/brecho32.jpeg',
      'assets/brecho33.jpeg'
    ],
  )
];
