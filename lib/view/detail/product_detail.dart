import 'package:anonymous_foodie/constant/assets_path.dart';
import 'package:anonymous_foodie/constant/colors.dart';
import 'package:anonymous_foodie/constant/size.dart';
import 'package:anonymous_foodie/view/detail/rating_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../model/product_model.dart';
import '../../widgets/custom_button.dart';
import 'addon_area.dart';
import 'description_area.dart';


class ProductDetail extends ConsumerStatefulWidget {
  final ProductModel productModel;
  const ProductDetail({super.key, required this.productModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        width: 311.w,
        content: "Add to cart",
        bgColor: kPrimary,
        textColor: Colors.white,
        onTap: () {},
      ),
      backgroundColor: kPrimary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 10,
                      left: 20,
                      child: InkWell(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ))),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(kDiamond)),
                      ),
                      width: 345.w,
                      height: 345.h,
                      child: Center(
                        child: Image.network(
                          widget.productModel.image,
                          width: 280.w,
                          height: 212.h,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(70))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 36.w, right: 26.w, top: 31.h, bottom: 39.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //rating data
                      RatingArea(
                        rating: widget.productModel.rating.toString(),
                        price: '\$${widget.productModel.price}',
                      ),
                      getVerticalSpace(23),
                      DescriptionArea(
                        itemName: widget.productModel.name,
                        detail: widget.productModel.detail,
                        qty: "1",
                        onAdd: () {},
                        onRemove: () {},
                      ),
                      getVerticalSpace(15),
                      AddOnArea()
                     
                    ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
