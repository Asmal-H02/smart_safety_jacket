import 'package:flutter/material.dart';

import 'custom_card.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';


class SensorCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;


  const SensorCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });



  @override
  Widget build(BuildContext context) {


    return CustomCard(

      padding: const EdgeInsets.all(
        AppSpacing.md,
      ),


      child: Column(


        crossAxisAlignment:
            CrossAxisAlignment.start,


        mainAxisAlignment:
            MainAxisAlignment.center,


        children: [



          // Icon

          Container(

            width: 48,

            height: 48,


            decoration: BoxDecoration(

              color: color.withOpacity(0.15),

              borderRadius:
                  BorderRadius.circular(16),

            ),



            child: Icon(

              icon,

              color: color,

              size: 26,

            ),

          ),




          const SizedBox(

            height: AppSpacing.md,

          ),




          // Title


          Text(

            title,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,


            style:
                AppTextStyles.sensorTitle,

          ),





          const SizedBox(

            height: AppSpacing.xs,

          ),





          // Value


          Flexible(

            child: Text(

              value,

              maxLines: 2,

              overflow:
                  TextOverflow.ellipsis,


              style:
                  AppTextStyles.sensorValue.copyWith(

                    color: color,

                    fontSize: 22,

                  ),

            ),

          ),



        ],


      ),


    );


  }

}