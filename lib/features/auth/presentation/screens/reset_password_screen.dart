import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cooking_recipes/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/user_full_name_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/auth/auth_cubit.dart';
import '../widgets/auth_confirm_password_field.dart';
import '../widgets/auth_logo_header.dart';
import '../widgets/auth_password_field.dart';
import '../../../../core/widgets/form_header.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late  TextEditingController oldPasswordController = TextEditingController();
  late  TextEditingController confirmPasswordController = TextEditingController();
  late  TextEditingController passwordController = TextEditingController();
  late FocusNode oldPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late  FocusNode passwordFocusNode;
  @override
  void initState() {
    oldPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    oldPasswordFocusNode=FocusNode();
    confirmPasswordFocusNode=FocusNode();
    passwordFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    oldPasswordController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    oldPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();







  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(child: CustomAppBar(context: context), preferredSize:  Size(double.maxFinite, AppSizes.size40)),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical:AppSizes.paddingSize1,horizontal: AppSizes.paddingSize20),
            child: Column(

              children: [

                const AuthLogoHeader(),
                SizedBox(
                  height: AppSizes.size10.h,
                ),
                Text(AppLocalizations.of(context)!.translate(AppStrings.enterInfoToResetPassword),style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: AppSizes.size10.h,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: AppSizes.size10,
                        ),
                        AuthPasswordField(label: AppStrings.oldPass,passwordController: oldPasswordController, passwordFocusNode: oldPasswordFocusNode,onEditComplete: (){
                          oldPasswordFocusNode.unfocus();
                          passwordFocusNode.requestFocus();
                        },),
                        const SizedBox(
                          height: AppSizes.size10,
                        ),

                        AuthPasswordField(label: AppStrings.newPass,passwordController: passwordController, passwordFocusNode: passwordFocusNode,onEditComplete: (){
                          passwordFocusNode.unfocus();
                          confirmPasswordFocusNode.requestFocus();
                        },),

                        AuthConfirmPasswordField(validation: (){
                          String? validation= AuthCubit.get(context).validateConfirmPassword(passwordController.text, confirmPasswordController.text);
                          return validation!=null? AppLocalizations.of(context)!.translate(validation):null;

                        },passwordController: confirmPasswordController, passwordFocusNode: confirmPasswordFocusNode,onEditComplete: (){
                          confirmPasswordFocusNode.unfocus();

                        },),
                        const SizedBox(
                          height: AppSizes.size20,
                        ),
                        BlocConsumer<AuthCubit,AuthState>(
  listener: (context, state) {
    state is AuthPasswordResetSuccessState?{
        Fluttertoast.showToast(msg: 'Password changed successfully!'),
        Navigator.pop(context),
    }:{

    };
  },
  builder: (context, state) {
    return ConditionalBuilder(builder: (context) => CustomButton(height:AppSizes.size45 ,title: AppStrings.resetPassword,textColor: AppColors.white,
        onPressed: () async {



          await  AuthCubit.get(context).resetPassword(oldPassword: oldPasswordController.text,newPassword: passwordController.text,confirmPassword:confirmPasswordController.text );
        },
    ),
                          fallback: (context) => const Center(child: CircularProgressIndicator(),),
                          condition: state is !AuthLoadingState,

                        );
  },
),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
