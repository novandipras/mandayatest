import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/utils/app_bar_custom.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/bloc/explore_screen_bloc/explore_screen_bloc.dart';
import 'package:mandayatest/home_module/presentation/pages/default_explore_screen.dart';
import 'package:mandayatest/home_module/presentation/pages/explore_search_result_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    super.key,
  });

  static const String routeName = '/ExploreScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ExploreScreenBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xffefefef),
          appBar: SearchBarCustom(
            searchFormModel: SearchFormModel(
              searchForm: SearchForm(
                dateTrip: DateTrip(
                    isAnytime: true,
                    date: null),
                guestCount: GuestCount(adult: 0, children: 0, infant: 0),
                citySelection: CitySelection(isFlexible: true),
              ),
            ),
          ),
          body: const DefaultExploreScreen(),
        );
      }),
    );
  }
}
