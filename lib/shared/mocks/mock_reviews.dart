import '../extensions.dart';
import '../models/review.dart';
import 'mock_users.dart';

final _imageUrls = [
  'https://images.unsplash.com/photo-1540221652346-e5dd6b50f3e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2969&q=80',
  'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80',
  'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2970&q=80',
  'https://images.unsplash.com/photo-1542060748-10c28b62716f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2970&q=80',
  'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2448&q=80',
];

final mockReviews = [
  Review(
    id: '1',
    user: mockUsers[0],
    stars: 5,
    text:
        "Adorei o brechó! Encontrei uma jaqueta vintage incrível a um preço super acessível. A equipe foi muito simpática e prestativa, e o ambiente era acolhedor. Com certeza vou voltar para mais achados únicos!",
    createdAt: DateTime(2023, 8, 1),
    imageUrls: _imageUrls.getRandomSubset(),
  ),
  Review(
    id: '2',
    user: mockUsers[1],
    stars: 2,
    text:
        "Minha experiência no brechó foi decepcionante. As roupas estavam desorganizadas, e muitas delas pareciam desgastadas demais para serem usadas. Além disso, os preços eram altos para a qualidade das peças. Não recomendo.",
    createdAt: DateTime(2023, 8, 5),
    imageUrls: _imageUrls.getRandomSubset(),
  ),
  Review(
    id: '3',
    user: mockUsers[2],
    stars: 5,
    text:
        "O brechó é um tesouro escondido! Encontrei uma saia vintage linda que mal posso esperar para usar. Eles têm uma seleção incrível de roupas únicas e acessíveis. Definitivamente, um lugar para voltar.",
    createdAt: DateTime(2023, 8, 10),
    imageUrls: _imageUrls.getRandomSubset(),
  ),
  Review(
    id: '4',
    user: mockUsers[3],
    stars: 2,
    text:
        "Fiquei desapontado com o brechó. As roupas estavam bagunçadas, e a qualidade deixou muito a desejar. Além disso, o atendimento foi indiferente. Não acho que voltarei.",
    createdAt: DateTime(2023, 8, 15),
    imageUrls: _imageUrls.getRandomSubset(),
  ),
  Review(
    id: '5',
    user: mockUsers[4],
    stars: 5,
    text:
        "Visitei o brechó hoje e tive uma experiência maravilhosa! Encontrei um vestido vintage deslumbrante e a um preço incrível. A equipe foi atenciosa e amigável. Mal posso esperar para mostrar minha nova aquisição!",
    createdAt: DateTime(2023, 8, 20),
  ),
  Review(
    id: '6',
    user: mockUsers[0],
    stars: 5,
    text:
        'O brechó que visitei recentemente é verdadeiramente um tesouro escondido. A variedade de roupas vintage e peças únicas é impressionante. Encontrei desde roupas elegantes dos anos 80 até acessórios encantadores dos anos 60. A qualidade das peças era surpreendentemente boa, e os preços eram muito acessíveis. Além disso, a equipe do brechó foi extremamente prestativa e amigável, tornando a experiência de compra ainda mais agradável. Com certeza vou voltar em busca de mais achados incríveis!',
    createdAt: DateTime(2023, 3, 15),
    imageUrls: _imageUrls.getRandomSubset(),
  ),
];
