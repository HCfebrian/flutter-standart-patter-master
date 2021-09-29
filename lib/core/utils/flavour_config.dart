import 'package:flutter/material.dart';
import 'package:simple_flutter/core/utils/string_utils.dart';

enum Flavor { develop, staging, production }

class FlavorValues {
  FlavorValues({required final this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required final Flavor flavor,
    required final FlavorValues values,
    final Color color = Colors.blue,
  }) {
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

  static bool isProduction() => _instance!.flavor == Flavor.production;

  static bool isStaging() => _instance!.flavor == Flavor.staging;

  static bool isDevelop() => _instance!.flavor == Flavor.develop;
}
