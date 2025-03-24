enum Flavor { development, production }

class Config {

  static Flavor? appFlavor = Flavor.development;

}

final appFlavor = Config.appFlavor;