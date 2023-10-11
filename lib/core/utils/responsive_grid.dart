import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResponsive{
  static SliverGridDelegateWithFixedCrossAxisCount grid(double height,double width){
  return height>width? SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: (4 / 5),
      crossAxisCount: width >= 1500
          ? 7
          : width >= 1050
          ? 6
          : width >= 900
          ? 5
          : width >= 750
          ? 4
          : 2,

    ):SliverGridDelegateWithFixedCrossAxisCount(
    childAspectRatio: (4 / 5),
    crossAxisCount: width >= 1500
        ? 7
        : width >= 1050
        ? 5
        : width >= 900
        ? 5
        : width >= 620
        ? 4
        : 2,

  );

  }
  static SliverGridDelegateWithFixedCrossAxisCount ingredientsGrid(double height,double width){
    return height>width? SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 3 / 2,
      crossAxisCount: width >= 1500
          ? 8
          : width >= 1050
          ? 7
          : width >= 900
          ? 6
          : width >= 750
          ? 5
          : 3,

    ):SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: width >= 1500
          ? 8
          : width >= 1050
          ? 7
          : width >= 900
          ? 6
          : width >= 620
          ? 5
          : 3,

    );

  }

  static double height(double portraitHeight,double landscapeHeight,BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.landscape? landscapeHeight.w:portraitHeight.h;

  }
  static double width(double portraitWidth,double landscapeWidth,BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.landscape? landscapeWidth.w:portraitWidth.h;

  }
}