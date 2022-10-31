// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/widgets/schedule_row/schedule_row_widget.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const _LogoWidget(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ScheduleRowWidget.single(),
              ScheduleRowWidget.single(),
              ScheduleRowWidget.single(),
            ]),
          )
        ],
      ),
    );
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
              index * itemGradientWidth + halfItemGradientWidth;
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
                        colors: const [Color(0xFF00BD13), Color(0xFF170AF4)],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(80.0))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Секция $index'),
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
