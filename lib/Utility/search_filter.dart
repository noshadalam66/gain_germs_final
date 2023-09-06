import 'dart:async';
import 'package:flutter/material.dart';

class SearchFilter {
  final int milliseconds = 500;
  VoidCallback? action;
  Timer? _timer;

 // SearchFilter({this.milliseconds});
  SearchFilter();

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}