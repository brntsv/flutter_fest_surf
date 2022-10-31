import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return const _SectionChipsWidget();
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionChipsWidget extends StatelessWidget {
  const _SectionChipsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 10,
      itemBuilder: (context, index) {
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
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.blue],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
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
    );
  }
}
