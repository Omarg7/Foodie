import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/localization/localization.dart';
import '../../config/theme/theme.dart';
import '../../features/areas/areas.dart';
import '../../features/auth/auth.dart';
import '../../features/categories/categories.dart';
import '../../features/favourites/favourites.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/ingredients/ingredients.dart';
import '../../features/meals/meals.dart';
import '../../features/recommendations/data/services/base_recommendations_services.dart';
import '../../features/recommendations/recommendations.dart';
import '../../shared/shared.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register your dependencies here
  // services
  getIt.registerLazySingleton<ThemeCacheImpl>(() => ThemeCacheImpl(sharedPreferences: getIt()));
  getIt.registerFactory<IThemeCache>(() => getIt());

  getIt.registerLazySingleton<LocalFavouritesServices>(
          () => LocalFavouritesServices());

  getIt.registerLazySingleton<RemoteIngredientsServices>(
          () => RemoteIngredientsServices());
  getIt.registerFactory<BaseIngredientsServices>(
          () => getIt<RemoteIngredientsServices>());
  getIt.registerLazySingleton<RemoteAreasServices>(() => RemoteAreasServices());
 getIt.registerFactory<BaseAreasServices>(() => getIt<RemoteAreasServices>());

  getIt.registerLazySingleton<RemoteServicesImpl>(() => RemoteServicesImpl());
  getIt.registerFactory<BaseServices>(() => getIt<RemoteServicesImpl>());

  getIt.registerLazySingleton<RemoteCategoriesServices>(
          () => RemoteCategoriesServices());
  getIt.registerFactory<BaseCategoriesServices>(
          () => getIt<RemoteCategoriesServices>());
  getIt.registerLazySingleton<LangCacheImpl>(() => LangCacheImpl(sharedPreferences: getIt()));
  getIt.registerFactory<ILangCache>(() => getIt<LangCacheImpl>());

  getIt.registerLazySingleton<LocalAuthServices>(
          () => LocalAuthServices());
  getIt.registerLazySingleton<RemoteRecommendationsServices>(
          () => RemoteRecommendationsServices());
  getIt.registerFactory<BaseRecommendationServices>(
          () => getIt<RemoteRecommendationsServices>());
  getIt.registerFactory<BaseAuthServices>(
          () => getIt<LocalAuthServices>());
  getIt.registerLazySingleton<AuthCacheImpl>(
          () => AuthCacheImpl(sharedPreferences: getIt()));
  // getIt.registerFactory<IAuthCache>(
  //         () => getIt());

  getIt.registerSingletonAsync<SharedPreferences>(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  });

  getIt.registerLazySingleton<ThemeRepositoryImpl>(() => ThemeRepositoryImpl(themeLocalDataSource: getIt()));
getIt.registerFactory<IThemeRepository>(() => getIt<ThemeRepositoryImpl>());

  getIt.registerLazySingleton<FavouritesRepository>(
          () => FavouritesRepository(getIt()));
  getIt.registerFactory<BaseFavouritesRepository>(
          () => getIt<FavouritesRepository>());
  getIt.registerLazySingleton<IngredientsRepository>(
          () => IngredientsRepository(getIt()));
  getIt.registerLazySingleton<RecommendationRepository>(
          () => RecommendationRepository(getIt()));
  getIt.registerFactory<BaseRecommendationRepository>(
          () => getIt<RecommendationRepository>());
  getIt.registerFactory<BaseIngredientsRepository>(
          () => getIt<IngredientsRepository>());

  getIt.registerLazySingleton<AreasRepository>(() => AreasRepository(getIt()));
  getIt.registerFactory<BaseAreaRepository>(() => getIt<AreasRepository>());

  getIt.registerLazySingleton<MealsRepository>(() => MealsRepository(getIt()));
  getIt.registerFactory<BaseMealsRepository>(() => getIt<MealsRepository>());

  getIt.registerLazySingleton<CategoriesRepository>(
          () => CategoriesRepository(getIt()));
  getIt.registerFactory<BaseCategoriesRepository>(
          () => getIt<CategoriesRepository>());
  getIt.registerLazySingleton<LangRepositoryImpl>(() => LangRepositoryImpl(langLocalDataSource: getIt()));
 getIt.registerFactory<ILangRepository>(() =>getIt<LangRepositoryImpl>());

  getIt.registerLazySingleton<AuthRepository>(
          () => AuthRepository(getIt(),getIt(),));

  getIt.registerFactory<IAuthRepository>(
          () => getIt<AuthRepository>());

  // UseCases
  getIt.registerLazySingleton<GetSavedThemeUseCase>(
          () => GetSavedThemeUseCase(themeRepository: getIt()));
  getIt.registerLazySingleton<ChangeThemeUseCase>(
          () => ChangeThemeUseCase(themeRepository: getIt()));
  getIt.registerLazySingleton<ClearFavouriteMealsUseCase>(
          () => ClearFavouriteMealsUseCase(getIt()));
  getIt.registerLazySingleton<RemoveFavouriteMealUseCase>(
          () => RemoveFavouriteMealUseCase(getIt()));
  getIt.registerLazySingleton<AddFavouriteMealUseCase>(
          () => AddFavouriteMealUseCase(getIt()));
  getIt.registerLazySingleton<GetFavouriteMealsUseCase>(
          () => GetFavouriteMealsUseCase(getIt()));
  getIt.registerLazySingleton<GetIngredientsUseCase>(
          () => GetIngredientsUseCase(getIt()));
  getIt.registerLazySingleton<GetAreasUseCase>(
          () => GetAreasUseCase(getIt()));
  getIt.registerLazySingleton<SearchMealsUseCase>(
          () => SearchMealsUseCase(getIt()));
  getIt.registerLazySingleton<GetRandomMealUseCase>(
          () => GetRandomMealUseCase(getIt()));
  getIt.registerLazySingleton<FilterMealsByAreaUseCase>(
          () => FilterMealsByAreaUseCase(getIt()));
  getIt.registerLazySingleton<FilterMealsByCategoryUseCase>(
          () => FilterMealsByCategoryUseCase(getIt()));
  getIt.registerLazySingleton<GetMealByIDUseCase>(
          () => GetMealByIDUseCase(getIt()));
  getIt.registerLazySingleton<GetCategoriesUseCase>(
          () => GetCategoriesUseCase(getIt()));
  getIt.registerLazySingleton<FilterMealsByIngredientUseCase>(
          () => FilterMealsByIngredientUseCase(getIt()));
  getIt.registerLazySingleton<GetSavedLangUseCase>(
          () => GetSavedLangUseCase(langRepository: getIt()));
  getIt.registerLazySingleton<ChangeLangUseCase>(
          () => ChangeLangUseCase(langRepository: getIt()));
  getIt.registerLazySingleton<RegisterUserUseCase>(
          () => RegisterUserUseCase(getIt()));
  getIt.registerLazySingleton<UpdateUserFavouritesUseCase>(
          () => UpdateUserFavouritesUseCase(getIt()));
  getIt.registerLazySingleton<DeleteUserAccountUseCase>(
          () => DeleteUserAccountUseCase(getIt()));
  getIt.registerLazySingleton<UpdateUserInfoUseCase>(
          () => UpdateUserInfoUseCase(getIt()));
  getIt.registerLazySingleton<ForgetPasswordUseCase>(
          () => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton<NewPasswordUseCase>(
          () => NewPasswordUseCase(getIt()));
  getIt.registerLazySingleton<SetLastLoginUseCase>(
          () => SetLastLoginUseCase(getIt()));
  getIt.registerLazySingleton<SetRememberMeUseCase>(
          () => SetRememberMeUseCase(getIt()));
  getIt.registerLazySingleton<GetRememberMeUseCase>(
          () => GetRememberMeUseCase(getIt()));
  getIt.registerLazySingleton<GetLastLoginUseCase>(
          () => GetLastLoginUseCase(getIt()));
  getIt.registerLazySingleton<GetLastUidUseCase>(
          () => GetLastUidUseCase(getIt()));
  getIt.registerLazySingleton<CheckUserNameAvailabilityUseCase>(
          () => CheckUserNameAvailabilityUseCase(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(
          () => LoginUseCase(getIt()));
  getIt.registerLazySingleton<GetUserByIdUseCase>(
          () => GetUserByIdUseCase(getIt()));


  // Repositories



  // BlocProviders
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit(
    getIt(),
    getIt(),
  ));

  getIt.registerFactory<MealsFilteringCubit>(() => MealsFilteringCubit());

  getIt.registerFactory<FavouritesCubit>(() => FavouritesCubit(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));

  getIt.registerFactory<IngredientsCubit>(
          () => IngredientsCubit(getIt()));

  getIt.registerFactory<AreasCubit>(() => AreasCubit(getIt()));

  getIt.registerFactory<MealsSearchCubit>(
          () => MealsSearchCubit(getIt()));

  getIt.registerFactory<RecommendationsCubit>(() => RecommendationsCubit(
    getIt(),
    getIt(),
    getIt(),
  ));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerFactory<MealDetailsCubit>(
          () => MealDetailsCubit(getIt()));

  getIt.registerFactory<CategoriesCubit>(
          () => CategoriesCubit(getIt()));

  getIt.registerFactory<MealsCubit>(() => MealsCubit(
    getIt(),
    getIt(),
    getIt(),
  ));

  getIt.registerFactory<UserPreferencesCubit>(() => UserPreferencesCubit()
    ..initialize());

  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit(
    getSavedLangUseCase:getIt(),
    changeLangUseCase:  getIt(),
  ));

  getIt.registerFactory<AuthCubit>(() => AuthCubit(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));

}
