import 'package:flutter/material.dart';

import '../../config/theme/app_color/app_color.dart';
import '../utils/app_sizes.dart';
import '../../features/meals/presentation/screens/recipe_video_screen.dart';
import 'custom_button.dart';
import 'custom_icon_button.dart';

class YoutubeButton extends StatelessWidget {
  const YoutubeButton({Key? key,required this.videoLink,required this.instructions,this.icon}) : super(key: key);
final String videoLink;
final List<String> instructions;
final bool? icon;
  @override
  Widget build(BuildContext context) {
    return icon==true?CustomIconButton(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RecipeVideoScreen(
                videoUrl: videoLink,
                instructions: instructions,
              );
            },
          ));
        },
        backgroundColor: AppColors.red,
        iconSize: AppSizes.radius35,
        size: AppSizes.size50,
        iconColor: AppColors.white,
         icon: Icons.play_arrow,):CustomButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RecipeVideoScreen(
                videoUrl: videoLink,
                instructions: instructions,
              );
            },
          ));
        },
        width: MediaQuery.sizeOf(context).width * .4,
        titleWidget: const FittedBox(fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Watch Now'),
              SizedBox(
                width: AppSizes.size10,
              ),
              Icon(Icons.play_arrow),
            ],
          ),
        ));
  }
}
