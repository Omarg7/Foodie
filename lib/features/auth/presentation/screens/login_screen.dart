import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/username_field.dart';
import 'package:cooking_recipes/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/loading_button.dart';
import '../../../meals/presentation/screens/meals_screen.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/auth/auth_cubit.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/forget_password_button.dart';
import '../widgets/login_remember_me.dart';
import '../../../../core/widgets/form_header.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 late TextEditingController usernameController ;
 late TextEditingController passwordController;
 late FocusNode usernameFN;
 late FocusNode passwordFN;

  @override
  void initState() {
     usernameController = TextEditingController();
     passwordController = TextEditingController();
     usernameFN=FocusNode();
     passwordFN=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
     usernameController.dispose();
     passwordController.dispose();
     usernameFN.dispose();
     passwordFN.dispose();
    super.dispose();
  }
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.paddingSize20),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                 const FormHeader(

                ),

                SizedBox(height: AppSizes.size10.h,),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.translate(AppStrings.welcomeText),style: Theme.of(context).textTheme.headlineMedium,),
              ],
            ),
                SizedBox(height: AppSizes.size10,),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [


UsernameField(
    fromLogin: true,
    userNameFocusNode: usernameFN, userNameController: usernameController,onEditComplete: (){
  usernameFN.unfocus();
  passwordFN.requestFocus();
}),

                  AuthPasswordField(passwordController: passwordController,passwordFocusNode: passwordFN,onEditComplete: (){
                    passwordFN.unfocus();
                  },
                  ),


                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMe(),
                      ForgetPasswordButton(),

                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.size8,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if(state is AuthCompletedState){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
                          }else if(state is AuthErrorState){
                            Fluttertoast.showToast(msg:state.error);
                          }else{

                          }
                        },

                        builder: (context, state) {

                          return ConditionalBuilder(condition: state is !AuthLoadingState, builder: (context) =>  Center(
                            child: CustomButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).login(

                                      username: usernameController.text,
                                      password: passwordController.text,
                                   );
                                }
                              },
                              title: AppStrings.loginButton,
                            ),
                          ), fallback: (context) => const LoadingButton(),);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: AppSizes.size8,
                  ),
                ],
              ),
            ),
                const Divider(
                  indent: AppSizes.dividerIndent70,
                  endIndent: AppSizes.dividerIndent70,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate(AppStrings.dontHaveAccount),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: AppSizes.size20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate(AppStrings.newAccount),
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

