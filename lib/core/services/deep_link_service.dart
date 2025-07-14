import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeepLinkHandler {
  final GlobalKey<NavigatorState> navigatorKey;
  StreamSubscription<Uri>? _linkSubscription;
  final AppLinks _appLinks = AppLinks();

  DeepLinkHandler({required this.navigatorKey});

  void init() {
    // Start listening for app links
    _linkSubscription = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleUri(uri);
      }
    });

    // Also handle the initial deep link
    _appLinks.getInitialLink ().then((uri) {
      if (uri != null) {
        _handleUri(uri);
      }
    });
  }

  void _handleUri(Uri uri) async {
    final accessToken = uri.queryParameters['access_token'];
    final refreshToken = uri.queryParameters['refresh_token'];

    if (accessToken != null && refreshToken != null) {
      try {
        final sessionJson = '''
        {
          "access_token": "$accessToken",
          "refresh_token": "$refreshToken",
          "token_type": "bearer"
        }
      ''';
      await Supabase.instance.client.auth.recoverSession(
        sessionJson);

        debugPrint("✅ Session restored from deep link");

        // Navigate to home page or verified page
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      } catch (e) {
        debugPrint("❌ Error restoring session: $e");
      }
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
