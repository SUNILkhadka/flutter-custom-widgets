import 'package:flutter/material.dart';

class Utilities {
  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder) {
    return models
        .asMap()
        .map((index, text) => MapEntry(index, builder(index, text)))
        .values
        .toList();
  }
}
