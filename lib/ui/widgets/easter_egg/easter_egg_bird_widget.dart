import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';

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
        _easterBirdScale = offset / 220;
      }
    });
  }
}
