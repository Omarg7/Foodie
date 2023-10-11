import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_sizes.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.radius}) : super(key:  key);
final double? radius;
  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fitHeight,
      child: CircleAvatar(
          foregroundImage: const AssetImage(
            'assets/images/iconn.PNG',
          ),
          radius:radius?? AppSizes.size45.r),
    );
  }
}
