import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'stores_loading_shimmer.dart';


class LoadingGrid extends StatelessWidget {
  const LoadingGrid({Key? key, required this.childCount,required this.childRation}) : super(key: key);
  final int childCount;
  final double childRation;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:MediaQuery.of(context).size.width>1500? 6:MediaQuery.of(context).size.width>1050? 5:MediaQuery.of(context).size.width>850? 4 :MediaQuery.of(context).size.width>600? 3: 2 ,
          childAspectRatio: 25.w / 38.h,
        ),
        delegate: SliverChildBuilderDelegate(
            childCount: childCount,
            (context,index)=> const LoadingShimmerCard())
    );
  }
}
