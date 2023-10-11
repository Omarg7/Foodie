
import 'package:cooking_recipes/features/meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/body_title.dart';
import 'package:cooking_recipes/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../config/localization/locale/app_localization.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';

import '../../../../core/widgets/bottom_sheet_header_divider.dart';




showFilterSheet({
  customContext,

}) {
  showModalBottomSheet(isDismissible: true,clipBehavior: Clip.antiAliasWithSaveLayer,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSizes.radius15),
          topLeft: Radius.circular(AppSizes.radius15),
        ),
      ),
      context: customContext,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child:  const StoresFilterSheet(),
      ));
}

class StoresFilterSheet extends StatefulWidget {
  const StoresFilterSheet({Key? key}) : super(key: key);

  @override
  State<StoresFilterSheet> createState() => _StoresFilterSheetState();
}

class _StoresFilterSheetState extends State<StoresFilterSheet> {
  late TextEditingController startDateController;

  late TextEditingController endDateController;


filter(FilterOption? val){

    MealsFilteringCubit.get(context).changeFilterOption(val);
   Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {

    return Container(color: Theme.of(context).colorScheme.background,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: AppSizes.paddingSize20,left:AppSizes.paddingSize20,bottom: AppSizes.paddingSize10),
          child: Column(mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const BottomSheetHeaderDivider(),
             const SizedBox(height: AppSizes.size20,),
             // BottomSheetHeader(headerText: AppStrings.filter, iconBGSize: AppSizes.size20.r),
             // const Divider(indent: Width.width30,endIndent: Width.width30,),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate(AppStrings.selectFilterOption),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),

        /*      BlocBuilder<SubjectBloc, SubjectState>(
  builder: (context, state) {
    return FilterChipsList(items: items, selected: selected);
  },
),*/
              const Divider(indent: AppSizes.size5,endIndent: AppSizes.size5,),
              BlocBuilder<MealsFilteringCubit, MealsFilteringState>(
  builder: (context, state) {
    return Column(
                children: [
                  RadioListTile<FilterOption>(visualDensity: VisualDensity.compact,contentPadding: EdgeInsets.zero,
                    title: const Text('By Category'),
                    value: FilterOption.categories,
                    groupValue: state.option,
                    onChanged: filter,
                  ),
                  RadioListTile<FilterOption>(visualDensity: VisualDensity.compact,contentPadding: EdgeInsets.zero,
                    title: const Text('By Country'),
                    value: FilterOption.countries,
                    groupValue: state.option,
                    onChanged: filter
                  ),
                  RadioListTile<FilterOption>(visualDensity: VisualDensity.compact,contentPadding: EdgeInsets.zero,
                    title: const Text('By Ingredient'),
                    value: FilterOption.ingredients,
                    groupValue: state.option,
                    onChanged: filter,
                  ),
                ],
              );
  },
),

            ],
          ),
        ),
      ),
    );



  }
}
