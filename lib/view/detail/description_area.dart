import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/colors.dart';
import '../../constant/size.dart';

class DescriptionArea extends ConsumerStatefulWidget {
  final String itemName;
  final String qty;
  final String detail;
  final Function()? onRemove;
  final Function()? onAdd;
  const DescriptionArea({super.key,
  required this.itemName,
  required this.qty,
  required this.detail,
  required this.onRemove,
  required this.onAdd
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DescriptionAreaState();
}

class _DescriptionAreaState extends ConsumerState<DescriptionArea> {

  @override
  Widget build(BuildContext context) {
    return     Column(
      children: [
        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           widget.itemName,
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap:widget.onRemove,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    color: kPrimary,
                                  ),
                                ),
                              ),
                              Text(widget.qty),
                              InkWell(
                                  onTap:widget.onAdd,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: kPrimary,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
      
          getVerticalSpace(12),
              Container(
                width: 377.w,
                child: Text(widget.detail,
                
                style: TextStyle(
                  color:const  Color(0xff595959),
                  fontSize: 18.sp
                ),),
              )
      ],
    );
  }
}