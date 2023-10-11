import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';
import 'package:cooking_recipes/core/widgets/custom_sliver_app_bar.dart';
import 'package:cooking_recipes/core/widgets/input_form_field.dart';
import 'package:cooking_recipes/features/auth/presentation/widgets/area_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/prefrences/prefrences.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/user_preferences/user_preferences_cubit.dart';

class SelectAreaScreen extends StatefulWidget {
  const SelectAreaScreen({Key? key}) : super(key: key);

  @override
  State<SelectAreaScreen> createState() => _SelectAreaScreenState();
}

class _SelectAreaScreenState extends State<SelectAreaScreen> {
 late ScrollController _controller;
  @override
  void initState() {
    _controller=ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(Consts.availableCountries.keys.toList().indexOf(UserPreferencesCubit.get(context).selectedArea) * AppSizes.size55);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(controller: _controller,
          slivers: [
            SliverToBoxAdapter(child:
            Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * .06,),
                 Text('Explore the world\'s diverse flavors! Select a country whose cuisine piques your taste buds.',style: Theme.of(context).textTheme.displayMedium,),
                const SizedBox(height: AppSizes.size20,),
                CustomFormField(hintText: 'Search..', onChanged:(name){
                  UserPreferencesCubit.get(context).searchArea(name??'');
                },prefixIcon: Icons.search,textEditingController: TextEditingController(), textInputType: TextInputType.text),
                const SizedBox(height: AppSizes.size10,),
              ],
            ),),
            BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
  builder: (context, state) {
    return SliverList.builder(itemBuilder: (context, index) => AreaTile(leadingText: state.areas.values.toList()[index], titleText: state.areas.keys.toList()[index], selected: state.areas.keys.toList()[index]==state.selectedArea,),itemCount: state.areas.keys.toList().length, );
  },
)
          ]
        ),
      ),
    );
  }
}
