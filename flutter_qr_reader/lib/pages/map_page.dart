import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    final location = scan.getLanLng();

    Completer<GoogleMapController> _controller = Completer();
    CameraPosition _initialPoint =
        CameraPosition(target: location, zoom: 17.5, tilt: 50);

    Set<Marker> markers = <Marker>{};
    markers.add(
        Marker(markerId: const MarkerId('geo-location'), position: location));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: location, zoom: 17.5, tilt: 50)));
              },
              icon: const Icon(Icons.location_searching_rounded))
        ],
      ),
      body: GoogleMap(
        // myLocationButtonEnabled: false,
        // zoomControlsEnabled: false,
        mapType: mapType,
        initialCameraPosition: _initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          mapType =
              mapType == MapType.normal ? MapType.satellite : MapType.normal;
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
