import 'dart:io';

import 'package:cache_manager/flutter_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    builder: (c, t) => Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    test();
    super.initState();
  }

  void test() async {
    var path =await getExternalCacheDirectories();
    print("TAG PATH: $path");
    /*  http://83.171.249.207/api/v1/hold/image/7af5679e-12f7-4a39-b0a6-2e001b7291d5.obj*/
    var url =
        //'https://www.orimi.com/pdf-test.pdf';
        'https://d1hjkbq40fs2x4.cloudfront.net/2016-01-31/files/1045-2.jpg';
    print("TAG DOWNLOAD URL: $url");
    // DefaultCacheManager().downloadFile(url,key: "test");
    var download = await DefaultCacheManager().getSingleFile(url);
    print("TAG download.path: ${download.path}");
    DefaultCacheManager()
        .getFileStream(url, key: "test7", withProgress: true)
        .listen((event) async {
      if (event is DownloadProgress) {
        print("TAG PROGRESS: ${event.progress}");
      } else if (event is FileInfo) {
        // var fileInfo = await DefaultCacheManager().getFileFromMemory("test2");
        var filePath = event.file.absolute.path ?? '';
        print("TAG filsssePath: ${filePath}");
      }
    }, onError: (v) {
      print("TAG ERROR $v");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.file(File(
        "/storage/emulated/0/Android/data/com.example.example/cache/libCachedImageData/243f8540-de86-11ed-bd54-eff364389ed0.jpg")),);
  }
}
