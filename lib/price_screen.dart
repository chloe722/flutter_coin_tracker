import 'package:bitcoin_ticker/model/coin_data_response.dart';
import 'package:bitcoin_ticker/widgets/coin_displayed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'data/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String coinVal = '?';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          for (String crypto in cryptoList) {
            getData(cryptoCoin: crypto, currency: selectedCurrency);
          }
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          for (String crypto in cryptoList) {
            getData(cryptoCoin: crypto, currency: selectedCurrency);
          }
        });
      },
      children: pickerItems,
    );
  }

  void getData({String cryptoCoin, String currency}) async {
    try {
      CoinDataResponse _coinDataResponse;
      CoinData coinData = CoinData();
      _coinDataResponse =
          await coinData.getCoinData(cryptoCoin: cryptoCoin, currency: currency);
      setState(() {
        coinVal = _coinDataResponse.last.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData(currency: selectedCurrency);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList.map((i) => CoinDisplayedItem(cryptoCoin: i, coinVal: coinVal, selectedCurrency: selectedCurrency),
            ).toList(),
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
