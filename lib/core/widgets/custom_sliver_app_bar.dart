import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_font_weights.dart';
import '../utils/utils.dart';

class AppBarActions extends StatefulWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  State<AppBarActions> createState() => _AppBarActionsState();
}

class _AppBarActionsState extends State<AppBarActions> {
  var searchedText;
  bool isPressed = false;
  Widget showSearchField() {
    return Expanded(
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            setState(() {
              searchedText == null
                  ? isPressed = !isPressed
                  : searchedText = null;
            });
          },
          icon:  const Icon(Icons.close, color: AppColors.black),
        ),
        leading: IconButton(
          icon:  const Icon(
            Icons.search_outlined,
            color: AppColors.black,
          ),
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
        ),
        title: TextField(
          onChanged: (val) {
            setState(() {
              searchedText = val;
            });
          },
          decoration: InputDecoration(
            hintText: '...',
            hintStyle: TextStyle(
              color: AppColors.black,
              fontSize: 10.sp,
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isPressed
        ? showSearchField()
        : IconButton(
            icon:  const Icon(
              Icons.search_outlined,
              color: AppColors.black,
            ),
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
              // showSearch(
              //     delegate: MySearchDelegate(), context: context);
            },
          );
  }
}

class CustomSliverAppBar extends SliverAppBar {
  final BuildContext context;

  @override
  final double expandedHeight;
  @override
  final double collapsedHeight;

  Widget? appBarBottom;
  Widget? appBarFlex;
  double? bottomHeight;
  double? appBarElevation;
  List<Widget>? customActions;
  Color? bgColor;
  Widget? customTitle;
  Widget? flexTitle;
  bool? customFloating;
  CustomSliverAppBar({super.key,
    this.customFloating,
    this.bgColor,
    this.flexTitle,
     this.customTitle,

    this.customActions = const [const SizedBox(height: 0)],
    required this.context,
    required this.expandedHeight,
    required this.collapsedHeight,
    this.appBarBottom = const SizedBox(
      height: 0,
    ),
    this.bottomHeight = 0,
    this.appBarFlex = const SizedBox(height: 0),
    this.appBarElevation = 2,
  }) : super(titleTextStyle: Theme.of(context).textTheme.headline2,
            floating: customFloating??false,
            automaticallyImplyLeading: true,
            elevation: 2,
            pinned: true,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),

  );

  @override
  Color? get backgroundColor => bgColor??Theme.of(context).appBarTheme.backgroundColor;
  @override
  List<Widget>? get actions => customActions;
  @override
  Widget? get title => customTitle;

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: Size.fromHeight(bottomHeight!+AppSizes.size2),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.size2),
        child: appBarBottom!,
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,

      background: appBarFlex,
    );

  }
}
