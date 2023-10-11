import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/user_full_name_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/utils/utils.dart';
import 'username_field.dart';


class UserBasicInfo extends StatelessWidget {
  final FocusNode fullNameFocusNode;
  final FocusNode usernameFocusNode;
  final TextEditingController usernameController;
  final TextEditingController fullNameController;




  const UserBasicInfo({Key? key,required this.usernameFocusNode,required this.usernameController,required this.fullNameFocusNode, required this.fullNameController, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: AppSizes.size10.h,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingSize20,
            ),
            child: Text(
              AppLocalizations.of(context)!.translate(AppStrings.basicInfo)           ,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
        ],
      ),







      SizedBox(
        height: AppSizes.size10.h,
      ),
    ],);
  }
}
