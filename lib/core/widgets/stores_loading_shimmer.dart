
 import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/app_sizes.dart';

class LoadingShimmerCard extends StatelessWidget {
   const LoadingShimmerCard({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  Shimmer.fromColors(
       direction: ShimmerDirection.rtl,
       baseColor: Colors.grey.shade300,
       highlightColor: Colors.grey.shade100,
       enabled: true,
       child: const Card(
         child: SizedBox(
height: AppSizes.size110,

         ),
       ),
     );
   }
 }
