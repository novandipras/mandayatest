import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/core_module/widgets/bottom_sheet_custom.dart';

class WhoToExpand extends StatelessWidget {
  const WhoToExpand({
    super.key,
    required this.valueNotif,
  });

  final ValueNotifier<int?> valueNotif;

  @override
  Widget build(BuildContext context) {

    String? subtitleWhosComing(String value) {
      String? result;
      switch (value) {
        case 'children':
          result = 'Ages 13 or Above';
        case 'adult':
          result = 'Ages 2-12';
        case 'infant':
          result = 'Under 2';
      }
      return result;
    }

    return BlocProvider.value(
      value: BlocProvider.of<SearchBloc>(context),
      child: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, stateSearchBloc) {
              List<MapEntry<String, dynamic>>? gg = stateSearchBloc
                  .searchFormModel?.searchForm?.guestCount
                  ?.toJson()
                  .entries
                  .toList();
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24, right: 24, left: 24, bottom: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              valueNotif.value = null;
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Whos Coming?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                            itemCount: gg?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          gg![index].key.toTitleCase(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          subtitleWhosComing(gg[index].key) ??
                                              '',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (gg[index].value != 0) {
                                            BlocProvider.of<SearchBloc>(context)
                                                .add(
                                              ChangeWhosComing(
                                                data: gg[index].value - 1,
                                                key: gg[index].key,
                                              ),
                                            );
                                          }
                                        },
                                        child: Opacity(
                                          opacity:
                                              (gg[index].value != 0) ? 1 : 0.2,
                                          child: Container(
                                            margin: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: const Icon(
                                              Icons.remove_rounded,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            gg[index].value.toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<SearchBloc>(context)
                                              .add(
                                            ChangeWhosComing(
                                              data: gg[index].value + 1,
                                              key: gg[index].key,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white,
                                          ),
                                          child: const Icon(
                                            Icons.add_rounded,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ]);
            },
          ),
        );
      }),
    );
  }
}
