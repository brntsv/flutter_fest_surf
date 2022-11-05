import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({Key? key}) : super(key: key);

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
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: const [
            _HeaderWidget(),
            _TitleWidget(),
            _DecriptionWidget(),
            _ScheduleInfoWidget(),
          ],
        ),
      ),
      floatingActionButton: const _AddToFavouriteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
    return Container();
  }
}

class _AddToFavouriteButton extends StatelessWidget {
  final isFavourite = false;
  const _AddToFavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = isFavourite ? 'В программе' : 'В мою программу';
    final icon = isFavourite ? AppImages.bookmarkFull : AppImages.bookmark;
    final iconColor = isFavourite ? null : AppColors.white88;
    final buttonColor =
        isFavourite ? AppColors.gradientOff : AppColors.gradientGreenBlue;

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
      child: SizedBox(
        height: 48,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: ElevatedButton(
            onPressed: () {},
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
