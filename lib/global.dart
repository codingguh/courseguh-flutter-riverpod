import 'package:courseguh/common/services/storage.dart';
import 'package:courseguh/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        name: 'courseguh-5ee3d',
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = await StorageService().init();
  }
}
