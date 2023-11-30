import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';

class WhereToExpand extends StatelessWidget {
  const WhereToExpand({
    super.key,
    required this.valueNotif,
  });

  final ValueNotifier<int?> valueNotif;

  @override
  Widget build(BuildContext context) {
    List<Widget> area() {
      return Assets.jpg.whereTo.values.map((e) {
        String namaTujuan = e.keyName
            .split('/')
            .last
            .replaceAll('.jpg', '')
            .replaceAll('_', ' ')
            .toTitleCase();
        return GestureDetector(
          onTap: () {
            BlocProvider.of<SearchBloc>(context).add(
              ChangeDestinationAddress(
                city: null,
                country: namaTujuan,
              ),
            );
            valueNotif.value = null;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  // Image border
                  child: e.image(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                namaTujuan,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }).toList();
    }

    return BlocProvider.value(
      value: BlocProvider.of<SearchBloc>(context),
      child: Builder(builder: (context) {
        var bloc = BlocProvider.of<SearchBloc>(context);
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, right: 24, left: 24, bottom: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          valueNotif.value = null;
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Where To?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            enableDrag: false,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return BlocProvider.value(
                                value: bloc,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.13,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24.0)),
                                  ),
                                  child: BlocProvider.value(
                                    value: bloc,
                                    child: Builder(builder: (context) {
                                      return AnimatedPadding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        duration:
                                            const Duration(milliseconds: 100),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 42,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: TextFormField(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (value) {
                                                  BlocProvider.of<SearchBloc>(
                                                          context)
                                                      .add(TypingSearch(
                                                          data: value));
                                                },
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey,
                                                ),
                                                decoration: InputDecoration(
                                                  prefixIcon: const Icon(
                                                    Icons.search_rounded,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  hintText:
                                                      'Search Destination City Or Country',
                                                  fillColor: Colors.grey
                                                      .withOpacity(0.3),
                                                  filled: true,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16,
                                                          horizontal: 16),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Expanded(
                                                child: SingleChildScrollView(
                                              child: BlocBuilder<SearchBloc,
                                                  SearchState>(
                                                builder:
                                                    (context, stateSearch) {
                                                  return ListView.builder(
                                                    addAutomaticKeepAlives:
                                                        true,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: stateSearch
                                                        .listResult?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          BlocProvider.of<
                                                                      SearchBloc>(
                                                                  context)
                                                              .add(
                                                            ChangeDestinationAddress(
                                                              city: stateSearch
                                                                  .listResult?[
                                                                      index]
                                                                  .city,
                                                              country: stateSearch
                                                                  .listResult?[
                                                                      index]
                                                                  .country,
                                                            ),
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 24,
                                                            left: 24,
                                                            bottom: 16,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.005),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.3),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 32,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 16,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                    '${stateSearch.listResult?[index].city ?? ''} '),
                                                              ),
                                                              Flexible(
                                                                child: Text(stateSearch
                                                                        .listResult?[
                                                                            index]
                                                                        .country ??
                                                                    ''),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ))
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            },
                          ).then((value) {
                            BlocProvider.of<SearchBloc>(context)
                                .add(const ClearListSearch());
                            valueNotif.value = null;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 0.8)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Search Destination',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(area().length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 24 : 0,
                          right: 16,
                        ),
                        child: area()[index],
                      );
                    })),
                  ),
                ),
                const SizedBox(
                  height: 24,
                )
              ]),
        );
      }),
    );
  }
}
