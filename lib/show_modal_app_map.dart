import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

  //PersistentBottomSheetController sheetController;

  openMapsSheet(context,{@required double latLng,@required double lngLng}) async {
    try {
      final coords = Coords(latLng, lngLng);
      //final title = "Ocean Beach";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () {
                          // map.showMarker(
                          //   coords: coords,
                          //   //title: title,
                          // );
                          Navigator.pop(context);
                          map.showDirections(
                            destination: coords,
                            //title: title,
                          );
                        },
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

openMapsMark(context,title,{@required double latLng,@required double lngLng}) async {
  try {
    final coords = Coords(latLng, lngLng);
    //final title = "Ocean Beach";
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () {
                        map.showMarker(
                          coords: coords,
                          title: title,
                        );
                        Navigator.pop(context);
                        // map.showDirections(
                        //   destination: coords,
                        //   //title: title,
                        // );
                      },
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } catch (e) {
    print(e);
  }
}
