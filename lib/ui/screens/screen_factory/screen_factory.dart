import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/screens/lecture_details_screen/lecture_details_screen.dart';
import 'package:flutter_fest_surf/ui/screens/main/main_screen.dart';
import 'package:flutter_fest_surf/ui/screens/main/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
        create: ((_) => MainTabsViewModel()),
        child: const MainScreen(),
      );

  Widget makeLectureDetails() => const LectureDetailsScreen();

  // Если нужно будет внедрить модель в этот скрин
  // Widget makeLectureDetails() => ChangeNotifierProvider(
  //       create: ((_) => LectureDetailsModel()),
  //       child: const LectureDetailsScreen(),
  //     );
}
