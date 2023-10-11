import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_color/app_color.dart';

class InstructionsTile extends StatelessWidget {
  const InstructionsTile({Key? key,required this.instruction,required this.index}) : super(key: key);
 final String instruction;
 final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(isThreeLine: true,
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                minLeadingWidth: 0,

                subtitle:Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(instruction,style: Theme.of(context).textTheme.displaySmall),
                ) ,
                title: Center(child: Text('Step ${(index+1).toString()}',style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.grey))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
