import 'package:rhs/data/1.dart';

List<money> geter() {
  money emoney = money();
  emoney.name ='E-money';
  emoney.fee = '650';
  emoney.time = 'today';
  emoney.image = 'emoney.jpg';
  emoney.buy = false;
  money dana= money();
  dana.buy = true;
  dana.fee = '15';
  dana.image = 'dana.jpeg';
  dana.name = 'dana';
  dana.time = 'today';
  money transfer = money();
  transfer.buy = true;
  transfer.fee = '150';
  transfer.image = 'ovo.jpg';
  transfer.name = 'transfer ke jarwo';
  transfer.time = '21 Sepember 2023';
  return [emoney, dana, transfer];
}