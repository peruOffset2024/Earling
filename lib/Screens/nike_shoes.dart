class NikeShoes {
  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.modelNumber,
    required this.color,
  });
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
}

final shoes = <NikeShoes>[
  NikeShoes(
      model: 'AIR MAX 90 EZ BLACK',
      oldPrice: 349,
      currentPrice: 299,
      images: [
        'assets/nike.PNG',
        'assets/nike.PNG',
      ],
      modelNumber: 80,
      color: 0xFFF6F6F6),
  
];
