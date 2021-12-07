import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class FeatureRemoteConfig {
  Future<dynamic> checkPageRomoteConfigSpecific(String type) async {
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
        minimumFetchInterval: Duration(milliseconds: 21600000),
        fetchTimeout: Duration(milliseconds: 30000)));
    if (type == 'home_menu') {
      await remoteConfig.fetch();
      await remoteConfig.fetchAndActivate();
      final dynamic ab = json.decode(remoteConfig.getString('pages'));
      return ab['home_menu'];
    }
  }
}
