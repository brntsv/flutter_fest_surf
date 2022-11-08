import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/screens/main_tabs/lecture_details_screen.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:flutter_fest_surf/ui/widgets/dialogs/dialog_widget_ios.dart';
import 'package:flutter_fest_surf/ui/widgets/schedule_row/schedule_row_break_widget.dart';
import 'package:flutter_fest_surf/ui/widgets/schedule_row/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest_surf/ui/widgets/top_notifications/top_notification_manager.dart';
import 'package:provider/provider.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  final _scrollController = ScrollController();

  void showOverlay(BuildContext context) {
    context.read<TopNotificationManager>().show('Лекция добавлена в избранное');

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: const DialogWidgetIos(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final List<ScheduleRowLectureWidgetConfiguration> _listOfLectures = [];

    return SafeArea(
      top: false,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: -100,
            child: EasterBirdWidget(scrollController: _scrollController),
          ),
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              const _LogoWidget(),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(topInset: topInset),
              ),
              // /////////  TEST   ////////////
              SliverToBoxAdapter(
                  child: ElevatedButton(
                      onPressed: () {
                        return showOverlay(context);
                      },
                      child: const Text('data'))),
              // /////////  TEST   ////////////
              SliverList(
                delegate:
                    // SliverChildListDelegate([
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                    //     child: ScheduleRowWidget.multi(key: key),
                    //   ),
                    // ]),

                    SliverChildBuilderDelegate(
                  (context, index) {
                    // if ((index + 1) % 3 == 0) {
                    //   return const Padding(
                    //     padding: EdgeInsets.only(left: 14, right: 14, top: 16),
                    //     child:
                    //         SizedBox(height: 70, child: ScheduleRowBreakWidget()),
                    //   );
                    // }
                    return ScheduleRowWidget.multi();
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 204,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(AppImages.toplogoGradient),
            ),
            Positioned(
              top: 84,
              left: 20,
              child: Image.asset(AppImages.toplogoFlutterFest),
            ),
            Positioned(
              top: 65,
              right: 20,
              child: Image.asset(AppImages.toplogoSurf),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  // final double topInset;

  // _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height + topInset;
  @override
  double get maxExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _SectionChipsWidget(topInset: topInset);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionChipsWidget extends StatelessWidget {
  final double topInset;
  const _SectionChipsWidget({Key? key, required this.topInset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const totalItem = 4; // всего chips
    const itemGradientWidth = 2.0;
    const halfItemGradientWidth = itemGradientWidth / 2;
    const endGradientPoint =
        totalItem * itemGradientWidth + halfItemGradientWidth;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 20, right: 20, top: topInset),
        itemCount: totalItem,
        itemBuilder: (context, index) {
          final currentGradientStartPoint =
              index++ * itemGradientWidth + halfItemGradientWidth;
          final currentGradientEndPoint =
              endGradientPoint - currentGradientStartPoint;

          return Center(
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-currentGradientStartPoint, 0.0),
                        end: Alignment(currentGradientEndPoint, 0.0),
                        colors: const [AppColors.green, AppColors.blue],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(80.0))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Секция $index',
                        style: AppTextStyle.bookText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class EasterBirdWidget extends StatefulWidget {
  final ScrollController scrollController;

  const EasterBirdWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<EasterBirdWidget> createState() => _EasterBirdWidgetState();
}

class _EasterBirdWidgetState extends State<EasterBirdWidget> {
  late ScrollController _scrollController;
  var _easterBirdScale = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;

    _scrollController.addListener(_onChangeScrollOffset);
  }

  @override
  void didUpdateWidget(covariant EasterBirdWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.scrollController, widget.scrollController)) {
      _scrollController.removeListener(_onChangeScrollOffset);
      _scrollController = widget.scrollController;
      _scrollController.addListener(_onChangeScrollOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _easterBirdScale,
      child: Image.asset(AppImages.easterBirdLarge),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onChangeScrollOffset);
    super.dispose();
  }

  void _onChangeScrollOffset() {
    // _scrollController.offset;
    // offset - это тот размер, на который контент проскроллен

    // _scrollController.position.maxScrollExtent;
    // maxScrollExtent - это максимальная величина контента, на которую он
    // может проскроллиться
    final offset =
        _scrollController.offset - _scrollController.position.maxScrollExtent;
    // узнаем на сколько залезли за предел скролла
    setState(() {
      if (offset >= 0) {
        _easterBirdScale = offset / 180;
      }
    });
  }
}
