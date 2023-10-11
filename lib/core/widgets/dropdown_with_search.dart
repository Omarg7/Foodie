

import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../config/theme/app_color/app_color.dart';
import '../../features/auth/presentation/cubit/user_preferences/user_preferences_cubit.dart';
import '../prefrences/prefrences.dart';
import '../utils/app_sizes.dart';
import 'outlined_text_field.dart';

class DropdownWithSearch<T> extends StatelessWidget {
  final String title;
  final String placeHolder;


  final TextStyle? dropdownHeadingStyle;
  final TextStyle? itemStyle;
  final double? searchBarRadius;
  final double? dialogRadius;
  final bool disabled;
  final String label;
  final List items;
  final String selected;
  final Function onChanged;
 final TextEditingController textController;
 final FocusNode focusNode;
  const DropdownWithSearch(
      {Key? key,
        required this.textController,
        required this.focusNode,
required this.selected,
      required this.title,
      required this.placeHolder,

required this.items,
      required this.onChanged,

      this.dropdownHeadingStyle,
      this.itemStyle,

      this.searchBarRadius,
      this.dialogRadius,
      required this.label,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => SearchDialog(items: items,selected: selected,
                  placeHolder: placeHolder,
                  title: title,
                  searchInputRadius: searchBarRadius,
                  dialogRadius: dialogRadius,
                  titleStyle: dropdownHeadingStyle,
                  itemStyle: itemStyle,
                  )).then((value) {
             value!=null?{
             onChanged(value),
             }:{};


          });
        },
        child:OutlineBorderTextFormField(ignoreValidate: true,disabled: true,onEditComplete: (){}, prefixIcon: Icons.menu_book,suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined), focusNode: focusNode, textEditingController: textController, label: label, keyboardType: TextInputType.text, autofocus: false, textInputAction: TextInputAction.next, checkOfErrorOnFocusChange: false, validation: (String? string){
          return null;
        })

      ),
    );
  }
}

class SearchDialog extends StatefulWidget {
  final String title;
  final String placeHolder;
  final List items;
  final TextStyle? titleStyle;
  final TextStyle? itemStyle;
  final double? searchInputRadius;
 final String selected;
  final double? dialogRadius;

  const SearchDialog(
      {Key? key,
        required this.selected,
      required this.title,
      required this.placeHolder,
required this.items,
      this.titleStyle,
      this.searchInputRadius,

      this.dialogRadius,
      this.itemStyle})
      : super(key: key);

  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState<T> extends State<SearchDialog> {
  TextEditingController textController = TextEditingController();

 late ScrollController _controller;
  @override
  void initState() {
  _controller=ScrollController();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(Consts.availableFoodType.indexOf(UserPreferencesCubit.get(context).selectedRecommendation) * AppSizes.size55);
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      shape: RoundedRectangleBorder(
          borderRadius: widget.dialogRadius != null
              ? BorderRadius.circular(widget.dialogRadius!)
              : BorderRadius.circular(AppSizes.radius15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSize16),
                  child: Text(
                    widget.title,
                    style: widget.titleStyle ?? const TextStyle(fontSize: AppSizes.fontSize20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    })

              ],
            ),
            const SizedBox(height: AppSizes.size5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSize16),
              child: TextField(onChanged: (val){
                UserPreferencesCubit.get(context).searchRecommendation(val);
                },
                autofocus: true,
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: widget.placeHolder,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        widget.searchInputRadius != null
                            ? Radius.circular(widget.searchInputRadius!)
                            : const Radius.circular(AppSizes.radius5)),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        widget.searchInputRadius != null
                            ? Radius.circular(widget.searchInputRadius!)
                            : const Radius.circular(AppSizes.radius5)),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
                style: widget.itemStyle ?? const TextStyle(fontSize: AppSizes.fontSize14),
                controller: textController,
              ),
            ),
            const SizedBox(height: AppSizes.size5),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(widget.dialogRadius != null
                    ? Radius.circular(widget.dialogRadius!)
                    : const Radius.circular(AppSizes.radius5)),
                //borderRadius: widget.dialogRadius!=null?BorderRadius.circular(widget.dropDownRadius!):BorderRadius.circular(14),
                child: BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
  builder: (context, state) {
    return ListView.builder(controller: _controller,
                    itemCount:  state.recommendations.length,
                    itemBuilder: (context, index) {
                      return   Column(
                        children: [
                          InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.pop(context,widget.items[index]);

                              },
                              child: Padding(
                                padding:  const EdgeInsets.symmetric(
                                    vertical: AppSizes.paddingSize10, horizontal: AppSizes.paddingSize16),
                                child:  ListTile(tileColor:ThemeCubit.get(context).isDark? Theme.of(context).colorScheme.background:AppColors.white,
                                  minLeadingWidth: AppSizes.size5,visualDensity: VisualDensity.compact,dense: true,title: Text(
                                    state.recommendations[index],
                                  style:Theme.of(context).textTheme.headlineSmall,

                                ),leading:widget.selected==state.recommendations[index]?  Icon(Icons.radio_button_checked,color: Theme.of(context).primaryColor,):const Icon(Icons.radio_button_off,color: AppColors.grey),),
                              )),
                         const Divider(endIndent: AppSizes.size14 ,height: .5,),

                        ],
                      );

                      /*InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pop(context, widget.type==CSCType.country?state.countries[index].name:widget.type==CSCType.state?state.states[index].name:state.cities[index].name);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 18),
                            child: Text(
                              widget.type==CSCType.country?state.countries[index].name.toString():widget.type==CSCType.state?state.states[index].name.toString():state.cities[index].name.toString(),
                              style: widget.itemStyle ?? const TextStyle(fontSize: 14),
                            ),
                          ));*/
                    });
  },
),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  /// Creates a dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const CustomDialog({
    Key? key,
    this.child,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.constraints = const BoxConstraints(
        minWidth: 280.0, minHeight: 280.0, maxHeight: 400.0, maxWidth: 400.0),
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to 100 milliseconds.
  final Duration insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve insetAnimationCurve;

  /// {@template flutter.material.dialog.shape}
  /// The shape of this dialog's border.
  ///
  /// Defines the dialog's [Material.shape].
  ///
  /// The default shape is a [RoundedRectangleBorder] with a radius of 2.0.
  /// {@endtemplate}
  final ShapeBorder? shape;
  final BoxConstraints constraints;

  Color _getColor(BuildContext context) {
    return Theme.of(context).dialogBackgroundColor;
  }


  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)));

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: constraints,
            child: Material(textStyle: Theme.of(context).textTheme.bodyMedium,
              elevation: 15.0,
              color: _getColor(context),
              type: MaterialType.card,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
