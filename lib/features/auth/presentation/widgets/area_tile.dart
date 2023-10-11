import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/core/widgets/separator.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../cubit/user_preferences/user_preferences_cubit.dart';


class AreaTile extends StatelessWidget {
  final String leadingText;
  final String titleText;
  final bool selected;


  const AreaTile({super.key,
    required this.leadingText,
    required this.titleText,
    required this.selected,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Separator(height:AppSizes.size2),
        Container(height: AppSizes.size50,
          child: ListTile(trailing:selected? Icon(Icons.check_box_rounded,color: Theme.of(context).colorScheme.background,):const SizedBox(),
selectedTileColor: Theme.of(context).primaryColor,
            horizontalTitleGap: AppSizes.size0,
            leadingAndTrailingTextStyle: const TextStyle(

              fontSize: AppSizes.fontSize24,fontWeight: FontW.semiBold
          ),
            minVerticalPadding: AppSizes.size0,
            selected: selected,

            onTap: (){

              UserPreferencesCubit.get(context).selectArea(titleText);
              Navigator.pop(context);
            },
            title: Text(titleText),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSize16),
            leading: Text(leadingText),
          ),
        ),
      ],
    );
  }
}