import 'package:envied/envied.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  // Web config
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY')
  static final String webApiKey = _Env.webApiKey;
  
  @EnviedField(varName: 'FIREBASE_WEB_APP_ID')
  static final String webAppId = _Env.webAppId;
  
  @EnviedField(varName: 'FIREBASE_WEB_MESSAGING_SENDER_ID')
  static final String webMessagingSenderId = _Env.webMessagingSenderId;
  
  @EnviedField(varName: 'FIREBASE_WEB_PROJECT_ID')
  static final String webProjectId = _Env.webProjectId;
  
  @EnviedField(varName: 'FIREBASE_WEB_AUTH_DOMAIN')
  static final String webAuthDomain = _Env.webAuthDomain;
  
  @EnviedField(varName: 'FIREBASE_WEB_STORAGE_BUCKET')
  static final String webStorageBucket = _Env.webStorageBucket;

  // Android config
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static final String androidApiKey = _Env.androidApiKey;
  
  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static final String androidAppId = _Env.androidAppId;
  
  @EnviedField(varName: 'FIREBASE_ANDROID_MESSAGING_SENDER_ID')
  static final String androidMessagingSenderId = _Env.androidMessagingSenderId;
  
  @EnviedField(varName: 'FIREBASE_ANDROID_PROJECT_ID')
  static final String androidProjectId = _Env.androidProjectId;
  
  @EnviedField(varName: 'FIREBASE_ANDROID_STORAGE_BUCKET')
  static final String androidStorageBucket = _Env.androidStorageBucket;

  // iOS config
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static final String iosApiKey = _Env.iosApiKey;
  
  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static final String iosAppId = _Env.iosAppId;
  
  @EnviedField(varName: 'FIREBASE_IOS_MESSAGING_SENDER_ID')
  static final String iosMessagingSenderId = _Env.iosMessagingSenderId;
  
  @EnviedField(varName: 'FIREBASE_IOS_PROJECT_ID')
  static final String iosProjectId = _Env.iosProjectId;
  
  @EnviedField(varName: 'FIREBASE_IOS_STORAGE_BUCKET')
  static final String iosStorageBucket = _Env.iosStorageBucket;
  
  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID')
  static final String iosBundleId = _Env.iosBundleId;

  // macOS config
  @EnviedField(varName: 'FIREBASE_MACOS_API_KEY')
  static final String macosApiKey = _Env.macosApiKey;
  
  @EnviedField(varName: 'FIREBASE_MACOS_APP_ID')
  static final String macosAppId = _Env.macosAppId;
  
  @EnviedField(varName: 'FIREBASE_MACOS_MESSAGING_SENDER_ID')
  static final String macosMessagingSenderId = _Env.macosMessagingSenderId;
  
  @EnviedField(varName: 'FIREBASE_MACOS_PROJECT_ID')
  static final String macosProjectId = _Env.macosProjectId;
  
  @EnviedField(varName: 'FIREBASE_MACOS_STORAGE_BUCKET')
  static final String macosStorageBucket = _Env.macosStorageBucket;
  
  @EnviedField(varName: 'FIREBASE_MACOS_BUNDLE_ID')
  static final String macosBundleId = _Env.macosBundleId;

  // Helper method to get Firebase options for current platform
  static FirebaseOptions get currentPlatformOptions {
    if (kIsWeb) {
      return web;
    }
    
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: webApiKey,
    appId: webAppId,
    messagingSenderId: webMessagingSenderId,
    projectId: webProjectId,
    authDomain: webAuthDomain,
    storageBucket: webStorageBucket,
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: androidApiKey,
    appId: androidAppId,
    messagingSenderId: androidMessagingSenderId,
    projectId: androidProjectId,
    storageBucket: androidStorageBucket,
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: iosApiKey,
    appId: iosAppId,
    messagingSenderId: iosMessagingSenderId,
    projectId: iosProjectId,
    storageBucket: iosStorageBucket,
    iosBundleId: iosBundleId,
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: macosApiKey,
    appId: macosAppId,
    messagingSenderId: macosMessagingSenderId,
    projectId: macosProjectId,
    storageBucket: macosStorageBucket,
    iosBundleId: macosBundleId,
  );
}