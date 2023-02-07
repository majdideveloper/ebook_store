import 'package:flutter/material.dart';

import '../models/book.dart';

class Constants {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 28,
  );
  static TextStyle titleStyleBold = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static TextStyle normalStyle = const TextStyle(
    fontSize: 22,
  );
  static TextStyle normalStyleBold = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle smallStyle = const TextStyle(
    fontSize: 18,
  );
  static TextStyle smallStyleBold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static SizedBox smallPaddingHor = const SizedBox(
    height: 10,
  );
  static SizedBox meduimPaddingHor = const SizedBox(
    height: 25,
  );
  static SizedBox largePaddingHor = const SizedBox(
    height: 50,
  );
  static SizedBox smallPaddingVer = const SizedBox(
    width: 10,
  );
  static SizedBox meduimPaddingVer = const SizedBox(
    width: 25,
  );
  static SizedBox largePaddingVer = const SizedBox(
    width: 50,
  );

  static List<Book> listBook = [
    Book(
      title: 'zéro limite',
      auther: 'Joe Vitale',
      category: 'Bien-être & vie pratique',
      urlImage:
          'https://images-na.ssl-images-amazon.com/images/I/51kz1hJ5f1L._SX210_.jpg',
      price: 27,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: 'APPRENDRE A AIMER LA PAIX COMMENCE AVEC SOI-MEME',
      auther: 'Mama Dalila & Nedra Ghariani',
      category: 'Bien-être & vie pratique',
      urlImage: 'https://edito.com.tn/img/p/1/2/9/4/1294-large_default.jpg',
      price: 19,
      onSale: false,
    ),
    Book(
      title: "L'art subtil de s'en foutre",
      auther: 'Mark Manson',
      category: 'Bien-être & vie pratique',
      urlImage: 'https://images.epagine.fr/595/9782212567595_1_75.jpg',
      price: 80,
      onSale: false,
    ),
    Book(
      title: "L'art du calme intérieur",
      auther: 'Eckhart Tolle',
      category: 'Bien-être & vie pratique',
      urlImage: 'https://images.epagine.fr/754/9782290036754_1_75.jpg',
      price: 26,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "L'art du calme intérieur",
      auther: 'Eckhart Tolle',
      category: 'Bien-être & vie pratique',
      urlImage: 'https://images.epagine.fr/754/9782290036754_1_75.jpg',
      price: 26,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "50 méditations pour mieux s'aimer",
      auther: 'Fabrice Midal',
      category: 'Bien-être & vie pratique',
      urlImage: 'https://images.epagine.fr/317/9782266322317_1_75.jpg',
      price: 28,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "La Puissance de l'acceptation",
      auther: 'Lise Bourbeau',
      category: 'Bien-être & vie pratique',
      urlImage:
          'https://www.babelio.com/couv/CVT_La-puissance-de-lacceptation_7335.jpg',
      price: 30,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "La confiance en soi - Une philosophie",
      auther: 'Charles Pépin',
      category: 'Sciences humaines et sociales',
      urlImage: 'https://images.epagine.fr/661/9782370731661_1_75.jpg',
      price: 28,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "Ces gestes qui vous trahissent",
      auther: 'Joseph Messinger',
      category: 'Sciences humaines et sociales',
      urlImage: 'https://media.s-bol.com/kr2Zn7k9JvYx/1200x1200.jpg',
      price: 35,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Capitalisme et liberté",
      auther: 'Milton Friedman',
      category: 'Sciences humaines et sociales',
      urlImage: 'https://m.media-amazon.com/images/I/51hhD9TwcXL.jpg',
      price: 36,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Retour au meilleur des mondes",
      auther: 'Aldous Huxley',
      category: 'Sciences humaines et sociales',
      urlImage: 'https://m.media-amazon.com/images/I/611mIYYO8cL.jpg',
      price: 20,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Jerba Les Jerbiens des Commerçant Séculaire",
      auther: 'Kamel Tmarzizet',
      category: 'Sciences humaines et sociales',
      urlImage:
          'https://img.uscri.be/pth/80b59c8059c7160709d682ce21acd613bec131ae',
      price: 16,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Je voulais vous dire …",
      auther: 'Raafika Inoubli',
      category: 'Romans',
      urlImage:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1614065299i/57182981.jpg',
      price: 20,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Les vertueux",
      auther: 'Yasmina Khadra',
      category: 'Romans',
      urlImage: 'https://m.media-amazon.com/images/I/415YgcD9iXL._SX195_.jpg',
      price: 35,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Sur la route de Madison",
      auther: 'Robert James Waller',
      category: 'Romans',
      urlImage: 'https://images.epagine.fr/594/9782266222594_1_75.jpg',
      price: 22,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "Le pouvoir des habitudes",
      auther: 'Charles Duhigg',
      category: 'Romans',
      urlImage: 'https://m.media-amazon.com/images/I/61Y+wPkS63L.jpg',
      price: 29,
      onSale: true,
      priceOnSale: 20,
    ),
    Book(
      title: "Après toi",
      auther: 'Jojo Moyes',
      category: 'Romans',
      urlImage: 'https://images.epagine.fr/748/9782381221748_1_75.jpg',
      price: 32,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title: "Magie Et Sacre De L'Odeur",
      auther: 'Nacef Nakbi',
      category: 'Arts & beaux livres',
      urlImage:
          'https://nirvanaedition.com/wp-content/uploads/2020/09/magie-et-sacre.jpg',
      price: 45,
      onSale: false,
      priceOnSale: 20,
    ),
    Book(
      title:
          "Djerba, L'île enchantée - Son histoire, ses rites et ses mosquées",
      auther: 'Hichem Yacoub',
      category: 'Arts & beaux livres',
      urlImage:
          'https://m.media-amazon.com/images/I/51Nd2gcmsJL._SY472_BO1,204,203,200_.jpg',
      price: 65,
      onSale: false,
      priceOnSale: 20,
    ),
  ];
}
