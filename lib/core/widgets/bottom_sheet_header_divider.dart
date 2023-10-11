import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_font_weights.dart';
import '../../config/theme/app_color/app_color.dart';
import '../utils/utils.dart';

class BottomSheetHeaderDivider extends StatelessWidget {
  const BottomSheetHeaderDivider({Key? key, this.width, this.height, this.radius, this.color}) : super(key: key);
final double? width;
final double? height;
final double? radius;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width:width ?? AppSizes.size70.w,
          height:height?? AppSizes.size7,
          decoration: BoxDecoration(
              color:color?? AppColors.grey300,
              borderRadius:  BorderRadius.all(
                  Radius.circular(radius??AppSizes.radius10))),
        ),
      ],
    );
  }
}
