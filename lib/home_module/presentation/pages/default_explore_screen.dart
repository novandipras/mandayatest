import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandayatest/core_module/utils/app_extension.dart';
import 'package:mandayatest/core_module/widgets/floating_map_button.dart';
import 'package:mandayatest/home_module/presentation/bloc/explore_screen_bloc/explore_screen_bloc.dart';

class DefaultExploreScreen extends StatelessWidget {
  const DefaultExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              child: BlocBuilder<ExploreScreenBloc, ExploreScreenState>(
                builder: (context, stateExploreScreen) {
                  return ListView.builder(
                    itemCount: stateExploreScreen.listCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var color = stateExploreScreen.listCategory[index] ==
                          stateExploreScreen.selectedCategory
                          ? Colors.black
                          : Colors.grey;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: color,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 16 : 0,
                              right: stateExploreScreen.listCategory[index] ==
                                  stateExploreScreen.listCategory.last
                                  ? 16
                                  : 8),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<ExploreScreenBloc>(context).add(
                                  ChangeCategory(
                                      stateExploreScreen.listCategory[index]));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: SvgPicture.asset(
                                    stateExploreScreen.listCategory[index]
                                    ['svg'],
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                        color, BlendMode.srcIn),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    stateExploreScreen.listCategory[index]
                                    ['title'] ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(child: BlocBuilder<ExploreScreenBloc, ExploreScreenState>(
              builder: (context, stateExploreScreen) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: ListView.builder(
                    itemCount: stateExploreScreen.listExperience.length,
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: stateExploreScreen.listExperience[index]
                        ['type'] ==
                            stateExploreScreen.selectedCategory['title'],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  // Image border
                                  child: ImageSlider(
                                      imageList: stateExploreScreen
                                          .listExperience[index]['image']),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      stateExploreScreen.listExperience[index]
                                      ['title'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
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
                                        stateExploreScreen.listExperience[index]
                                        ['rating']
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                stateExploreScreen.listExperience[index]
                                ['name'],
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: stateExploreScreen
                                          .listExperience[index]
                                      ['available_date']
                                          .first['start']
                                          .toString()
                                          .toHariTanggalanSimpleDate(),
                                    ),
                                    const TextSpan(
                                      text: ' - ',
                                    ),
                                    TextSpan(
                                      text: stateExploreScreen
                                          .listExperience[index]
                                      ['available_date']
                                          .first['end']
                                          .toString()
                                          .toHariTanggalanSimpleDate(),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'From '),
                                    TextSpan(
                                      text: stateExploreScreen
                                          .listExperience[index]
                                      ['expected_price']['currency'],
                                    ),
                                    TextSpan(
                                      text:
                                      " ${stateExploreScreen
                                          .listExperience[index]['expected_price']['price']
                                          .toString()}",
                                    ),
                                    TextSpan(
                                      text:
                                      " - /${stateExploreScreen
                                          .listExperience[index]['expected_price']['price_per']
                                          .toString()
                                          .toTitleCase()}",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )),
          ],
        ),
        Align(
          alignment: const Alignment(0, 0.75),
          child: BlocBuilder<ExploreScreenBloc, ExploreScreenState>(
            builder: (context, stateExploreScreen) {
              return FloatingMapButton(searchFormModel: stateExploreScreen.searchFormModel);
            },
          ),
        )
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    this.imageList,
  });

  final List<String>? imageList;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            aspectRatio: 1 / 1,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.imageList?.map((urlImage) {
            return AspectRatio(
              aspectRatio: 1 / 1,
              child: Builder(
                builder: (BuildContext context) {
                  return Image.network(urlImage, fit: BoxFit.cover,);
                },
              ),
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageList!.map((item) {
                int index =
                widget.imageList!.indexWhere((element) => element == item);
                return GestureDetector(
                  onTap: () => _controller.animateToPage(index),
                  child: Container(
                    width: 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme
                          .of(context)
                          .brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white)
                          .withOpacity(_current == index ? 1 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
