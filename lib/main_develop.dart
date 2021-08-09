import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_flutter/core/constant/static_constant.dart';
import 'package:simple_flutter/utils/flavour_config.dart';

import 'main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEVELOP, //Flavor Type
      color: Colors.deepPurpleAccent, //Flavor color
      values: FlavorValues(
          baseUrl: StaticConstant.baseUrlDev)); // Add Flavor base Url
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  });
}
