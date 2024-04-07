import 'package:flutter/material.dart';

class AppSizeConstants {
  // Generate constants for heights from 2 to 50
  static List<SizedBox> generateHeightConstants() {
    List<SizedBox> constants = [];
    for (int i = 1; i <= 50; i++) {
      constants.add(SizedBox(height: i.toDouble()));
    }
    return constants;
  }

  // Generate constants for widths from 2 to 50
  static List<SizedBox> generateWidthConstants() {
    List<SizedBox> constants = [];
    for (int i = 1; i <= 50; i++) {
      constants.add(SizedBox(width: i.toDouble()));
    }
    return constants;
  }

  // Usage example:
  static final List<SizedBox> heightConstants = generateHeightConstants();
  static final List<SizedBox> widthConstants = generateWidthConstants();
}
