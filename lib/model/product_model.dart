import 'dart:convert';

class ProductModel {
  final String name;
  final String image;
  final String detail;
  final int price;
  final bool isPopular;
  final String categoryName;
  final String rating;
  final bool cheese;
  final bool tomato;
  final bool masala;
  ProductModel({
    required this.name,
    required this.image,
    required this.detail,
    required this.price,
    required this.isPopular,
    required this.categoryName,
    required this.rating,
    required this.cheese,
    required this.tomato,
    required this.masala,
  });

  ProductModel copyWith({
    String? name,
    String? image,
    String? detail,
    int? price,
    bool? isPopular,
    String? categoryName,
    String? rating,
    bool? cheese,
    bool? tomato,
    bool? masala,
  }) {
    return ProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      detail: detail ?? this.detail,
      price: price ?? this.price,
      isPopular: isPopular ?? this.isPopular,
      categoryName: categoryName ?? this.categoryName,
      rating: rating ?? this.rating,
      cheese: cheese ?? this.cheese,
      tomato: tomato ?? this.tomato,
      masala: masala ?? this.masala,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'detail': detail,
      'price': price,
      'isPopular': isPopular,
      'categoryName': categoryName,
      'rating': rating,
      'cheese': cheese,
      'tomato': tomato,
      'masala': masala,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      detail: map['detail'] ?? '',
      price: map['price']?.toInt() ?? 0,
      isPopular: map['isPopular'] ?? false,
      categoryName: map['categoryName'] ?? '',
      rating: map['rating'] ?? '',
      cheese: map['cheese'] ?? false,
      tomato: map['tomato'] ?? false,
      masala: map['masala'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $name, image: $image, detail: $detail, price: $price, isPopular: $isPopular, categoryName: $categoryName, rating: $rating, cheese: $cheese, tomato: $tomato, masala: $masala)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.name == name &&
      other.image == image &&
      other.detail == detail &&
      other.price == price &&
      other.isPopular == isPopular &&
      other.categoryName == categoryName &&
      other.rating == rating &&
      other.cheese == cheese &&
      other.tomato == tomato &&
      other.masala == masala;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      detail.hashCode ^
      price.hashCode ^
      isPopular.hashCode ^
      categoryName.hashCode ^
      rating.hashCode ^
      cheese.hashCode ^
      tomato.hashCode ^
      masala.hashCode;
  }
}
