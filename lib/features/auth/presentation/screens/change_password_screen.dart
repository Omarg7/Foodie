import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/core/widgets/loading_button.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/user_full_name_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/auth/auth_cubit.dart';
import '../widgets/auth_confirm_password_field.dart';
import '../widgets/auth_logo_header.dart';
import '../widgets/auth_password_field.dart';
import '../../../../core/widgets/form_header.dart';

class ChangePasswordScreen extends StatefulWidget {
 const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late  TextEditingController usernameController ;
  late  TextEditingController fullNameController;
  late  TextEditingController confirmPasswordController ;
  late  TextEditingController passwordController ;
  late FocusNode usernameFocusNode;
  late  FocusNode fullNameFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late  FocusNode passwordFocusNode;
 @override
 void initState() {
    usernameController = TextEditingController();
    fullNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    usernameFocusNode=FocusNode();
    fullNameFocusNode=FocusNode();
    confirmPasswordFocusNode=FocusNode();
    passwordFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    usernameController.dispose();
    fullNameController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    fullNameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();
  static bool checked = false;






  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(customTitle: '', context: context, bottomHeight: kToolbarHeight),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical:AppSizes.paddingSize5,horizontal: AppSizes.paddingSize20),
            child: Column(

              children: [

                const AuthLogoHeader(),
                const SizedBox(
                  height: AppSizes.size10,
                ),
                Text(
                    AppLocalizations.of(context)!.translate(AppStrings.enterInfoToResetPassword),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                ),
                BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
                  if(AuthCubit.authForgetPasswordSuccess)
                    {

                      return Column(
                        children: [

                          AuthPasswordField(passwordController: passwordController, passwordFocusNode: passwordFocusNode,onEditComplete: (){
                            passwordFocusNode.unfocus();
                            confirmPasswordFocusNode.requestFocus();
                          },),
                          const SizedBox(
                            height: AppSizes.size10,
                          ),
                          AuthConfirmPasswordField(validation: (){

                            String? validation= AuthCubit.get(context).validateConfirmPassword(passwordController.text, confirmPasswordController.text);
                            return validation!=null? AppLocalizations.of(context)!.translate(validation):null;
                          },passwordController: confirmPasswordController, passwordFocusNode: confirmPasswordFocusNode,onEditComplete: (){
                            passwordFocusNode.unfocus();
                            confirmPasswordFocusNode.requestFocus();
                          },),
                          const SizedBox(
                            height: AppSizes.size20,
                          ),
                          ConditionalBuilder( fallback: (context) =>  CustomButton(width: AppSizes.size300,height:AppSizes.size45 ,title:AppStrings.recoverPassword,textColor: AppColors.white,
                            onPressed: () async {

                              AuthCubit.get(context).newPassword(newPassword: passwordController.text,username:usernameController.text, fullName:  fullNameController.text,);
                            },
                          ),condition:state is AuthLoadingState && state.loading==AuthLoading.newPassword,builder:(context) => LoadingButton(),

                          ),
                        ],
                      );
                    }
                    else{
                    return Form(
                      key: formKey,
                      child: Column(

                        children: [
                          const SizedBox(
                            height: AppSizes.size25,
                          ),


                          const SizedBox(
                            height: AppSizes.size10,
                          ),
                          FullNameField(fullNameFocusNode: fullNameFocusNode, fullNameController: fullNameController
                              ,onEditComplete: (){
                                fullNameFocusNode.unfocus();
                                usernameFocusNode.requestFocus();
                              }),
                          UsernameField(fromLogin: true,userNameController: usernameController,userNameFocusNode: usernameFocusNode,fromUpdate: false,
                              onEditComplete: (){
                                fullNameFocusNode.unfocus();
                                usernameFocusNode.unfocus();
                              }),
                          const SizedBox(
                            height: AppSizes.size20,
                          ),
                          Center(
                            child: ConditionalBuilder(builder: (context) => const LoadingButton(),
                              fallback: (context) =>  CustomButton(width: AppSizes.size300,height:AppSizes.size45 ,title:AppStrings.newPass,textColor: AppColors.white,
                                onPressed: () async {

                                  AuthCubit.get(context).forgetPassword(username: usernameController.text, fullName: fullNameController.text, );
                                },
                              ),
                              condition: state is AuthLoadingState && state.loading==AuthLoading.forgetPassword,

                            ),
                          ),
                          const SizedBox(
                            height: AppSizes.size10,
                          ),
                        ],
                      ),
                    );
                  }
                },),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
