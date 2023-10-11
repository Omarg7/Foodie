import 'package:cooking_recipes/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../config/theme/app_color/app_color.dart';
import '../utils/app_sizes.dart';
import '../../features/meals/presentation/screens/recipe_blog_screen.dart';
import '../../features/meals/presentation/screens/recipe_video_screen.dart';
import 'custom_button.dart';

class BlogButton extends StatelessWidget {
  const BlogButton({Key? key,required this.blogLink,this.icon=false}) : super(key: key);
  final String blogLink;
  final bool? icon;
  @override
  Widget build(BuildContext context) {
    return icon==true? CustomIconButton(iconColor: AppColors.white,
        backgroundColor:AppColors.blueGrey,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RecipeBlogScreen(
                url: blogLink,
              );
            },
          ));
        },
        size: AppSizes.size40,
       iconSize: AppSizes.size30,
    icon: Icons.open_in_browser,
    ):CustomButton(
        btnColor: AppColors.blueGrey,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RecipeBlogScreen(
                url: blogLink,
              );
            },
          ));
        },
        width: MediaQuery.sizeOf(context).width * .4,
        titleWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Read Blog'),
            SizedBox(
              width: AppSizes.size10,
            ),
            Icon(Icons.open_in_browser),
          ],
        ));
  }
}
