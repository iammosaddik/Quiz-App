import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launcheURL(String url)async{
    final Uri uri = Uri(scheme: 'https', host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
    )){
      throw 'Can Not Launch url';
    }
  }
}