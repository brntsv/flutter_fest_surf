import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          // _SpeakerPhoto(),
          Spacer(),
          _AddToFavouriteButton(),
        ],
      ),
    );
  }
}

class _SpeakerPhoto extends StatelessWidget {
  const _SpeakerPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 342,
    );
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
      child: Center(
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
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
      ),
    );
  }
}
