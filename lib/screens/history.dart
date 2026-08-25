import 'package:flutter/material.dart';

import '../models/history_data.dart';
import '../services/history_service.dart';


class History extends StatelessWidget {

  const History({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Sensor History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ),



      body: StreamBuilder<List<HistoryData>>(


        stream: HistoryService().getHistory(),


        builder: (context, snapshot) {


          if(snapshot.connectionState ==
              ConnectionState.waiting){

            return const Center(
              child: CircularProgressIndicator(),
            );

          }



          if(!snapshot.hasData ||
              snapshot.data!.isEmpty){

            return const Center(

              child: Text(
                "No history records found",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

            );

          }



          final history = snapshot.data!;



          return ListView.builder(

            padding:
            const EdgeInsets.all(12),


            itemCount:
            history.length,


            itemBuilder:
                (context,index){


              return HistoryCard(

                data:
                history[index],

              );


            },

          );


        },

      ),

    );

  }

}





class HistoryCard extends StatelessWidget {


  final HistoryData data;


  const HistoryCard({

    super.key,

    required this.data,

  });



  @override
  Widget build(BuildContext context) {


    return Card(


      elevation: 4,


      margin:
      const EdgeInsets.only(
        bottom: 15,
      ),


      shape:
      RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(15),

      ),



      child: ExpansionTile(



        leading: Icon(

          data.fall
              ? Icons.warning
              : Icons.history,


          color:
          data.fall
              ? Colors.red
              : Colors.blue,

        ),




        title: Text(

          data.timestamp,

          style:
          const TextStyle(

            fontWeight:
            FontWeight.bold,

          ),

        ),



        subtitle:

        data.fall

            ?

        const Text(

          "⚠ FALL DETECTED",

          style:
          TextStyle(

            color: Colors.red,

            fontWeight:
            FontWeight.bold,

          ),

        )


            :

        const Text(
          "Normal activity",
        ),





        children: [



          Padding(

            padding:
            const EdgeInsets.all(16),



            child: Column(


              crossAxisAlignment:
              CrossAxisAlignment.start,



              children: [



                sensorRow(

                  Icons.thermostat,

                  "Temperature",

                  "${data.temperature} °C",

                ),




                sensorRow(

                  Icons.water_drop,

                  "Humidity",

                  "${data.humidity} %",

                ),




                sensorRow(

                  Icons.air,

                  "Gas Level",

                  data.gas.toString(),

                ),





                sensorRow(

                  Icons.favorite,

                  "Heart Rate",

                  "${data.heartRate} BPM",

                ),





                sensorRow(

                  Icons.location_on,

                  "Location",

                  "${data.latitude}, ${data.longitude}",

                ),




                const SizedBox(
                  height: 15,
                ),





                if(data.fall)

                  Container(


                    width:
                    double.infinity,



                    padding:
                    const EdgeInsets.all(12),



                    decoration:

                    BoxDecoration(

                      color:
                      Colors.red.shade100,


                      borderRadius:
                      BorderRadius.circular(10),

                    ),



                    child:

                    const Row(


                      children: [


                        Icon(

                          Icons.warning,

                          color:
                          Colors.red,

                        ),



                        SizedBox(
                          width: 10,
                        ),



                        Text(

                          "Emergency Fall Alert",

                          style:

                          TextStyle(

                            color:
                            Colors.red,


                            fontWeight:
                            FontWeight.bold,

                          ),

                        )


                      ],

                    ),



                  )



              ],


            ),


          )


        ],



      ),


    );


  }







  Widget sensorRow(

      IconData icon,

      String title,

      String value,

      ){


    return Padding(

      padding:
      const EdgeInsets.symmetric(
        vertical: 6,
      ),



      child: Row(


        children: [



          Icon(

            icon,

            size: 22,

          ),



          const SizedBox(
            width: 10,
          ),




          Text(

            "$title:",

            style:
            const TextStyle(

              fontWeight:
              FontWeight.bold,

            ),

          ),




          const SizedBox(
            width: 8,
          ),




          Expanded(

            child:
            Text(value),

          )



        ],


      ),


    );


  }


}