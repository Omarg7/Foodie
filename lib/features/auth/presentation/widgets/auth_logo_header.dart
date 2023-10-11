import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/app_logo.dart';

class AuthLogoHeader extends StatelessWidget  {
  const AuthLogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Logo(radius: AppSizes.radius50.r),
      SizedBox(
        height: AppSizes.size10.h,
      ),
      Text(
        'Foodie',
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
    ],);
  }
}
