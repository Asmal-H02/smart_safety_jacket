import 'package:firebase_database/firebase_database.dart';

import '../models/history_data.dart';



class HistoryService {


  final DatabaseReference _historyRef =
      FirebaseDatabase.instance.ref("history");



  Stream<List<HistoryData>> getHistory() {


    return _historyRef.onValue.map((event) {


      final data =
          event.snapshot.value
          as Map<dynamic, dynamic>?;



      if (data == null) {

        return [];

      }



      List<HistoryData> history = [];



      data.forEach((key, value) {

  if(value is Map){

    history.add(
      HistoryData.fromMap(value),
    );

  }

});


      return history.reversed.toList();


    });


  }


}