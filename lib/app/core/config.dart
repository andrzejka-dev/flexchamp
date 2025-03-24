enum Flavor { development, production }

class Config {

  static Flavor appFlavor = Flavor.production;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.development:
        return 'FlexChamp admin';
      case Flavor.production:
        return 'Welcome to FlexChamp!';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://andrzejka-dev.github.io/Affirmations/affirmations.json';
      case Flavor.production:
        return 'https://andrzejka-dev.github.io/Affirmations/affirmations.json';
    }
  }
  static bool get debugShowCheckedModeBanner {
    switch (appFlavor) {
      case Flavor.development:
        return true;
      case Flavor.production:
        return false;
    }
  }
  static bool get isAdminEnabled {
  switch (appFlavor) {
    case Flavor.development:
      return true;
    case Flavor.production:
      return false;
  }
}
}