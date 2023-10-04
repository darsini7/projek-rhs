class Transaction {
  final int id;
  final String to;
  final String amount;
  final String date;
  final String description;

  Transaction(
    this.id,
    this.to,
    this.amount,
    this.date,
    this.description,
  );
}

final List<Transaction> transactions = [
  Transaction(
    1,
    'Dana',
    '200.000', 
    '26 juli 2023 13:40', 
    'Transfer ke Paijo',
    ),
    Transaction(
    2,
    'PPOB',
    '20.000', 
    '22 juli 2023 13:40', 
    'Pulsa',
    ),
    Transaction(
    3,
    'Ovo',
    '300.000', 
    '17 april 2023 13:40', 
    'Familymart',
    ),
];