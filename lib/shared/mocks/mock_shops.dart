import '../extensions.dart';
import '../models/shop.dart';
import 'mock_reviews.dart';

final List<Shop> mockPhysicalShops = [
  Shop(
    id: '1',
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
    perks: ShopPerk.values,
    reviews: mockReviews.getRandomSubset(),
  ),
  const Shop(
    id: '2',
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
    perks: [ShopPerk.airConditioning],
  ),
  Shop(
    id: '3',
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
    perks: ShopPerk.values,
    reviews: mockReviews.getRandomSubset(),
  )
];

final List<Shop> mockVirtualShops = [
  const Shop(
    id: '4',
    name: 'Pinguinho Brechó Space',
    type: ShopType.virtual,
    instagram: 'pinguinho_brecho_space',
    openingHours: 'Seg. a Sex. - 08:00 às 18:00',
    imageUrls: [
      'assets/brecho.png',
      'assets/brecho12.jpeg',
      'assets/brecho13.jpeg'
    ],
    perks: [ShopPerk.newClothes],
  ),
  Shop(
    id: '5',
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
    reviews: mockReviews.getRandomSubset(),
  ),
  Shop(
    id: '6',
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
    perks: [ShopPerk.newClothes],
    reviews: mockReviews.getRandomSubset(),
  )
];