import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_font_weights.dart';
import '../../config/localization/locale/app_localization.dart';
import '../utils/utils.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppSizes.size160,
      child: Container(color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                softWrap: true,
                text: TextSpan(
                  text: 'Discover the art of culinary with',
                  style: Theme.of(context).textTheme.displayLarge,
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Foodie',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: AppSizes.size10,
            ),
            CircleAvatar(
                foregroundImage: const AssetImage(
                  'assets/images/iconn.PNG',
                ),
                radius: AppSizes.size45.r),
            const SizedBox(
              width: AppSizes.size10,
            ),
          ],
        ),
      ),
    );
  }
}
