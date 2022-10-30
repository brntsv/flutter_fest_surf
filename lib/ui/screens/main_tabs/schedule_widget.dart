import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ddd = MediaQuery.of(context).padding.top;

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.toplogoGradient),
          fit: BoxFit.none,
          alignment: Alignment.topLeft,
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const _LogoWidget(),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(color: Colors.pink, height: 150),
                Container(color: Colors.green, height: 150),
                Container(color: Colors.blue, height: 150),
                Container(color: Colors.deepPurple, height: 150),
                Container(color: Colors.pink, height: 150),
                Container(color: Colors.green, height: 150),
                Container(color: Colors.blue, height: 150),
                Container(color: Colors.deepPurple, height: 150),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 20,
              child: Image.asset(AppImages.toplogoFlutterFest),
            ),
            Positioned(
              top: 41,
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

  // final double topInset;

  // _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Text('$shrinkOffset, $overlapsContent'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
