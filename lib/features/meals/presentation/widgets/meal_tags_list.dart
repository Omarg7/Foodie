import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizes.dart';

class MealTagsList extends StatelessWidget {
  const MealTagsList({Key? key,required this.tags}) : super(key: key);
  final List<String> tags;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: AppSizes.size10,
      spacing: AppSizes.size10,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(
          tags.length, (index) {
        return Chip(
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  AppSizes.size10)),
          backgroundColor: const Color(0xFF5b7c99),
          label: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.size5),
            child: Text(
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .background,
                ),
                softWrap: true,
                tags[index]),
          ),
        );
      }),
    );
  }
}
