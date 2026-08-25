import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/firebase_service.dart';
import '../models/sensor_data.dart';


Future<void> openGoogleMaps(
    double latitude,
    double longitude,
) async {

  final Uri googleMapsUrl = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
  );


  await launchUrl(
    googleMapsUrl,
    mode: LaunchMode.externalApplication,
  );

}



class MapScreen extends StatelessWidget {

  const MapScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Live Location",
        ),
        centerTitle: true,
      ),



      body: StreamBuilder<SensorData>(

        stream: FirebaseService().getSensorData(),


        builder: (context, snapshot) {


          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          }


          final sensor = snapshot.data!;


          final double latitude =
              double.tryParse(sensor.latitude) ?? 0;


          final double longitude =
              double.tryParse(sensor.longitude) ?? 0;



          return Column(

            children: [


              Expanded(

                child: FlutterMap(

                  options: MapOptions(

                    initialCenter: LatLng(
                      latitude,
                      longitude,
                    ),

                    initialZoom: 15,

                  ),



                  children: [


                    TileLayer(

                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                      userAgentPackageName:
                      'com.example.smart_safety_jacket',

                    ),



                    MarkerLayer(

                      markers: [

                        Marker(

                          point: LatLng(
                            latitude,
                            longitude,
                          ),


                          width: 60,

                          height: 60,


                          child: const Icon(

                            Icons.location_on,

                            color: Colors.red,

                            size: 45,

                          ),

                        ),

                      ],

                    ),


                  ],

                ),

              ),



              Container(

  padding: const EdgeInsets.all(16),


  child: Column(

    children: [


      Text(

        "Latitude: $latitude\n"
        "Longitude: $longitude",

        textAlign: TextAlign.center,


        style: const TextStyle(

          fontSize: 16,

          fontWeight: FontWeight.bold,

        ),

      ),



      const SizedBox(height: 12),



      ElevatedButton.icon(

        onPressed: () {

          openGoogleMaps(
            latitude,
            longitude,
          );

        },


        icon: const Icon(
          Icons.map,
        ),


        label: const Text(
          "Open in Google Maps",
        ),


      ),


    ],

  ),

),


            ],

          );


        },

      ),

    );

  }

}