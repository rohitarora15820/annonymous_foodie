import 'package:anonymous_foodie/model/product_model.dart';
import 'package:anonymous_foodie/services/product_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productControllerProvider =
    StateNotifierProvider<ProductController, bool>((ref) {
  return ProductController(
      productServices: ref.watch(productServiceProvider), ref: ref);
});

final getproductsByCategory = StreamProvider.autoDispose
    .family<List<ProductModel>, String>((ref, data) =>
        ref.watch(productControllerProvider.notifier).getProductsById(data));

        final getproductsByName = StreamProvider.autoDispose
    .family<ProductModel, String>((ref, data) =>
        ref.watch(productControllerProvider.notifier).getProductsByName(data));


class ProductController extends StateNotifier<bool> {
  final ProductServices _productServices;
  final Ref _ref;

  ProductController({
    required ProductServices productServices,
    required Ref ref,
  })  : _productServices = productServices,
        _ref = ref,
        super(false);

 

  Stream<List<ProductModel>> getProductsById(String categoryName) {
    return _productServices.getProductByCategory(categoryName);
  }

    Stream<ProductModel> getProductsByName(String categoryName) {
    return _productServices.getProductByName(categoryName);
  }
}
