import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/widgets/custom_app_bar.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/profile_tile.dart';
import '../../../auth/presentation/screens/edit_profile_screen.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  late UserEntity user;


  @override
  void initState() {

    user=AuthCubit.get(context).userData;



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(data: Theme.of(context).copyWith(dividerColor: AppColors.grey300),
      child: Scaffold(persistentFooterButtons: [ ],
          appBar: CustomAppBar(customActions: [    TextButton(onPressed: (){
          }, child: Text(AppLocalizations.of(context)!.translate(AppStrings.editInfo),style: Theme.of(context).textTheme.headline5,)),],
            customElevation: AppSizes.size0,

            customTitle:
            AppLocalizations.of(context)!.translate(AppStrings.profileText),

           bottomHeight: kToolbarHeight,
            context: context,        ),
        body:SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,


            child:    BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                user=AuthCubit.get(context).userData;
                return Padding(
                  padding:const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSize14,
                      vertical: AppSizes.paddingSize10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingSize4,horizontal: AppSizes.paddingSize8),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate(AppStrings.userInfo),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall,
                            ),

                          ],
                        ),
                      ),

                      ProfileTile(
                          title:AppStrings.username,
                          leadingIcon: Icons.person,

                          iconColor: Theme.of(context)
                              .colorScheme
                              .background,

                          subtitle: (user.name) ?? ''),
                      ProfileTile(
                          title:AppStrings.username,
                          leadingIcon: Icons.person_outlined,

                          iconColor: Theme.of(context)
                              .colorScheme
                              .background,

                          subtitle:user.username,),
                      ProfileTile(
                          title:AppStrings.countryFood ,
                          leadingIcon: Icons.flag,

                          iconColor: Theme.of(context)
                              .colorScheme
                              .background,

                          subtitle: (user.area)),
                      ProfileTile(
                          title:'' ,
                          leadingIcon: Icons.egg,

                          iconColor: Theme.of(context)
                              .colorScheme
                              .background,

                          subtitle: ''),

                      const SizedBox(height: AppSizes.size20,),


                    ],
                  ),
                );
              },
            ),
          ),
        )),
    );

  }
}
