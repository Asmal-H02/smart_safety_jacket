import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  const Settings({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
        centerTitle: true,
      ),


      body: ListView(

        children: [

          ListTile(

            leading: const Icon(Icons.person),

            title: const Text(
              "Worker Profile",
            ),

            subtitle: const Text(
              "Configure user details",
            ),

          ),


          ListTile(

            leading: const Icon(Icons.bluetooth),

            title: const Text(
              "Jacket Device",
            ),

            subtitle: const Text(
              "Device ID: Jacket001",
            ),

          ),


        ],

      ),

    );

  }

}