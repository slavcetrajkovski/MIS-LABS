import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карта со настани')),
      body: Consumer<EventProvider>(
        builder: (context, eventProvider, child) {
          final events = eventProvider.events;

          final markers = events.map((event) {
            return Marker(
              markerId: MarkerId(event.title),
              position: LatLng(event.latitude, event.longitude),
              infoWindow:
                  InfoWindow(title: event.title, snippet: event.location),
            );
          }).toSet();

          if (_markers != markers) {
            _markers = markers;
          }

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(41.9981, 21.4254),
              zoom: 6,
            ),
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          );
        },
      ),
    );
  }
}
