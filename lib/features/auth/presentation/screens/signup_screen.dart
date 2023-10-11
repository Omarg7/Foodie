import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/area_selection_field.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/recommendation_field.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:cooking_recipes/core/widgets/loading_button.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/auth_confirm_password_field.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/user_full_name_field.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_font_weights.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entity/user_entity.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/user_preferences/user_preferences_cubit.dart';
import '../widgets/user_preferences_fields.dart';
import '../widgets/username_field.dart';
import '../../../../core/widgets/form_header.dart';
import '../../../../core/widgets/input_form_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey;

  late final FocusNode usernameFN;

  late final FocusNode fullNameFN;
  late final FocusNode passwordFN;
  late final FocusNode confirmPasswordFN;

  late final TextEditingController usernameController;

  late final TextEditingController passwordController;

  late final TextEditingController confirmPasswordController;

  late final TextEditingController fullNameController;

  late final FocusScopeNode _node;


  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    usernameFN = FocusNode();
    fullNameFN = FocusNode();
    passwordFN = FocusNode();

    confirmPasswordFN = FocusNode();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    fullNameController = TextEditingController();
    _node = FocusScopeNode();
    super.initState();
  }

  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void dispose() {
    usernameFN.dispose();
    fullNameFN.dispose();

    passwordFN.dispose();
    confirmPasswordFN.dispose();


    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingSize10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const FormHeader(

                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: FocusScope(
                        node: _node,
                        child: Column(
                          children: [
                             SizedBox(
                              height: AppSizes.size10.h,
                            ),
                            FullNameField(
                              fullNameFocusNode: fullNameFN,
                              fullNameController: fullNameController,
                              onEditComplete: () {
                                fullNameFN.unfocus();
                                usernameFN.requestFocus();
                              },
                            ),
                            UsernameField(fromLogin: false,
                              userNameController: usernameController,
                              userNameFocusNode: usernameFN,
                              onEditComplete: () {
                                usernameFN.unfocus();
                                passwordFN.requestFocus();
                              },
                            ),
                            AuthPasswordField(
                              passwordFocusNode: passwordFN,
                              passwordController: passwordController,
                              onEditComplete: () {
                                passwordFN.unfocus();
                                confirmPasswordFN.requestFocus();
                              },
                            ),
                            AuthConfirmPasswordField(
                              passwordController: confirmPasswordController,
                              passwordFocusNode: confirmPasswordFN,
                              validation: () {
                                String? validation = AuthCubit.get(context)
                                    .validateConfirmPassword(
                                        passwordController.text,
                                        confirmPasswordController.text);
                                return validation != null
                                    ? AppLocalizations.of(context)!
                                        .translate(validation)
                                    : null;
                              },
                              onEditComplete: () {
                                confirmPasswordFN.unfocus();
                              },
                            ),

                            const UserPreferencesFields(fromUpdate: false),
                             SizedBox(height: AppSizes.size10.h,),
                            BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is AuthCompletedState){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
    }else if(state is AuthErrorState){
        Fluttertoast.showToast(msg:state.error);
    }else{

    }
  },

  builder: (context, state) {
    return ConditionalBuilder(condition: state is !AuthLoadingState, builder: (context) =>  CustomButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).register(
                                      fullName: fullNameController.text,
                                      userName: usernameController.text,
                                      password: passwordController.text,
                                      recommendedCountry: UserPreferencesCubit.get(context).area,
                                    favFoodType:UserPreferencesCubit.get(context).recommendation,
                                      );
                                }
                              },
                              title: AppStrings.signupButton,
                            ), fallback: (context) => const LoadingButton(),);
  },
),

                            const SizedBox(
                              height: AppSizes.size16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Divider(
                  indent: AppSizes.indentDivider.w,
                  endIndent: AppSizes.indentDivider.w,
                ),
const SizedBox(height: AppSizes.size10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .translate(AppStrings.haveAccount),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      width: AppSizes.size10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.loginButton),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(decoration: TextDecoration.underline),
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
