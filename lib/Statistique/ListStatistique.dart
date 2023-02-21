import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListStatistique {
  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.red,
        value: 10,
        title: '10%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: 30,
        title: '30%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 40,
        title: '40%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // PieChartSectionData(
      //   color: Colors.cyan,
      //   value: 10,
      //   title: '10%',
      //   radius: 50,
      //   titleStyle: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      // ),

      // PieChartSectionData(
      //   color: Colors.orange,
      //   value: 10,
      //   title: '10%',
      //   radius: 50,
      //   titleStyle: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      // ),

      PieChartSectionData(
        color: Colors.yellow,
        value: 20,
        title: '20%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}
