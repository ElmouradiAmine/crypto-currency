import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(cryptoUrl);
    final List reponseBody =  jsonDecode(response.body);
    final statusCode = response.statusCode;
    if(statusCode != 200 || reponseBody == null){
      throw FetchDataException("An error occured : [Status Code : $statusCode]");
    }

    return reponseBody.map((f)=>Crypto.fromMap(f)).toList();//switches the elements from a list of maps to a list of Crypto objects

  }





}