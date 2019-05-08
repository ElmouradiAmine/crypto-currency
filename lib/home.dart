import 'package:crypto_app/data/crypto_data.dart';
import 'package:crypto_app/modules/crypto_presenter.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _loading;
  _MyHomePageState(){
    _presenter = CryptoListPresenter(this);
  }


  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  void initState() {
    super.initState();
    _loading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currency'),
      ),
      body: _loading ? Center(child: 
      
      CircularProgressIndicator(),) : _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
        child: Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Crypto currency = _currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getListItemUi(currency, color);
            },
          ),
        ),
      ],
    ));
  }

  Widget _getListItemUi(Crypto currency, MaterialColor color) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency.name.toString()[0]),
      ),
      title: Text(
        currency.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubtitleText(
          currency.price_usd, currency.percent_change_1h),
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = TextSpan(
        text: "\$$priceUSD\n",
        style: TextStyle(
          color: Colors.black,
        ));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText,
          style: TextStyle(
            color: Colors.green,
          ));
    } else {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText,
          style: TextStyle(
            color: Colors.red,
          ));
    }
    return RichText(
      text: TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete
    setState(() {
      _currencies = items;
      _loading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
