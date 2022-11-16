import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/app/app.dart';
import 'package:flutter_fest_surf/ui/screens/favourite_screen/model/favourites_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<FavouritesModel>(
      child: MyApp(),
      create: (_) => FavouritesModel(),
    ),
  );
}
