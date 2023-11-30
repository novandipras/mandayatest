import 'dart:math';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandayatest/core_module/bloc/map_expand_bloc/map_expand_bloc.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/utils/app_bar_custom.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/bloc/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:mandayatest/home_module/presentation/pages/home_page.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class FloatingMapButton extends StatelessWidget {
  const FloatingMapButton({
    super.key,
    this.searchFormModel,
  });

  final SearchFormModel? searchFormModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomePage.routeName, arguments: {
          "init_page": 0,
          "explore_widget": MapExpandFromButton(
            searchFormModel: searchFormModel,
          ),
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.map,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Maps',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapExpandFromButton extends StatelessWidget {
  const MapExpandFromButton({
    super.key,
    this.searchFormModel,
  });

  final SearchFormModel? searchFormModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<MapExpandBloc>(),
        ),
        BlocProvider.value(
          value: BlocProvider.of<BottomNavbarBloc>(context),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xffefefef),
          appBar: SearchBarCustom(
            searchFormModel: (searchFormModel?.searchForm?.guestCount == null &&
                    searchFormModel?.searchForm?.dateTrip == null)
                ? SearchFormModel(
                    searchForm: SearchForm(
                      dateTrip: DateTrip(
                          isAnytime: true,
                          date: searchFormModel?.searchForm?.dateTrip?.date),
                      guestCount: GuestCount(adult: 0, children: 0, infant: 0),
                      citySelection: CitySelection(isFlexible: true),
                    ),
                  )
                : searchFormModel,
          ),
          body: MapExpandBody(searchFormModel: searchFormModel),
        );
      }),
    );
  }
}

class MapExpandBody extends StatefulWidget {
  const MapExpandBody({
    this.searchFormModel,
    super.key,
  });

  final SearchFormModel? searchFormModel;

  @override
  State<MapExpandBody> createState() => _MapExpandBodyState();
}

class _MapExpandBodyState extends State<MapExpandBody>
    with AutomaticKeepAliveClientMixin {
  late PanelController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = PanelController();
    scrollController = ScrollController();

    BlocProvider.of<MapExpandBloc>(context).add(
      InitMapExpandEvent(
        searchFormModel: widget.searchFormModel,
      ),
    );
    BlocProvider.of<BottomNavbarBloc>(context).add(
      const ChangeVisible(
        isVisible: false,
      ),
    );
    super.initState();
  }

  Widget pin = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ForceDraggableWidget(
        child: SizedBox(
          width: 100,
          height: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(32),
      topRight: Radius.circular(32),
    );
    return FutureBuilder(
        future: Geolocator.isLocationServiceEnabled(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            double maxHeight = 500;
            double minHeight = 100;

            return BlocBuilder<MapExpandBloc, MapExpandState>(
              builder: (context, stateMapExpand) {
                return SlidingUpPanel(
                  panelBuilder: () => null,
                  parallaxEnabled: true,
                  borderRadius: radius,
                  maxHeight: maxHeight,
                  minHeight: minHeight,
                  controller: controller,
                  header: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: maxHeight,
                    child: Column(
                      children: [
                        pin,
                        Center(
                          child: Text(
                            "${stateMapExpand.listDataExperienceOnMap?.length ?? 0} Experience",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                            child: DraggableScrollbar.semicircle(
                          alwaysVisibleScrollThumb: true,
                          controller: scrollController,
                          child: GridView.count(
                            controller: scrollController,
                            addAutomaticKeepAlives: true,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            childAspectRatio: 3 / 5,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              ...?(stateMapExpand.listDataExperienceOnMap)
                                  ?.map((e) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Image.network(
                                          e['image'].first,
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
                                                fontWeight: FontWeight.normal,
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
                              })
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  onPanelOpened: () {
                    BlocProvider.of<MapExpandBloc>(context).add(
                      const SelectMarker(
                        experience: null,
                      ),
                    );
                  },
                  defaultPanelState: PanelState.OPEN,
                  parallaxOffset: 0.6,
                  collapsed: Container(
                    height: minHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: radius,
                    ),
                    child: Column(
                      children: [
                        pin,
                        Center(
                          child: Text(
                            "${stateMapExpand.listDataExperienceOnMap?.length ?? 0} Experience",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: Stack(
                    children: [
                      MapScreen(
                        controller: controller,
                        initLatLong: LatLng(
                            stateMapExpand.listDataExperienceOnMap
                                ?.first['address']['latitude'],
                            stateMapExpand.listDataExperienceOnMap
                                ?.first['address']['longitude']),
                      ),
                      if (stateMapExpand.selectedExperience != null)
                        Align(
                          alignment: const Alignment(0.0, 0.33),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: AspectRatio(
                              aspectRatio: 5/2,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width * 0.3,
                                          height: 100,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            // Image border
                                            child: Image.network(
                                              stateMapExpand
                                                  .selectedExperience?['image'].first,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Icon(
                                                    Icons.star_rounded,
                                                    size: 10,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                      stateMapExpand
                                                          .selectedExperience!['rating']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 10)),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                      '(${stateMapExpand.selectedExperience?['people_count'].toString()})',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: 10)),
                                                ],
                                              ),
                                              const SizedBox(height: 8,),
                                              Flexible(
                                                child: Text(
                                                    stateMapExpand
                                                        .selectedExperience?['name'],
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 10)),
                                              ),
                                              Text(
                                                  'Hosted by ${stateMapExpand.selectedExperience?['hosted_name']}',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 10)),
                                              const SizedBox(
                                                height: 32,
                                              ),
                                              Text(
                                                  'From ${stateMapExpand.selectedExperience?['expected_price']['currency']} ${stateMapExpand.selectedExperience?['expected_price']['price']}  /${(stateMapExpand.selectedExperience?['expected_price']['price_per']).toString().toTitleCase()}  ',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 10))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<MapExpandBloc>(context).add(
                                            const SelectMarker(
                                              experience: null,
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.clear_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        )),
                                  )
                                ],

                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.initLatLong,
    this.controller,
  });

  final PanelController? controller;

  final LatLng initLatLong;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng initialLocation;

  @override
  void initState() {
    initialLocation = widget.initLatLong;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapExpandBloc, MapExpandState>(
      builder: (context, stateMapExpand) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 12,
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height *
                ((stateMapExpand.selectedExperience == null) ? 0.28 : 0.47),
          ),
          markers: Set.of((stateMapExpand.listDataExperienceOnMap ?? []).map(
            (e) {
              return Marker(
                onTap: () {
                  widget.controller?.close();
                  BlocProvider.of<MapExpandBloc>(context).add(
                    SelectMarker(
                      experience: e,
                    ),
                  );
                },
                markerId: MarkerId(e['id_experience']),
                position: LatLng(
                  e['address']['latitude'],
                  e['address']['longitude'],
                ),
              );
            },
          )),
        );
      },
    );
  }
}
