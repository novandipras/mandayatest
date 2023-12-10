import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/keep_alive_widget.dart';
import 'package:mandayatest/home_module/presentation/bloc/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:mandayatest/home_module/presentation/pages/explore_screen.dart';
import 'package:mandayatest/home_module/presentation/pages/null_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.initPage,
    this.exploreWidget,
  });

  final int? initPage;
  final Widget? exploreWidget;

  static const String routeName = '/HomePages';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late ValueNotifier<Widget?> vnExplore;
  late List<Widget> listWidget;

  @override
  void initState() {
    vnExplore = ValueNotifier(widget.exploreWidget);
    pageController = PageController(initialPage: widget.initPage ?? 0);
    listWidget = [
      ValueListenableBuilder(
        valueListenable: vnExplore,
        builder: (context, value, child) {
          if (value == null) {
            return const ExploreScreen();
          } else {
            return value;
          }
        },
      ),
      const NullPage(),
      const NullPage(),
      const NullPage(),
      const NullPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BottomNavbarBloc>(),
      child: Builder(builder: (context) {
        return HomeBody(
          pageController: pageController,
          vnExplore: vnExplore,
          pageList: listWidget,
        );
      }),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.pageController,
    required this.pageList,
    required this.vnExplore,
  });

  final PageController pageController;
  final List<Widget> pageList;
  final ValueNotifier<Widget?> vnExplore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      body: Stack(
        children: [
          BlocListener<BottomNavbarBloc, BottomNavbarState>(
            listener: (context, state) {
              pageController.jumpToPage(state.index!);
            },
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              controller: pageController,
              children: pageList
                  .map((e) => KeepAliveWidget(
                        child: e,
                      ))
                  .toList(),
            ),
          ),
          BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
            builder: (context, stateBottomNavbar) {
              bool visibleStatus = stateBottomNavbar.isVisible ?? true;
              return Visibility(
                visible: visibleStatus,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppBottomNavigationBar(
                      vnExplore: vnExplore, visibleStatus: visibleStatus),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.vnExplore,
    required this.visibleStatus,
  });

  final ValueNotifier<Widget?> vnExplore;
  final bool visibleStatus;

  @override
  Widget build(BuildContext context) {
    double tinggiNavBar = 110;
    double tinggiBackground = 64;

    void changeIndex(int index) {
      BlocProvider.of<BottomNavbarBloc>(context).add(ChangeIndex(
        index: index,
        isVisible: visibleStatus,
      ));
    }

    List<Widget> items = [
      ItemNavbar(
        index: 0,
        icon: Assets.svg.tabExplore.path,
        title: 'Explore',
        onTap: () {
          vnExplore.value = null;
          changeIndex(0);
        },
      ),
      ItemNavbar(
        index: 1,
        icon: Assets.svg.tabWhislist.path,
        title: 'Whises',
        onTap: () {
          changeIndex(1);
        },
      ),
      ItemNavbar(
        index: 2,
        icon: Assets.svg.tabTrips.path,
        title: 'Trips',
        onTap: () {
          changeIndex(2);
        },
      ),
      ItemNavbar(
        index: 3,
        icon: Assets.svg.tabInbox.path,
        title: 'Inbox',
        onTap: () {
          changeIndex(3);
        },
      ),
      ItemNavbar(
        index: 4,
        icon: Assets.svg.tabProfile.path,
        title: 'Profile',
        onTap: () {
          changeIndex(4);
        },
      ),
    ];

    return SizedBox(
      height: tinggiNavBar,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: tinggiBackground,
              width: double.infinity,
              color: const Color(0xffffffff),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.from(items),
            ),
          )
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    super.key,
    this.icon,
    required this.index,
    this.title,
    this.onTap,
  });

  final String? icon;
  final int index;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      builder: (context, state) {
        var color =
            index == state.index ? const Color(0xffFF5A5F) : Colors.grey;
        return GestureDetector(
          onTap: onTap,
          child: Container(
              width: 60,
              height: 70,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      fit: BoxFit.contain,
                      icon!,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    title ?? '',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

class CenterHolePath extends CustomClipper<Path> {
  final double radius;

  CenterHolePath({
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(
        Rect.fromCenter(
            center: Offset(size.width / 2, -15), width: radius, height: radius),
      )
      ..addRect(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CenterHolePath oldClipper) {
    return radius != oldClipper.radius;
  }
}
