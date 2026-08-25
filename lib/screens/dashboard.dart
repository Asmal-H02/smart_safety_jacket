import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
import '../widgets/sensor_card.dart';
import '../widgets/custom_card.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';


class Dashboard extends StatefulWidget {

  const Dashboard({
    super.key,
  });


  @override
  State<Dashboard> createState() => _DashboardState();

}



class _DashboardState extends State<Dashboard> {


  final FirebaseService _firebaseService = FirebaseService();



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: StreamBuilder(

        stream: _firebaseService.getSensorData(),


        builder: (context, snapshot) {


          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(

              child: CircularProgressIndicator(),

            );

          }



          if (snapshot.hasError) {

            return Center(

              child: Text(
                "Error: ${snapshot.error}",
              ),

            );

          }



          if (!snapshot.hasData) {

            return const Center(

              child: Text(
                "Waiting for sensor data...",
              ),

            );

          }



          final sensor = snapshot.data!;



          String gasStatus;

          Color gasColor;



          if (sensor.gas < 300) {

            gasStatus = "SAFE";

            gasColor = AppColors.success;


          } else if (sensor.gas < 800) {

            gasStatus = "WARNING";

            gasColor = AppColors.warning;


          } else {

            gasStatus = "DANGER";

            gasColor = AppColors.error;

          }





          return SingleChildScrollView(

            padding: const EdgeInsets.all(
              AppSpacing.lg,
            ),


            child: Column(


              crossAxisAlignment:
                  CrossAxisAlignment.start,


              children: [



                // Header

              const SizedBox(
  height: 20,
),


// Header

Text(
  "Good Morning",
  style: AppTextStyles.headline.copyWith(
    fontSize: 26,
  ),
),


const SizedBox(
  height: 6,
),


Text(
  "Smart Safety Jacket",
  style: AppTextStyles.subtitle.copyWith(
    fontSize: 16,
  ),
),


const SizedBox(
  height: 28,
),
                




                // Connection Status


                CustomCard(


                  child: Row(


                    children: [


                      Container(

                        padding:
                            const EdgeInsets.all(12),


                        decoration:
                            BoxDecoration(

                          color:
                              AppColors.primaryLight,


                          borderRadius:
                              BorderRadius.circular(16),

                        ),



                        child: const Icon(

                          Icons.wifi,

                          color:
                              AppColors.primaryDark,

                        ),

                      ),



                      const SizedBox(

                        width:
                            AppSpacing.md,

                      ),




                      const Expanded(


                        child: Column(


                          crossAxisAlignment:
                              CrossAxisAlignment.start,


                          children: [


                            Text(

                              "Jacket Connection",

                              style:
                                  AppTextStyles.sensorTitle,

                            ),



                            Text(

                              "Connected to Firebase",

                              style:
                                  AppTextStyles.subtitle,

                            ),


                          ],


                        ),


                      ),




                      Container(


                        padding:
                            const EdgeInsets.symmetric(

                          horizontal: 14,

                          vertical: 8,

                        ),




                        decoration:
                            BoxDecoration(


                          color:
                              AppColors.success,


                          borderRadius:
                              BorderRadius.circular(20),


                        ),




                        child: const Text(


                          "ONLINE",


                          style: TextStyle(


                            color:
                                Colors.white,


                            fontWeight:
                                FontWeight.bold,


                          ),


                        ),



                      ),


                    ],


                  ),


                ),





                const SizedBox(

                  height:
                      AppSpacing.xl,

                ),




                Text(

                  "Live Sensors",

                  style:
                      AppTextStyles.title,

                ),





                const SizedBox(

                  height:
                      AppSpacing.md,

                ),






                GridView.count(



                  shrinkWrap:
                      true,



                  physics:
                      const NeverScrollableScrollPhysics(),



                  crossAxisCount:
                      2,



                  crossAxisSpacing:
                      14,



                  mainAxisSpacing:
                      14,





                  children: [





                    SensorCard(


                      title:
                          "Temperature",


                      value:
                          "${sensor.temperature.toStringAsFixed(1)} °C",



                      icon:
                          Icons.thermostat,



                      color:
                          AppColors.temperature,


                    ),





                    SensorCard(


                      title:
                          "Humidity",



                      value:
                          "${sensor.humidity.toStringAsFixed(0)} %",



                      icon:
                          Icons.water_drop,



                      color:
                          AppColors.humidity,


                    ),






                    SensorCard(


                      title:
                          "Heart Rate",



                      value:
                          "${sensor.heartRate} BPM",



                      icon:
                          Icons.favorite,



                      color:
                          Colors.red,


                    ),






                    SensorCard(


                      title:
                          "Gas Level",



                      value:
                          "${sensor.gas} ppm\n$gasStatus",



                      icon:
                          Icons.warning_amber_rounded,



                      color:
                          gasColor,


                    ),






                    SensorCard(


                      title:
                          "Fall Detection",



                      value:
                          sensor.fall
                              ? "Detected"
                              : "Normal",



                      icon:
                          Icons.accessibility_new,



                      color:
                          sensor.fall
                              ? AppColors.error
                              : AppColors.success,


                    ),






                    SensorCard(


                      title:
                          "GPS Location",



                      value:
                          "${sensor.latitude}\n${sensor.longitude}",



                      icon:
                          Icons.location_on,



                      color:
                          Colors.indigo,


                    ),



                  ],


                ),



              ],


            ),


          );

        },


      ),


    );


  }


}