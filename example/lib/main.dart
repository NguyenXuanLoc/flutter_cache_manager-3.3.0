import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(MaterialApp(builder: (c,t)=>Scaffold(body: Container(),),));

  CacheManager.logLevel = CacheManagerLogLevel.verbose;
}
