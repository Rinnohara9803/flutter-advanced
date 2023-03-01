import 'dart:io';

import 'package:flutter/services.dart';

import '../domain/models/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<DeviceInfo> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      // e.g. "Moto G (4)"
      return DeviceInfo(
        '${androidInfo.brand} ${androidInfo.model}',
        androidInfo.id,
        androidInfo.version.toString(),
      );
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      // e.g. "iPod7,1"
      return DeviceInfo(
        '${iosInfo.name} ${iosInfo.model}',
        iosInfo.identifierForVendor ?? 'Couldn\'t fetch identifier',
        iosInfo.systemVersion ?? 'Couldn\'t fetch identifier',
      );
    }
    return DeviceInfo('Unknown', 'Unknown', 'Unknown');
  } on PlatformException {
    return DeviceInfo('Unknown', 'Unknown', 'Unknown');
  }
}
