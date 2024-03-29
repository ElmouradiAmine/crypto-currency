import 'package:crypto_app/data/crypto_data.dart';
import 'package:crypto_app/data/crypto_data_mock.dart';
import 'package:crypto_app/data/crypto_data_product.dart';

enum Flavor {
  MOCK,PROD
}

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor){
    _flavor  = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository {
    switch(_flavor){
      case Flavor.MOCK: return MockCryptoRepository();
      default: return ProdCryptoRepository();
    }
  }
}