import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';


class GeneralScreenHeaderCard extends StatefulWidget {
  const GeneralScreenHeaderCard({Key? key}) : super(key: key);

  @override
  State<GeneralScreenHeaderCard> createState() =>
      _GeneralScreenHeaderCardState();
}

class _GeneralScreenHeaderCardState extends State<GeneralScreenHeaderCard> {
  late UserEntity user;
  @override
  void initState() {
    user = AuthCubit.get(context).userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Stack(clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.marginSize8, vertical: AppSizes.marginSize8),
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.paddingSize14),
          decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              border: Border.all(color: AppColors.grey300),
              borderRadius: BorderRadius.circular(AppSizes.radius10)),
          child: IntrinsicHeight(
            child: BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    user = AuthCubit.get(context).userData;
    return Row(
              children: [
                /*Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  width: AppSizes.size100,
                  height: AppSizes.size100,
                  child: Center(
                      child: StoreLogo(
                          storeLogoUrl: user.storeLogoUrl ?? '',
                          storeName: user.storeName ?? '')),
                ),*/
             /*   const VerticalDivider(),
                const SizedBox(width: AppSizes.size20,),*/
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    Text(
                     '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            );
  },
),
          ),
        ),
 /*       Positioned(
            left: AppSizes.size14,
            top: AppSizes.size14,right: AppSizes.size14,
            child: Icon(
              user.long.isNotEmpty && user.lat.isNotEmpty
                  ? Icons.check_circle
                  : Icons.unpublished,
              color: user.long.isNotEmpty && user.lat.isNotEmpty
                  ? AppColors.whatsIconColor
                  : AppColors.mailIconColor,
            ))*/
      ],
    );
  }
}
