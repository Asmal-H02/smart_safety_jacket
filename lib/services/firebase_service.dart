import 'package:firebase_database/firebase_database.dart';

import '../models/sensor_data.dart';


class FirebaseService {


  final DatabaseReference _sensorRef =
      FirebaseDatabase.instance.ref("sensor");


  final DatabaseReference _gpsRef =
      FirebaseDatabase.instance.ref("gps");



  Stream<SensorData> getSensorData() {


    return _sensorRef.onValue.asyncMap((sensorEvent) async {


      final sensorData =
          sensorEvent.snapshot.value
          as Map<dynamic, dynamic>?;


      final gpsSnapshot =
          await _gpsRef.get();


      final gpsData =
          gpsSnapshot.value
          as Map<dynamic, dynamic>?;



      return SensorData(

        temperature:
            double.tryParse(
              sensorData?['temperature'].toString() ?? "0",
            ) ?? 0,


        humidity:
            double.tryParse(
              sensorData?['humidity'].toString() ?? "0",
            ) ?? 0,


        gas:
            int.tryParse(
              sensorData?['gas'].toString() ?? "0",
            ) ?? 0,


        heartRate:
            int.tryParse(
              sensorData?['heartbeat'].toString() ?? "0",
            ) ?? 0,


        fall:
            sensorData?['fall'] ?? false,


        latitude:
            gpsData?['latitude']?.toString() ?? "0.0000",


        longitude:
            gpsData?['longitude']?.toString() ?? "0.0000",

      );


    });


  }


}