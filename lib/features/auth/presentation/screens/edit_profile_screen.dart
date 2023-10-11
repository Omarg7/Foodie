import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/core/widgets/loading_button.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/user_preferences_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';
import 'package:cooking_recipes/core/utils/app_sizes.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entity/user_entity.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/user_preferences/user_preferences_cubit.dart';
import '../widgets/auth_logo_header.dart';
import '../widgets/user_full_name_field.dart';
import '../widgets/username_field.dart';
import 'login_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key, required this.newUser}) : super(key: key);
  final bool newUser;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late var formKey;
  late final FocusNode fullNameFocusNode;
  late final FocusNode usernameFocusNode;
  late final FocusScopeNode _node;

  late final TextEditingController fullNameController;
  late final TextEditingController usernameController;

  late UserEntity user;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    user = AuthCubit.get(context).userData;

    fullNameFocusNode = FocusNode();
    usernameFocusNode = FocusNode();

    _node = FocusScopeNode();

    fullNameController = TextEditingController(text: user.name);
    usernameController = TextEditingController(text: user.username);
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    fullNameFocusNode.dispose();
    _node.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: CustomAppBar(context: context), preferredSize:  Size(double.maxFinite, AppSizes.size40)),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppSizes.paddingSize8),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Form(
                      key: formKey,
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          const AuthLogoHeader(),
                          SizedBox(
                            height: AppSizes.size14.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingSize8),
                            child: Text(
                                AppLocalizations.of(context)!.translate(
                                    AppStrings.updateAccountInfoHeader),
                                style: Theme.of(context).textTheme.displayMedium),
                          ),
                          SizedBox(
                            height: AppSizes.size14.h,
                          ),
                          FullNameField(
                              onEditComplete: () {
                                fullNameFocusNode.unfocus();
                                usernameFocusNode.requestFocus();
                              },
                              fullNameFocusNode: fullNameFocusNode,
                              fullNameController: fullNameController),
                          UsernameField(
                              fromLogin: false,
                              fromUpdate: true,
                              onEditComplete: () {
                                usernameFocusNode.unfocus();
                              },
                              userNameController: usernameController,
                              userNameFocusNode: usernameFocusNode),
                          const UserPreferencesFields(fromUpdate: true),
                          const SizedBox(
                            height: AppSizes.size20,
                          ),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              state is AuthUserInfoUpdateSuccessState
                                  ? {
                                      Fluttertoast.showToast(
                                          msg:
                                              'Account info updated successfully!'),
                                      Navigator.pop(context),
                                    }
                                  : {
                                      Fluttertoast.showToast(
                                          msg: 'Error updating account info!'),
                                    };
                            },
                            listenWhen: (previous, current) {
                              if (previous is AuthLoadingState &&
                                  current is AuthUserInfoUpdateSuccessState) {
                                return true;
                              } else if (previous is AuthLoadingState &&
                                  current is AuthErrorState) {
                                return true;
                              } else {
                                return false;
                              }
                            },
                            builder: (context, state) {
                              return ConditionalBuilder(
                                builder: (context) => const LoadingButton(),
                                condition: state is AuthLoadingState && state.loading==AuthLoading.updatingInfo,
                                fallback: (context) => CustomButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      AuthCubit.get(context).editProfileInfo(
                                        userName: usernameController.text,
                                        fullName: fullNameController.text,
                                        recommendedCountry:
                                        UserPreferencesCubit.get(context)
                                            .area,
                                        favFoodType:
                                        UserPreferencesCubit.get(context)
                                            .recommendation,
                                      );
                                    }
                                  },
                                  title: AppStrings.saveInfo,
                                ) ,
                              );
                            },
                          ),
                        ],
                      )),


                ],
              ),
            ),
          ),
        ));
  }
}
