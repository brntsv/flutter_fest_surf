import 'package:flutter/cupertino.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:flutter_fest_surf/ui/widgets/easter_egg/easter_egg_bird_widget.dart';

class FavourireScreenWidget extends StatefulWidget {
  const FavourireScreenWidget({Key? key}) : super(key: key);

  @override
  State<FavourireScreenWidget> createState() => _FavourireScreenWidgetState();
}

class _FavourireScreenWidgetState extends State<FavourireScreenWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
              const _HeaderWidget(),
              const _NotificationControlWidget(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: ScheduleRowWidget.single(),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Моя',
              style: AppTextStyle.steinbeckHeadItalic
                  .copyWith(color: AppColors.white88),
            ),
            Text(
              'программа',
              style: AppTextStyle.steinbeckHeadNormal
                  .copyWith(color: AppColors.white88),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationControlWidget extends StatelessWidget {
  const _NotificationControlWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.darkSecondary,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    'Напоминать мне о лекциях\nза 10 минут до начала',
                    style: AppTextStyle.bookText
                        .copyWith(color: AppColors.white88),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: AppColors.green,
                  thumbColor: AppColors.darkSecondary,
                  trackColor: AppColors.darkText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}