import 'cubits.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/localization/locale/app_localization_setup.dart';
import 'config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'core/helpers/cache_local_services.dart';
import 'core/services/service_locator.dart';
import 'features/auth/data/model/user_model.dart';
import 'features/favourites/favourites.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/onboarding/presentation/screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(FavouriteModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('auth');
  await Hive.openBox<FavouriteModel>('favourites');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? isChecked;

  @override
  void initState() {
    isChecked = CacheHelper.getChecked(key: 'rememberCheckBox');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
            create: (context) => getIt<ThemeCubit>()..getSavedTheme()),
        BlocProvider<MealsFilteringCubit>(
            create: (context) => getIt<MealsFilteringCubit>()),
        BlocProvider<FavouritesCubit>(
            create: (context) => getIt<FavouritesCubit>()),
        BlocProvider<IngredientsCubit>(
            create: (context) => getIt<IngredientsCubit>()),
        BlocProvider<AreasCubit>(create: (context) => getIt<AreasCubit>()),
        BlocProvider<MealsSearchCubit>(
            create: (context) => getIt<MealsSearchCubit>()),
        BlocProvider<RecommendationsCubit>(
            create: (context) => getIt<RecommendationsCubit>()),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
        BlocProvider<MealDetailsCubit>(
            create: (context) => getIt<MealDetailsCubit>()),
        BlocProvider<CategoriesCubit>(
            create: (context) => getIt<CategoriesCubit>()),
        BlocProvider<MealsCubit>(create: (context) => getIt<MealsCubit>()),
        BlocProvider<UserPreferencesCubit>(
            create: (context) => getIt<UserPreferencesCubit>()..initialize()),
        BlocProvider<LocalizationCubit>(
            create: (context) => getIt<LocalizationCubit>()),
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeChanged>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(411, 890),
            minTextAdapt: false,
            splitScreenMode: true,
            builder: (context, child) =>
                BlocBuilder<LocalizationCubit, LocalizationState>(
              builder: (context, state) {
                return MaterialApp(
                  locale: state.locale,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  home: isChecked == true
                      ? const SplashScreen(pushLogin: false)
                      : const OnBoarding(),
                  debugShowCheckedModeBanner: false,
                  title: 'Foodie',
                  theme: themeState.userTheme,
/*              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaleFactor: 1.0),
                    child: HomeScreen());
              },*/
                );
              },
            ),
          );
        },
      ),
    );
  }
}
