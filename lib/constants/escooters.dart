import 'package:ekotrack/models/escooter.dart';

List<Map<String, dynamic>> _json = [
  {
    "companyName": "Electric Vehicle Charging",
    "pricePerKm": 0.15,
    "latitude": 19.076090,
    "longitude": 72.877426,
    "available": true
  },
  {
    "companyName": "GreenRide",
    "pricePerKm": 0.12,
    "latitude": 22.0797,
    "longitude": 82.1409,
    "available": true
  },
  {
    "companyName": "ScootEase",
    "pricePerKm": 0.18,
    "latitude": 21.0976,
    "longitude": 81.0337,
    "available": true
  },
  {
    "companyName": "EcoMoto",
    "pricePerKm": 0.14,
    "latitude": 22.0797,
    "longitude": 82.1409,
    "available": true
  },
  {
    "companyName": "ZippyScooters",
    "pricePerKm": 0.16,
    "latitude": 22.3595,
    "longitude": 82.7501,
    "available": true
  },
  {
    "companyName": "GoGreen",
    "pricePerKm": 0.13,
    "latitude": 20.7101,
    "longitude": 81.5489,
    "available": true
  },
  // {
  //   "companyName": "EcoWheel",
  //   "pricePerKm": 0.17,
  //   "latitude": 40.767890,
  //   "longitude": 14.782345,
  //   "available": true
  // },
  // {
  //   "companyName": "SwiftScoots",
  //   "pricePerKm": 0.11,
  //   "latitude": 40.769012,
  //   "longitude": 14.779012,
  //   "available": true
  // },
  // {
  //   "companyName": "ElectroGlide",
  //   "pricePerKm": 0.19,
  //   "latitude": 40.765678,
  //   "longitude": 14.780678,
  //   "available": true
  // },
  // {
  //   "companyName": "PowerRide",
  //   "pricePerKm": 0.15,
  //   "latitude": 40.768901,
  //   "longitude": 14.778345,
  //   "available": true
  // }
];

List<EScooter> scooters = _json.map((e) => EScooter.fromJson(e)).toList();
