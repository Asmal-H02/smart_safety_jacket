import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'history.dart';
import 'map.dart';
import 'settings.dart';

import 'history.dart';


class Home extends StatefulWidget {

  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();

}



class _HomeState extends State<Home> {


  int currentIndex = 0;


  final pages = [

    const Dashboard(),

    const History(),

    const MapScreen(),

    const Settings(),

  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: pages[currentIndex],



      bottomNavigationBar: NavigationBar(


        selectedIndex: currentIndex,


        onDestinationSelected: (index){

          setState(() {

            currentIndex = index;

          });

        },


        destinations: const [


          NavigationDestination(

            icon: Icon(Icons.dashboard),

            label: "Dashboard",

          ),


          NavigationDestination(

            icon: Icon(Icons.history),

            label: "History",

          ),


          NavigationDestination(

            icon: Icon(Icons.map),

            label: "Map",

          ),


          NavigationDestination(

            icon: Icon(Icons.settings),

            label: "Settings",

          ),


        ],

      ),

    );

  }

}