class HistoryData {

  final String timestamp;

  final double temperature;
  final double humidity;

  final int gas;
  final int heartRate;

  final bool fall;

  final String latitude;
  final String longitude;


  HistoryData({

    required this.timestamp,

    required this.temperature,
    required this.humidity,

    required this.gas,
    required this.heartRate,

    required this.fall,

    required this.latitude,
    required this.longitude,

  });



  factory HistoryData.fromMap(Map<dynamic, dynamic> data) {

    return HistoryData(

      timestamp:
          data['timestamp']?.toString() ?? "Unknown",


      temperature:
          double.tryParse(
            data['temperature'].toString(),
          ) ?? 0,


      humidity:
          double.tryParse(
            data['humidity'].toString(),
          ) ?? 0,


      gas:
          int.tryParse(
            data['gas'].toString(),
          ) ?? 0,


      heartRate:
          int.tryParse(
            data['heartbeat'].toString(),
          ) ?? 0,


      fall:
          data['fall'] ?? false,


      latitude:
          data['latitude']?.toString() ?? "0.0000",


      longitude:
          data['longitude']?.toString() ?? "0.0000",

    );

  }

}