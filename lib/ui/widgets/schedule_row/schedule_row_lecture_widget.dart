import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/app_fonts.dart';
import 'package:flutter_fest_surf/resources/resources.dart';

class ScheduleRowLectureWidget extends StatelessWidget {
  const ScheduleRowLectureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 112,
      padding: const EdgeInsets.only(top: 4, left: 16, right: 8, bottom: 16),
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(child: _SpeakerWidget()),
              _FavouriteButton(),
            ],
          ),
          const _DescriptionWidget(),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  const _SpeakerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
          ),
          radius: 12,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Иннокентий Христорожденный',
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesqueProFont,
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        )
      ],
    );
  }
}

class _FavouriteButton extends StatelessWidget {
  const _FavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(AppImages.bookmark),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        'Название лекции',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.white.withOpacity(0.88),
          fontSize: 18,
          fontFamily: AppFonts.steinbeckFont,
          fontWeight: FontWeight.w400,
          height: 1.22,
        ),
      ),
    );
  }
}
