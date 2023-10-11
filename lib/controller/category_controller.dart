import 'package:anonymous_foodie/model/category_model.dart';
import 'package:anonymous_foodie/services/category_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, bool>((ref) {
  return CategoryController(
      ref: ref, services: ref.watch(categoryServiceProvider));
});

final categoryItemsProvider = StreamProvider(
    (ref) => ref.watch(categoryControllerProvider.notifier).getCategories());

class CategoryController extends StateNotifier<bool> {
  final CategoryServices _categoryServices;
  final Ref _ref;

  CategoryController({required CategoryServices services, required Ref ref})
      : _categoryServices = services,
        _ref = ref,
        super(false);

  Stream<List<CategoryModel>> getCategories() {
    return _categoryServices.getCategories();
  }
}
