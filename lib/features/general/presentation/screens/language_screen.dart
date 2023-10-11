import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/localization/localization/presentation/cubit/localization_cubit.dart';
import '../../../../core/utils/app_sizes.dart';

import '../widgets/lang_tile.dart';


class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Stack(children: [
        Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 0,
          right: AppSizes.size20,left: AppSizes.size20,
          child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height * .6,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.language,size: AppSizes.size250,),
                Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!,
                    AppLocalizations.of(context)!
                        .translate(AppStrings.selectAppLang) ??
                        AppStrings.emptyString),
                SizedBox(height: AppSizes.size70.h,)
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSize5,
                vertical: AppSizes.paddingSize22),
            color: Theme.of(context).colorScheme.background,
            height: MediaQuery.of(context).size.height * .35,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.translate,size: AppSizes.iconSize22,),

                      Text(
                          '   ${(AppLocalizations.of(context)!.translate(AppStrings.availableLang) ?? AppStrings.emptyString)}',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.size10,
                  ),
                  LangTile(
                      onTap: () {
                        LocalizationCubit.get(context).toArabic(
                            !AppLocalizations.of(context)!.isEnLocale);
                      },
                      selected: !AppLocalizations.of(context)!.isEnLocale,
                      leading: "\ud83c\uddea\ud83c\uddec",
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.arabic) ??
                          AppStrings.emptyString),
                  LangTile(
                      onTap: () {
                        LocalizationCubit.get(context).toEnglish(
                            AppLocalizations.of(context)!.isEnLocale);
                      },
                      selected: AppLocalizations.of(context)!.isEnLocale,
                      leading: "\ud83c\uddec\ud83c\udde7",
                      title: AppLocalizations.of(context)!
                          .translate(AppStrings.english) ??
                          AppStrings.emptyString),
                ]),
          ),
        ),
      ]),
    );
  }
}
