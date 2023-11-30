import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/core_module/widgets/search_widget/experience_sheet.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';

class SearchBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const SearchBarCustom({super.key, this.searchFormModel});

  final SearchFormModel? searchFormModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: BlocProvider(
        create: (context) => locator<SearchBloc>(),
        child: Builder(builder: (context) {
          SearchBloc bloc = BlocProvider.of<SearchBloc>(context);
          return GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BlocProvider.value(
                      value: bloc,
                      child: Builder(builder: (context) {
                        return Dialog.fullscreen(
                          child: DefaultTabController(
                            length: 2,
                            child: Scaffold(
                              appBar: AppBar(
                                actions: const [
                                  SizedBox(width: 42),
                                ],
                                elevation: 0,
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.close_rounded,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                backgroundColor: const Color(0xffefefef),
                                title: const TabBar(
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      text: 'Stays',
                                    ),
                                    Tab(
                                      text: 'Experience',
                                    ),
                                  ],
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  Container(
                                    color: const Color(0xffefefef),
                                    child: const Icon(
                                      Icons.build_circle_outlined,
                                      size: 200,
                                      color: Colors.white,
                                    ),
                                  ),
                                   ExperienceSheet(searchFormModel: searchFormModel),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }).then((value) => BlocProvider.of<SearchBloc>(context).add(const InitSearch()));
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 42,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(255),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searchFormModel?.searchForm?.citySelection?.city ??
                            searchFormModel
                                ?.searchForm?.citySelection?.country ??
                            'Where To?',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            searchFormModel?.searchForm?.dateTrip?.isAnytime ==
                                    true
                                ? 'Any Week'
                                : searchFormModel?.searchForm?.dateTrip?.date
                                        .toString()
                                        .toHariTanggalanSimpleDate() ??
                                    'Any Week, ',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              int? guest = searchFormModel?.searchForm?.guestCount?.toJson().values.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString()));
                              return Text(
                                ' - ${ guest == 0 ? 'Add' : '$guest'} Guest',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.12),
                    radius: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          Assets.png.settingsSliders.path,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      backgroundColor: const Color(0xffefefef),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}
