import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/utils/app_bar_custom.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/core_module/widgets/floating_map_button.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/bloc/explore_screen_bloc/explore_screen_bloc.dart';
import 'package:video_player/video_player.dart';

class ExploreSearchResultScreen extends StatefulWidget {
  const ExploreSearchResultScreen({
    super.key,
    this.searchFormModel,
  });

  final SearchFormModel? searchFormModel;

  @override
  State<ExploreSearchResultScreen> createState() =>
      _ExploreSearchResultScreenState();
}

class _ExploreSearchResultScreenState extends State<ExploreSearchResultScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ExploreScreenBloc>()..add(InitSearchExplore(data: widget.searchFormModel),),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: SearchBarCustom(
            searchFormModel: (widget.searchFormModel?.searchForm?.guestCount ==
                        null &&
                    widget.searchFormModel?.searchForm?.dateTrip == null)
                ? SearchFormModel(
                    searchForm: SearchForm(
                      dateTrip: DateTrip(
                          isAnytime: true,
                          date: widget
                              .searchFormModel?.searchForm?.dateTrip?.date),
                      guestCount: GuestCount(adult: 0, children: 0, infant: 0),
                      citySelection: CitySelection(isFlexible: true),
                    ),
                  )
                : widget.searchFormModel,
          ),
          body:  ExploreSearchResultBody(searchFormModel: widget.searchFormModel),
        );
      }),
    );
  }
}

class ExploreSearchResultBody extends StatelessWidget {
  const ExploreSearchResultBody({
    super.key,
    this.searchFormModel,
  });

  final SearchFormModel? searchFormModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreScreenBloc, ExploreScreenState>(
      builder: (context, stateExploreScreen) {
        if (stateExploreScreen.searchResult != null) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Text('Activity Type',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Text('Price',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Text('Language Offered',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Flexible(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          ...?(stateExploreScreen.searchResult?['list_banner']
                                  as List?)
                              ?.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 42),
                              child: Column(
                                children: [
                                  Text(e['title'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        color: Colors.grey,
                                        child: VideoItem(
                                            childBanner: e['child_banner']),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children: [
                                          ...List.generate(
                                              e['slide_experience'].length,
                                              (index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 24,
                                                  left: index == 0 ? 16 : 0,
                                                  right: 8),
                                              child: Card(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: 60,
                                                        height: 70,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          // Image border
                                                          child: Image.network(
                                                            e['slide_experience']
                                                                        [index]
                                                                    ['image']
                                                                .first,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .star_rounded,
                                                                size: 10,
                                                              ),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                  e['slide_experience']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'rating']
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          10)),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                  '(${e['slide_experience'][index]['people_count'].toString()})',
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          10)),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 180,
                                                            child: Text(
                                                                e['slide_experience']
                                                                        [index]
                                                                    ['name'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        10)),
                                                          ),
                                                          Text(
                                                              'Hosted by ${e['slide_experience'][index]['hosted_name']}',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      10)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ]),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  'All Experience',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GridView.count(
                                primary: false,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                childAspectRatio: 3 / 5,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                children: <Widget>[
                                  ...(stateExploreScreen
                                              .searchResult?['all_result_item']
                                          ['data'])
                                      ?.map((e) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: Image.network(
                                              e['image'][Random().nextInt(3)],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rounded,
                                              color: Colors.black,
                                              size: 16,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              e['rating'].toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                                '(${e['people_count'].toString()})',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12))
                                          ],
                                        ),
                                        Text(e['title'],
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                        Text('Hosted by ${e['hosted_name']}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12)),
                                        Text(
                                            'From ${e['expected_price']['currency']} ${e['expected_price']['price']}  /${(e['expected_price']['price_per']).toString().toTitleCase()}  ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12)),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    );
                                  }).toList()
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.75),
                      child: FloatingMapButton(
                          searchFormModel: stateExploreScreen.searchFormModel),
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class VideoItem extends StatefulWidget {
  const VideoItem({super.key, this.childBanner});

  final Map<String, dynamic>? childBanner;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.childBanner?['url']))
          ..initialize().then((_) {
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
            child: VideoPlayer(_controller),
          ),
        ),
      ],
    );
  }
}
