import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';

class MapScreen extends StatefulWidget {
  final String map;
  const MapScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController? controller;
  double? lat;
  double? lng;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        lat = double.parse(widget.map.split(',').first);
        lng = double.parse(widget.map.split(',')[1]);
        controller = MapController(
          initMapWithUserPosition: false,
          initPosition: GeoPoint(
            latitude: lat!,
            longitude: lng!,
          ),
        );
        controller?.init();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CTheme.of(context).theme.primary[10],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller?.goToLocation(GeoPoint(latitude: lat!, longitude: lng!));
        },
        backgroundColor: CTheme.of(context).theme.primary[10],
        child: const Icon(
          Icons.location_on_sharp,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: controller != null
            ? OSMFlutter(
                controller: controller!,
                trackMyPosition: false,
                initZoom: 14,
                minZoomLevel: 8,
                maxZoomLevel: 18,
                stepZoom: 2.0,
                onMapIsReady: (p0) {
                  setState(() {
                    controller?.addMarker(
                      GeoPoint(
                        latitude: lat!,
                        longitude: lng!,
                      ),
                      markerIcon: MarkerIcon(
                        icon: Icon(
                          Icons.person_pin_circle,
                          color: Colors.transparent,
                          size: 48.h,
                        ),
                      ),
                    );
                  });
                },
                roadConfiguration: const RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
                mapIsLoading: const Center(child: CircularProgressIndicator()),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
