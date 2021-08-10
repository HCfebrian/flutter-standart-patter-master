import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_flutter/core/constant/static_constant.dart';
import 'package:simple_flutter/core/utils/flavour_config.dart';

import 'main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.PRODUCTION,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(baseUrl: StaticConstant.baseUrlProduction));
  runZoned<Future<Null>>(
    () async {
      mainInit();
    },
  );
}
