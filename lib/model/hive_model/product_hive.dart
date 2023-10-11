import 'package:hive/hive.dart';

part 'product_hive.g.dart';


@HiveType(typeId: 0)

class ProductHive{

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? detail;
  @HiveField(3)
  int? price;
  @HiveField(4)
  bool? isPopular;
  @HiveField(5) 
  String? categoryName;
  @HiveField(6) 
  int? quantity;

  ProductHive({required this.name,
  required this.image,
  required this.detail,
  required this.price,
  required this.isPopular,
  required this.categoryName,
  required this.quantity,
  });

}