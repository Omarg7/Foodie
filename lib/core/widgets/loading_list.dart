import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'stores_loading_shimmer.dart';


class LoadingList extends StatelessWidget {
  const LoadingList({Key? key, required this.childCount}) : super(key: key);
  final int childCount;


  @override
  Widget build(BuildContext context) {
    return SliverList(

        delegate: SliverChildBuilderDelegate(
            childCount: childCount,
                (context,index)=> const LoadingShimmerCard())
    );
  }
}
