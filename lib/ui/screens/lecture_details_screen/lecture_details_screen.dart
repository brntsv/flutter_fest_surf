import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:flutter_fest_surf/ui/widgets/easter_egg/easter_egg_bird_widget.dart';
import 'package:flutter_fest_surf/ui/widgets/top_notifications/top_notification_manager.dart';
import 'package:provider/provider.dart';

class LectureDetailsScreen extends StatefulWidget {
  const LectureDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LectureDetailsScreen> createState() => _LectureDetailsScreenState();
}

class _LectureDetailsScreenState extends State<LectureDetailsScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: EasterBirdWidget(scrollController: _scrollController),
            ),
            ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: _scrollController,
              children: const [
                _HeaderWidget(),
                _TitleWidget(),
                _DecriptionWidget(),
                _ScheduleInfoWidget(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const _AddToFavouriteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.detailsGradientBackground,
            fit: BoxFit.fill,
          ),
        ),
        const _SpeakerInfoWidget(),
      ],
    );
  }
}

class _SpeakerInfoWidget extends StatelessWidget {
  const _SpeakerInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 312,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 124),
                Flexible(
                  flex: 56,
                  child: Text(
                    'Алексей\nЧулпин',
                    style: AppTextStyle.speakerName
                        .copyWith(color: AppColors.white88),
                  ),
                ),
                const Spacer(flex: 24),
                Flexible(
                  flex: 40,
                  child: Text('Ведущий\nразработчик МТС',
                      style: AppTextStyle.bookTextItalic
                          .copyWith(color: AppColors.white88.withOpacity(0.6))),
                ),
                const Spacer(flex: 68),
              ],
            ),
          ),
          Positioned(
            right: 20,
            left: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FractionallySizedBox(
                widthFactor: 208 / 375,
                child: Image.asset(
                  AppImages.speakerPhoto,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 32),
      child: Text(
        'Субьективность в оценке дизайна',
        style: AppTextStyle.steinbeckText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _DecriptionWidget extends StatelessWidget {
  const _DecriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
      child: Text(
        'Текст описание краткое лекции. Что будет, раскрытие темы. Думаю, что на три или четыре строки. текста нет, так что пишу, что думаю бла бла бла...',
        style: AppTextStyle.bookText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _ScheduleInfoWidget extends StatelessWidget {
  const _ScheduleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          _ScheduleElementInfoWidget(
            label: 'Старт',
            info: '8:00',
          ),
          SizedBox(width: 16),
          _ScheduleElementInfoWidget(
            label: 'Секция',
            info: '№ 1',
          ),
        ],
      ),
    );
  }
}

class _ScheduleElementInfoWidget extends StatelessWidget {
  final String label;
  final String info;
  const _ScheduleElementInfoWidget({
    Key? key,
    required this.label,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkSecondary,
      ),
      child: GradientBorder(
        strokeWidth: 2,
        radius: 16,
        gradient: const RadialGradient(
          center: Alignment(0.1, -1),
          radius: 1,
          colors: [
            Color(0xFF50AF64),
            Color(0xFF3D734D),
            Color(0xFF3D734D),
            Color(0xFF206D82),
            Color(0xFF0B77C5),
          ],
          stops: [
            0.1,
            0.7,
            0.7,
            0.9,
            1,
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, top: 10, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    AppTextStyle.snackText.copyWith(color: AppColors.darkText),
              ),
              const SizedBox(height: 2),
              Text(
                info,
                style: AppTextStyle.timeText.copyWith(color: AppColors.white88),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorder extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final Widget child;
  const GradientBorder({
    Key? key,
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _GradientPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient,
        ),
        child: child);
  }
}

class _GradientPainter extends CustomPainter {
  final double strokeWidth;

  final double radius;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    final outerRect = Offset.zero & size;
    final outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(radius),
    );

    // create inner rectangle smaller by strokeWidth
    final innerRect = Rect.fromLTWH(
      strokeWidth,
      strokeWidth,
      size.width - strokeWidth * 2,
      size.height - strokeWidth * 2,
    );
    final innerRRect = RRect.fromRectAndRadius(
      innerRect,
      Radius.circular(radius - strokeWidth),
    );

    // apply gradient shader
    final paint = Paint()..shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    final outerPath = Path()..addRRect(outerRRect);
    final innerPath = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, outerPath, innerPath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class _AddToFavouriteButton extends StatelessWidget {
  final isFavourite = false;
  const _AddToFavouriteButton({Key? key}) : super(key: key);

  void showOverlay(BuildContext context) {
    context.read<TopNotificationManager>().show('Лекция добавлена в избранное');

    // showDialog<String>(
    //   context: context,
    //   builder: (BuildContext context) => BackdropFilter(
    //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //     child: const DialogWidgetIos(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final text = isFavourite ? 'В программе' : 'В мою программу';
    final icon = isFavourite ? AppImages.bookmarkFull : AppImages.bookmark;
    final iconColor = isFavourite ? null : AppColors.white88;
    final buttonColor =
        isFavourite ? AppColors.gradientOff : AppColors.gradientGreenBlue;

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: SizedBox(
        height: 48,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: ElevatedButton(
            onPressed: () {
              showOverlay(context);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: buttonColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(icon, color: iconColor),
                    const SizedBox(width: 16),
                    Text(text,
                        style: AppTextStyle.button
                            .copyWith(color: AppColors.white88)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
