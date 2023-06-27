import 'dart:ui';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class ConfigUtils{

  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(commonConfig:defaultCommonConfig,appBarConfig: appBarConfig);
  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig(
    brandPrimary: const Color(0xFF3072F6),
  );

  static BrnAppBarConfig appBarConfig = BrnAppBarConfig(
    backgroundColor: Colors.red
  );
}