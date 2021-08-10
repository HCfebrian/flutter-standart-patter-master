import 'package:flutter/material.dart';
import 'package:simple_flutter/core/utils/string_utils.dart';

enum Flavor { DEVELOP, STAGING, PRODUCTION }

class FlavorValues {
  FlavorValues({required this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      Color color: Colors.blue,
      required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
      flavor,
      StringUtils.enumName(flavor.toString()),
      color,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;

  static bool isStaging() => _instance!.flavor == Flavor.STAGING;

  static bool isDevelop() => _instance!.flavor == Flavor.DEVELOP;
}
