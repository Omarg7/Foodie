import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cooking_recipes/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/auth/presentation/widgets/auth_logo_header.dart';
import '../utils/app_font_weights.dart';
import '../../config/localization/locale/app_localization.dart';
import '../../config/theme/app_color/app_color.dart';
import '../../features/auth/presentation/cubit/auth/auth_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.pushLogin,

  }) : super(key: key);
  final bool pushLogin;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationController.forward();

    super.initState();
  }

  @override
  void didChangeDependencies() async{

      if (widget.pushLogin) {
        Future.delayed(const Duration(seconds: 4)).then((value) {
          if (mounted) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        });
      }else{
        await AuthCubit.get(context).loginUser();

            }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is AuthCompletedState){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
    }else if(state is AuthErrorState){
Fluttertoast.showToast(msg:AppLocalizations.of(context)!.translate(AppStrings.error));
    }
  },
  builder: (context, state) {
    return Container(width: double.maxFinite,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: AnimatedSplashScreen(
          splashIconSize: 320.r,
          centered: true,animationDuration: const Duration(seconds: 2),
          duration: 2000,
          splash: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
AuthLogoHeader(),
           ],
          ),
          nextScreen: const LoginScreen(),
          splashTransition: SplashTransition.slideTransition,

          pageTransitionType: PageTransitionType.bottomToTop,
          backgroundColor: AppColors.white),
    );
  },
),
    );
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height * .5,
//               child: Directionality(
//                   textDirection: Sizes.textDirection_right,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       FadeTransition(
//                         opacity: _animationController,
//                         child: Image(
//                           image: const AssetImage(TextVar.ezzatLogoUrl),
//                           width: 150.w,
//                           height: 200.h,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       Text(
//                         TextVar.ezzatText,
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline2!
//                             .copyWith(color: Colors.black),
//                       )
//                     ],
//                   )),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * .3,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SlideTransition(
//                     position: Tween<Offset>(
//                             begin: const Offset(-1, -3),
//                             end: const Offset(.2, 0))
//                         .animate(_animationController),
//                     child: Text(
//                       TextVar.designByText,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2!
//                           .copyWith(color: Colors.black, fontSize: 16),
//                     )),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image(
//                       image: const AssetImage(TextVar.masLogoUrl),
//                       width: 70.w,
//                       height: 70.h,
//                       fit: BoxFit.cover,
//                     ),
//                     SlideTransition(
//                         position: Tween<Offset>(
//                                 begin: const Offset(5, 0), end: Offset.zero)
//                             .animate(_animationController),
//                         child: Text(
//                           TextVar.masText,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline2!
//                               .copyWith(color: Colors.black),
//                         )),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )
// class StaticSplachScreen extends StatelessWidget {
//   const StaticSplachScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
