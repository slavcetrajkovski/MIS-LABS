import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:laboratory_4/models/event.dart';

class LocationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> checkProximityToEvent(Event event) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      event.latitude,
      event.longitude,
    );

    if (distance < 100) {
      // ако е помалку од 100 метри
      _showNotification(event);
    }
  }

  Future<void> _showNotification(Event event) async {
    var androidDetails = const AndroidNotificationDetails(
      'event_channel',
      'Event Notifications',
      channelDescription: 'Notifications for events',
      importance: Importance.high,
      priority: Priority.high,
    );
    var platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Пристигнавте на настанот!',
      'Најдете се во близина на настанот: ${event.title}',
      platformDetails,
    );
  }
}
