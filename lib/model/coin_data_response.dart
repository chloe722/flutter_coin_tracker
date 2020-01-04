
class CoinDataResponse {
  double ask;
  double bid;
  double last;
  double high;
  double low;
  Open open;
  Averages averages;
  double volume;
  Changes changes;
  double volumePercent;
  int timestamp;
  String displayTimestamp;

  CoinDataResponse(
      {this.ask,
        this.bid,
        this.last,
        this.high,
        this.low,
        this.open,
        this.averages,
        this.volume,
        this.changes,
        this.volumePercent,
        this.timestamp,
        this.displayTimestamp});

  CoinDataResponse.fromJson(Map<String, dynamic> json) {
    ask = json['ask'];
    bid = json['bid'];
    last = json['last'];
    high = json['high'];
    low = json['low'];
    open = json['open'] != null ? new Open.fromJson(json['open']) : null;
    averages = json['averages'] != null
        ? new Averages.fromJson(json['averages'])
        : null;
    volume = json['volume'];
    changes =
    json['changes'] != null ? new Changes.fromJson(json['changes']) : null;
    volumePercent = json['volume_percent'];
    timestamp = json['timestamp'];
    displayTimestamp = json['display_timestamp'];
  }

}

class Open {
  String day;
  String week;
  String month;

  Open({this.day, this.week, this.month});

  Open.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    week = json['week'].toString();
    month = json['month'].toString();
  }
}

class Averages {
  double daily;
  double weekly;
  double monthly;

  Averages({this.daily, this.weekly, this.monthly});

  Averages.fromJson(Map<String, dynamic> json) {
    daily = json['daily'];
    weekly = json['weekly'];
    monthly = json['monthly'];
  }
}

class Changes {
  Averages price;
  Averages percent;

  Changes({this.price, this.percent});

  Changes.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Averages.fromJson(json['price']) : null;
    percent =
    json['percent'] != null ? new Averages.fromJson(json['percent']) : null;
  }

}

