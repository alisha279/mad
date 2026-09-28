// Week3.dart  -  Library Desk Assistant
// Name: Alisha Nasir   Roll no: 04072313019

final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming']
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile']
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design']
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math']
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile']
  },
];

void main() async {
  part1();
  part2();
  part3();
  part4();
  part5();
  await part6();
}

// PART 1 

double lateFee(int daysLate, double ratePerDay) =>
    daysLate * ratePerDay;

String formatTitle(String title, [String? author]) {
  if (author == null) {
    return title;
  }
  return '$title by $author';
}

Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {
    'title': title,
    'author': author,
    'year': year,
    'copies': copies,
  };
}

bool isClassic(int year) => year < 2000;

void part1() {
  print('--- Part 1 ---');

  print('Late fee: ${lateFee(5, 0.5)}');
  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));

  print(makeBook(
    title: 'Clean Code',
    author: 'Martin',
  ));

  print(makeBook(
    title: 'Algorithms',
    author: 'Knuth',
    year: 1968,
  ));

  print(isClassic(1968));
  print(isClassic(2021));
}

// PART 2 

List<String> transformAll(
    List<String> items, String Function(String) fn) {
  List<String> result = [];

  for (String item in items) {
    result.add(fn(item));
  }

  return result;
}

int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

double Function(int) makeFeeCalculator(double rate) {
  return (int days) {
    return days * rate;
  };
}

int sumDigits(int n) {
  if (n < 10) {
    return n;
  }

  return (n % 10) + sumDigits(n ~/ 10);
}

void part2() {
  print('--- Part 2 ---');

  print(transformAll(
    ['Dart in Action', 'Clean Code'],
    (item) => item.toUpperCase(),
  ));

  print(transformAll(
    ['Dart in Action', 'Clean Code'],
    (item) => '$item!',
  ));

  int Function() desk1 = makeCounter();
  int Function() desk2 = makeCounter();

  print(desk1());
  print(desk1());
  print(desk1());
  print(desk2());

  double Function(int) studentFee = makeFeeCalculator(0.25);
  double Function(int) staffFee = makeFeeCalculator(0.10);

  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');

  print('Sum of digits: ${sumDigits(125)}');
}

// PART 3 

Map<String, int> buildStock() {
  return {
    for (var b in books)
      b['title'] as String: b['copies'] as int
  };
}

void part3() {
  print('--- Part 3 ---');

  List<String> titles = books
      .map((b) => b['title'] as String)
      .toList();

  List<String> available = books
      .where((b) => (b['copies'] as int) > 0)
      .map((b) => b['title'] as String)
      .toList();

  print('Titles: $titles');
  print('Available: $available');

  int totalCopies = books.fold(
    0,
    (sum, b) => sum + (b['copies'] as int),
  );

  List<int> years = books
      .map((b) => b['year'] as int)
      .toList();

  int oldestYear = years.reduce(
    (a, b) => a < b ? a : b,
  );

  print('Total copies: $totalCopies');
  print('Oldest year: $oldestYear');

  List<Map<String, dynamic>> sortedBooks = [...books];

  sortedBooks.sort(
    (a, b) =>
        (a['year'] as int).compareTo(b['year'] as int),
  );

  List<String> byYear = sortedBooks
      .map((b) => b['title'] as String)
      .toList();

  print('By year: $byYear');

  Map<String, int> stock = buildStock();

  print('Stock: $stock');

  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });

  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');

  Set<String> allTags = {
    for (var b in books) ...(b['tags'] as List<String>)
  };

  print('All tags: $allTags');

  var a = {
    'Dart in Action',
    'Clean Code',
    'Flutter Basics'
  };

  var b = {
    'Clean Code',
    'Flutter Basics',
    'Algorithms'
  };

  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}

// PART 4 

class Box<T> {
  T value;

  Box(this.value);
}

T firstOr<T>(List<T> items, T fallback) {
  if (items.isEmpty) {
    return fallback;
  }

  return items[0];
}

class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return '($first, $second)';
  }
}

void part4() {
  print('--- Part 4 ---');

  Box<int> intBox = Box(5);
  Box<String> stringBox = Box('dart');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${stringBox.value}');


  print(firstOr(
    ['Dart in Action', 'Clean Code'],
    'none',
  ));

  print(firstOr<String>([], 'z'));

  print(Pair('Dart in Action', 3));
}

// PART 5 

class BookNotFoundException implements Exception {
  final String title;

  BookNotFoundException(this.title);
}

class BookNotAvailableException implements Exception {
  final String title;

  BookNotAvailableException(this.title);
}

void checkOut(Map<String, int> stock, String title) {
  if (!stock.containsKey(title)) {
    throw BookNotFoundException(title);
  }

  if (stock[title]! <= 0) {
    throw BookNotAvailableException(title);
  }

  stock[title] = stock[title]! - 1;
}

Map<String, dynamic> findBook(String title) {
  return books.firstWhere(
    (b) => b['title'] == title,
  );
}

void part5() {
  print('--- Part 5 ---');

  var stock = buildStock();

  for (String title in [
    'Dart in Action',
    'Flutter Basics',
    'Unknown Book'
  ]) {
    try {
      checkOut(stock, title);
      print('Checked out: $title');
    } on BookNotAvailableException catch (e) {
      print('Sorry: "${e.title}" has no copies left');
    } on BookNotFoundException catch (e) {
      print('Not found: "${e.title}"');
    } finally {
      print('Transaction logged.');
    }
  }

  print(
    'Copies left of Dart in Action: ${stock['Dart in Action']}',
  );

  try {
    findBook('Missing');
  } on StateError {
    print('Search failed: no such book');
  }
}

// PART 6

Future<String> fetchBookOfTheDay() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dart in Action';
}

Future<String> fetchBroken() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Server down');
}

Future<void> part6() async {
  print('--- Part 6 ---');

  print('Fetching...');

  String book = await fetchBookOfTheDay();

  print('Book of the day: $book');

  try {
    String result = await fetchBroken();
    print(result);
  } catch (e) {
    print('Fetch failed: $e');
  }
}

// REFLECTION 

// 1. When would you choose fold over reduce?
// I would choose fold when the list can be empty or when I need
// to provide an initial value for the calculation.

// 2. What does it mean that a closure "captures" a variable?
// Which variable was captured in makeCounter?
// A closure captures a variable so it can remember and use it
// even after the outer function has finished.
// In makeCounter, the closure captured the count variable.

// 3. Why must on BookNotAvailableException come before a general catch (e)?
// The specific exception must come first because a general catch (e)
// can catch any exception including BookNotAvailableException.

// 4. Why does forgetting await still compile, but give the wrong result?
// Forgetting await still gives a Future, which is a valid return value,
// but it does not give the actual String result of the asynchronous operation.
