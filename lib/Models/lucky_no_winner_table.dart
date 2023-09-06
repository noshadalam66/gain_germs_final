// 1-940 => 1 gain
// 941-960 => 5 gains
// 961-980 => 20 gains
// 981-990 => 50 gains
// 991-999 => 100 gains
// 1000 => 1000 gains

class LuckerNumberWinnerTable {
  final String? title, winAmount;

  LuckerNumberWinnerTable({this.title, this.winAmount});
}

List luckyNumbersWinnerTable = [
  LuckerNumberWinnerTable(
    title: "1-940",
    winAmount: "1 Germ",
  ),
  LuckerNumberWinnerTable(
    title: "941-960",
    winAmount: "5 Germ",
  ),
  LuckerNumberWinnerTable(
    title: "961-980",
    winAmount: "20 Germ",
  ),
  LuckerNumberWinnerTable(
    title: "981-990",
    winAmount: "50 Germ",
  ),
  LuckerNumberWinnerTable(
    title: "991-999",
    winAmount: "100 Germ",
  ),
  LuckerNumberWinnerTable(
    title: "1000",
    winAmount: "1000 Germ",
  ),
];
