import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class InstructionsCard extends StatefulWidget {
  const InstructionsCard({Key? key,required this.instructions}) : super(key: key);
final List<String> instructions;
  @override
  State<InstructionsCard> createState() => _InstructionsCardState();
}

class _InstructionsCardState extends State<InstructionsCard> {
 late ScrollController _scrollController;
late ValueNotifier<int> currentIndex ;
  @override
  void initState() {
    _scrollController=ScrollController();
    currentIndex= ValueNotifier<int>(1);
    super.initState();
  }
 @override
 void dispose() {
   _scrollController.dispose();
   currentIndex.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.size10,
        ),
        Card(margin: const EdgeInsets.all(AppSizes.size5),elevation: AppSizes.size0,
          color:ThemeCubit.get(context).isDark? Colors.deepOrange.shade300:Colors.orange.shade50,
          child: SizedBox(height: AppSizes.size250,
            child: ValueListenableBuilder(

              valueListenable: currentIndex,builder: (context, value, child) {
            
              return BlocBuilder<MealDetailsCubit, MealDetailsState>(
  builder: (context, state) {
    return AwesomeStepper(
                  headerColor:ThemeCubit.get(context).isDark? Colors.deepOrange.shade300: Colors.orange.shade50,
                  progressColor: Theme.of(context).primaryColor,
                  headerStyle: Theme.of(context).textTheme.displaySmall,
                  progressBarAnimationDuration: const Duration(milliseconds: 500),
                  headerAnimationDuration: const Duration(milliseconds: 500),
                  progressStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color:ThemeCubit.get(context).isDark?Colors.white70:AppColors.grey),
                  controlBuilder: (onNext, onBack) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.size10,right:AppSizes.size10,left:AppSizes.size10,top:AppSizes.size5 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          CustomIconButton(
                            onTap:value<=1? (){}:onBack,
                            icon: Icons.navigate_before, iconSize: AppSizes.size25, boxShape: BoxShape.circle, size: AppSizes.size30, iconColor: AppColors.white, backgroundColor: AppColors.red,),
                          const SizedBox(width: AppSizes.size30,),
                          CustomIconButton(
                            onTap:value>=(widget.instructions.length)?(){}: onNext,
                            icon: Icons.navigate_next, iconSize: AppSizes.size25, boxShape: BoxShape.circle, size: AppSizes.size30, iconColor: AppColors.white, backgroundColor: AppColors.blueGrey,),


                        ],
                      ),
                    );
                  },
                  onStepChanged: (page) {
                    currentIndex.value=page+1;
                  },
                  steps:List.generate(widget.instructions.length, (index) =>  AwesomeStepperItem(
                      label: 'Step ${(index+1).toString()}',
                      content: Scrollbar(thumbVisibility: true,controller: _scrollController,
                        trackVisibility: false,
                        interactive: true,
                        child: SingleChildScrollView(controller: _scrollController,
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:AppSizes.size20,right:AppSizes.size20,bottom:AppSizes.size5),
                                  child: Text(widget.instructions[index],style: Theme.of(context).textTheme.displaySmall!.copyWith(letterSpacing: .5,height: 1.5),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )))
              );
  },
);
            },

            ),
          ),
        ),
      ],
    );
  }
}
