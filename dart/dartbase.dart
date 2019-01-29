void main() {
//  所有未初始化的值为null
  int intDefault;
//  生产环境默认忽略了assert 但是开发环境中，除非条件为真，否则会引发异常
  assert(intDefault == null);
  typeOperator();

//  类型转换
  typeTrans();

  typeString();

  typeLists();
  typeSets();
  typeMap();
  typeIterable();
  print('Hello, World!');
  var number = 42;
  printNumber(number);
}

void typeOperator() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5);
  assert(5 ~/ 2 == 2);
  assert(5 % 2 == 1);
  print('5/2 = ${5 ~/ 2} r ${5 % 2}');
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  var a, b;
  a = 1; // 给 a 变量赋值
  print(a);
  b ??= 2; // 如果 b 是 null，则赋值给 b；
  print(b);
  b ??= 3; // 如果不是 null，则 b 的值保持不变
  print(b);

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask)  == 0x02);  // AND
  assert((value & ~bitmask) == 0x20);  // AND NOT
  assert((value | bitmask)  == 0x2f);  // OR
  assert((value ^ bitmask)  == 0x2d);  // XOR
  assert((value << 4)       == 0x220); // Shift left
  assert((value >> 4)       == 0x02);  // Shift right

//  条件表达式
//  condition ? expr1 : expr2
//  如果 condition 是 true，执行 expr1 (并返回执行的结果)； 否则执行 expr2 并返回其结果。
//  expr1 ?? expr2
//  如果 expr1 是 non-null，返回其值； 否则执行 expr2 并返回其结果。
  print(null ?? 1);
  print(2 ?? 1);
}

void typeIterable() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
//    判空
  assert(!teas.isEmpty);
//  遍历
  teas.forEach((tea) => print(tea));

  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  print(decaffeinatedTeas);
}

void typeMap() {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var keys = gifts.keys;
  print(keys);
  assert(keys.length == 3);
  assert(new Set.from(keys).contains('first'));

  var values = gifts.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('partridge')));

  assert(gifts.containsKey('first'));

  gifts.forEach((key, value) {
//    print('key : $key , value : $value');
  });
}

void typeSets() {
  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  ingredients.add('gold');
  assert(ingredients.length == 3);

  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients.remove('gold');
  assert(ingredients.length == 2);

  var nobleGases = new Set.from(['xenon', 'argon']);
//  两个set中取子集
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
  print(ingredients);
}

void typeLists() {
  var vegetables = new List();
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.length == 0);
}

void typeString() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' + 'which is very handy.');
  assert('That deserves all caps. ' + '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' + 'STRING INTERPOLATION is very handy!');

  var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s5 ==
      'String concatenation works even over '
      'line breaks.');

  var s6 = 'The + operator ' + 'works, as well.';
  assert(s6 == 'The + operator works, as well.');
//  加上r前缀 会忽略""里面的转义
  var s7 = r"In a raw string, even \n isn't special.";
  print(s7);

  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = const [1, 2, 3];
  const validConstString = '$aConstNum $aConstBool $aConstString';
//  由于aNum aBool aString aConstList是var类型
//  const invalidConstString = '$aNum $aBool $aString $aConstList';
  print(validConstString);
}

void typeTrans() {
  //  类型转换
//  String -> int
  var one = int.parse('1');
  assert(one == 1);

  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  assert((3 << 1) == 6);
  assert((3 >> 1) == 1);
  assert((3 | 4) == 7);
}

void printNumber(Object number) {
  print('The number is $number');
}
