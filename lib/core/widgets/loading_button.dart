
import 'package:flutter/material.dart';

import '../utils/app_font_weights.dart';
import '../utils/app_sizes.dart';

class LoadingButton extends StatefulWidget {
  final double? startWidth;
  const LoadingButton({Key? key, this.startWidth}) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {

  late double _height;
  late ValueNotifier<bool> isCircle;
  @override
  void initState() {
_height=45;
isCircle=ValueNotifier(false);
Future.delayed(const Duration(milliseconds: 200)).then((value) {
  isCircle.value=!isCircle.value ;

});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<bool>(valueListenable: isCircle,builder: (context, value, child) {
      return Center(child: AnimatedContainer(
          width:value? AppSizes.size50:(widget.startWidth?? MediaQuery.of(context).size.width * .82),
          height:value? AppSizes.size50:_height,
          decoration: BoxDecoration(shape:value? BoxShape.rectangle:BoxShape.rectangle,borderRadius:value? BorderRadius.circular(AppSizes.radius40):BorderRadius.circular(AppSizes.radius40),color: Theme.of(context).primaryColor),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Card(margin: EdgeInsets.zero,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius40)),color: Theme.of(context).primaryColor,child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).primaryColor),padding:  const EdgeInsets.all(AppSizes.paddingSize10),child:  Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.background,))))));
    },

    );
  }
}
