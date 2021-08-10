import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_flutter/core/constant/static_constant.dart';
import 'package:simple_flutter/core/utils/flavour_config.dart';

import 'main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.STAGING,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(baseUrl: StaticConstant.baseUrlStaging));
  runZoned<Future<Null>>(() async {
    mainInit();
  });
}
