import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  dynamicHeight(double value) => MediaQuery.of(context).size.height * value;
  dynamicWidht(double value) => MediaQuery.of(context).size.width * value;

  ThemeData get themeData => Theme.of(context);
}
