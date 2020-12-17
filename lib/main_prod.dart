import 'package:flutter/material.dart';
import 'package:prov2/flavor.dart';
import 'package:prov2/my_app.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(Provider<Flavor>.value(
    value: Flavor.prod,   /// [from enum]
    child: MyApp(),
  ));
}