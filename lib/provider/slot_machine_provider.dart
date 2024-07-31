import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../protos/message.pb.dart';

class SlotMachineProvider extends ChangeNotifier {
  // 私有构造函数
  SlotMachineProvider._internal();

  // 单例实例
  static final SlotMachineProvider _instance = SlotMachineProvider._internal();

  // 工厂构造函数
  factory SlotMachineProvider() {
    return _instance;
  }

  bool _isSpinning = false;
  bool get isSpinning => _isSpinning;

  bool shouldStartSpinning = false;
  void setShouldStartSpinning(bool value) {
    shouldStartSpinning = value;
    notifyListeners();
  }

  bool shouldStartBOS = false;
  void setShouldStartBOS(bool value) {
    shouldStartBOS = value;
    notifyListeners();
  }

  bool shouldUpdateCoin = false;
  void setShouldUpdateCoin(bool value) {
    shouldUpdateCoin = value;
    notifyListeners();
  }

  int _coin = 0;
  int get coin => _coin;

  int _oldCoin = 0;
  int get oldCoin => _oldCoin;
  void setOldCoin(int v) {
    _oldCoin = v;
  }

  int _win = 0;
  int get win => _win;

  int _bs = 0; // 赌大小数字
  int get bs => _bs;

  int _bigOrSmallBet = 0;
  int get bigOrSmallBet => _bigOrSmallBet;

  int _bsBetHistory = 0;
  int get bsBetHistory => _bsBetHistory;

  List<Bet> _bets = List.generate(8, (index) => Bet(index: index, amount: 0));
  List<Bet> get bets => _bets;

  List<Bet> _betsHistory = [];
  List<Bet> get betsHistory => _betsHistory;

  List<int> _lights = [];
  List<int> get lights => _lights;

  int _odds = 0;
  int get odds => _odds;

  final List<int> _chips = [1, 10, 100, 1000, 10000];
  int _chipIndex = 0;
  int _chip = 1;
  int get chip => _chip;

  void setIsSpinning(bool isSpinning) {
    _isSpinning = isSpinning;
    notifyListeners();
  }

  void setCoin(int coin) {
    _coin = coin;
    notifyListeners();
  }

  void setWin(int win) {
    _win = win;
    notifyListeners();
  }

  void setBs(int bs) {
    _bs = bs;
    notifyListeners();
  }

  void _setBigOrSmallBet(int value) {
    _bigOrSmallBet = value;
    // notifyListeners();
  }

  void addBoSBet() {
    if (_coin > _chip) {
      int t = _bigOrSmallBet;
      _setBigOrSmallBet(t + _chip);
      _coin -= _chip;
    }
  }

  void setBets(List<Bet> bets) {
    _bets = bets;
    notifyListeners();
  }

  int getBet(int index) {
    int betIndex = _bets.indexWhere((bet) => bet.index == index);
    return _bets[betIndex].amount;
  }

  int getBets() {
    int total = 0;
    for (int i = 0; i < _bets.length; i++) {
      total += _bets[i].amount;
    }
    return total;
  }

  void increaseBet(int index) {
    if (_coin > _chip) {
      int betIndex = _bets.indexWhere((bet) => bet.index == index);
      if (betIndex != -1) {
        // Increase the amount of the existing Bet
        _bets[betIndex].amount += _chip;
        _coin -= _chip;
        // notifyListeners();
      }
    }
  }

  void resetBets() {
    for (int i = 0; i < _bets.length; i++) {
      _bets[i].amount = 0;
    }
    notifyListeners();
  }

  void resetChip() {
    _chip = 0;
    notifyListeners();
  }

  void setLights(List<int> lights) {
    List<int> t = [];
    for (int i = 0; i < lights.length; i++) {
      int a = lights[i];
      a -= 14;
      a = a < 0 ? a + 24 : a;
      t.add(a);
    }
    _lights = t;
    // notifyListeners();
  }

  void setOdds(int odds) {
    _odds = odds;
    // notifyListeners();
  }

  void changeChip() {
    int a = _chipIndex;
    a = (a + 1) % 5;
    _chip = _chips[a];
    _chipIndex = a;
    // notifyListeners();
  }

  void setBetsHistory(List<Bet> bets) {
    _betsHistory = bets;
  }

  void setBsBetsHistory(int v) {
    _bsBetHistory = v;
  }

  int getBetsAmount(List<Bet> bets) {
    int total = 0;
    for (int i = 0; i < bets.length; i++) {
      total += bets[i].amount;
    }
    return total;
  }
}

final slotMachineProvider = ChangeNotifierProvider<SlotMachineProvider>((ref) {
  return SlotMachineProvider();
});
