import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];

  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  static const Point _point = Point(latitude: 55.692318, longitude: 37.347485);
  final animation = const MapAnimation(
    type: MapAnimationType.smooth,
    duration: 2.0,
  );
  bool nightModeEnabled = true;

  final String style = '''
    [
      {
        "tags": {
          "all": ["landscape"]
        },
        "stylers": {
          "color": "000000",
          "lightness": -1
        }
      },
      {
        "tags": {
          "all": ["water"]
        },
        "stylers": {
          "color": "3b3b3b",
          "lightness": -1
        }
      },
      {
        "tags": {
          "all": ["road"]
        },
        "stylers": {
          "color": "2b2b2b",
          "lightness": -1
        }
      },
      {
        "tags": {
          "all": ["structure"]
        },
        "stylers": {
          "color": "4a4a4a",
          "lightness": 1
        }
      },
      {
        "tags": {
          "all": ["entrance"]
        },
        "stylers": {
          "color": "000000",
          "lightness": 1
        }
      },
      {
        "tags": {
          "all": ["admin"],
          "none": ["district"]
        },
        "stylers": {
          "color": "000000",
          "lightness": 1
        }
      },
      {
        "tags": {
          "all": ["address"]
        },
        "stylers": {
          "color": "b0b0b0",
          "lightness": 1
        }
      },
      {
        "tags": {
          "all": ["locality"]
        },
        "elements": ["label.text.fill"],
        "stylers": {
          "color": "009e10",
          "lightness": 1
        }
      },
      {
        "tags": {
          "all": ["district"]
        },
        "elements": ["label.text.fill"],
        "stylers": {
          "color": "424242",
          "lightness": 1
        }
      }
    ]
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
              _onMapCreated(controller);
            },
            logoAlignment: const MapAlignment(
                horizontal: HorizontalAlignment.center,
                vertical: VerticalAlignment.top),
            nightModeEnabled: nightModeEnabled,
          ),
          const _AdressWidget(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () async {
            await controller.moveCamera(CameraUpdate.zoomOut(),
                animation: animation);
          },
          backgroundColor: AppColors.white88,
          child: Image.asset(AppImages.routes, width: 30, height: 30),
        ),
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) async {
    await controller.moveCamera(
        CameraUpdate.newCameraPosition(const CameraPosition(target: _point)),
        animation: animation);
    await controller.setMapStyle(style);
  }
}

class _AdressWidget extends StatelessWidget {
  const _AdressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.darkSecondary,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          constraints: const BoxConstraints(maxWidth: 370),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      'Технопарк «Сколково»',
                      style: AppTextStyle.steinbeckText.copyWith(
                        color: AppColors.white88,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Image.asset(AppImages.metro),
                    const SizedBox(width: 10),
                    Text(
                      'Славянский бульвар',
                      style: AppTextStyle.bookText.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      'Адрес',
                      style: AppTextStyle.snackText.copyWith(
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'Москва, Большой бул., 42, стр. 1,\nИнновационный центр Сколково',
                      style: AppTextStyle.bookText.copyWith(
                        color: AppColors.white88,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
