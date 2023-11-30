import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/core_module/widgets/search_widget/when_to_min.dart';
import 'package:mandayatest/core_module/widgets/search_widget/where_to_expand.dart';
import 'package:mandayatest/core_module/widgets/search_widget/who_to_expand.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/pages/home_page.dart';

import 'package:mandayatest/home_module/presentation/pages/explore_search_result_screen.dart';

class ExperienceSheet extends StatefulWidget {
  const ExperienceSheet({super.key, this.searchFormModel});

  final SearchFormModel? searchFormModel;

  @override
  State<ExperienceSheet> createState() => _ExperienceSheetState();
}

class _ExperienceSheetState extends State<ExperienceSheet>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<int?> vnWidget = ValueNotifier(0);

  List<StepWidget> listStepWidget(
          {int? index, SearchFormModel? dataSearchFormModel}) =>
      [
        StepWidget(
          minWidget: ButtonExperience(
            valueNotif: vnWidget,
            title: 'where',
            index: index,
            subTitle:
                '${dataSearchFormModel?.searchForm?.citySelection?.city ?? ''} ${dataSearchFormModel?.searchForm?.citySelection?.country ?? ''}',
          ),
          maxWidget: WhereToExpand(
            valueNotif: vnWidget,
          ),
        ),
        StepWidget(
          minWidget: WhenToMin(
            valueNotif: vnWidget,
            title: 'when',
            index: index,
            subTitle: (dataSearchFormModel?.searchForm?.dateTrip?.date == null)
                ? ''
                : dataSearchFormModel?.searchForm?.dateTrip?.date
                    .toString()
                    .toHariTanggalanSimpleDate(),
          ),
        ),
        StepWidget(
          minWidget: ButtonExperience(
            valueNotif: vnWidget,
            title: 'who',
            index: index,
            subTitle: dataSearchFormModel?.searchForm?.guestCount
                ?.toJson()
                .values
                .fold(
                    0,
                    (previousValue, element) =>
                        int.parse(previousValue.toString()) +
                        int.parse(element.toString()))
                .toString(),
          ),
          maxWidget: WhoToExpand(
            valueNotif: vnWidget,
          ),
        ),
      ];

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context)
        .add(SetSearch(data: widget.searchFormModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder(
        valueListenable: vnWidget,
        builder: (context, value, child) {
          return Container(
            color: const Color(0xffefefef),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(listStepWidget().length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 24 : 16),
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, stateSearch) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: (value == index
                                ? listStepWidget(
                                            index: index,
                                            dataSearchFormModel: stateSearch
                                                .searchFormModel)[index]
                                        .maxWidget ??
                                    listStepWidget(
                                            index: index,
                                            dataSearchFormModel: stateSearch
                                                .searchFormModel)[index]
                                        .minWidget
                                : listStepWidget(
                                        index: index,
                                        dataSearchFormModel:
                                            stateSearch.searchFormModel)[index]
                                    .minWidget));
                      },
                    ),
                  );
                }),
                const Spacer(),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 24, bottom: 24, top: 16, right: 24),
                  height: 90,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 30,
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<SearchBloc>(context)
                                    .add(ClearAll());
                              },
                              child: const Center(
                                child: Text(
                                  'Clear All',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                        const Expanded(
                          flex: 30,
                          child: SizedBox(),
                        ),
                        BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, stateSearch) {
                            return Expanded(
                                flex: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, HomePage.routeName,
                                        arguments: {
                                          "explore_widget":
                                              ExploreSearchResultScreen(
                                                  searchFormModel: stateSearch
                                                      .searchFormModel),
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Search',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )),
                                      ],
                                    )),
                                  ),
                                ));
                          },
                        )
                      ]),
                )
              ],
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class StepWidget {
  const StepWidget({
    this.title,
    this.minWidget,
    this.maxWidget,
  });

  final String? title;
  final Widget? minWidget;
  final Widget? maxWidget;
}

class ButtonExperience extends StatelessWidget {
  const ButtonExperience({
    super.key,
    this.title,
    this.subTitle,
    this.index,
    required this.valueNotif,
    this.onTap,
  });

  final String? title;
  final String? subTitle;
  final int? index;
  final ValueNotifier<int?> valueNotif;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap ??
          () {
            if (valueNotif.value != index) {
              valueNotif.value = index;
            }
          },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        child: Center(
          child: Row(
            children: [
              Text((title ?? '').toTitleCase(),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
              const Spacer(),
              Text((subTitle ?? '').toTitleCase(),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
