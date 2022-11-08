import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class ScheduleRowBreakWidget extends StatelessWidget {
  const ScheduleRowBreakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _BreakDecoratorWidget(reversed: true)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Text(
            'ПЕРЕРЫВ',
            style:
                AppTextStyle.breakTimeSmall.copyWith(color: AppColors.white88),
          ),
        ),
        const Expanded(child: _BreakDecoratorWidget(reversed: false)),
      ],
    );
  }
}

class _BreakDecoratorWidget extends StatelessWidget {
  final bool reversed;

  const _BreakDecoratorWidget({Key? key, required this.reversed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 7),
      painter: _BreakDecoratorPainter(reversed),
    );
  }
}

class _BreakDecoratorPainter extends CustomPainter {
  final bool reversed;

  const _BreakDecoratorPainter(this.reversed);

  @override
  void paint(Canvas canvas, Size size) {
    const spaceWidth = 6.96; // отступ между векторами
    const itemWidth = 2.96; // задаёт наклон вектора
    const itemOffset = 7.0; // разрыв между последовательностями векторов
    final itemsCount = (size.width / itemOffset).floor() + 1;
    // берем ширину экрана, делим на разрыв, округляем в меньшую сторону
    // + 1 это подгон под дизайн чтобы отрисовать нужное количество векторов

    final paint = Paint()
      ..color = AppColors.darkText
      ..strokeWidth = 2 // ширина вектора
      ..strokeCap = StrokeCap.round; // скругление на концах

    for (var i = 0; i < itemsCount; i++) {
      final xOffset = spaceWidth * i;
      final start = Offset(xOffset + itemWidth, 0);
      final end = Offset(xOffset, size.height + 2);

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BreakDecoratorPainter oldDelegate) {
    return oldDelegate.reversed != reversed;
  }
}
