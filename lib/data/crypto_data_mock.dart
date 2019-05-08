import 'package:crypto_app/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    return Future.value(currencies);
  }
}

var currencies = <Crypto> [
  Crypto(name: "Bitcoin",price_usd: "800.0",percent_change_1h: "0.9"),
  Crypto(name: "Ethereum",price_usd: "650.45",percent_change_1h: "-1.3"),
  Crypto(name: "Ripple",price_usd: "300.0",percent_change_1h: "2.9"),
];