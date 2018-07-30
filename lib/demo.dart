// 单行注释

/**
 * 多行注释
 */
printInterger(Object aNumber) {
//  字符串使用 单引号或者双引号均可
//  字符串插入使用 $name 或者 ${name} 的语法
  print('The number is $aNumber');
  print('The number is ${aNumber}');
}

main() {
  //变量声明，没有赋初始值的变量默认值都是 null
  var number = 42;
  printInterger(number);

  int a = 1;
  printInterger(a);

  String s = 'hello';
  printInterger(s);

  dynamic c = 0.5;
  printInterger(c);

  //常量 final const
  //区别一：final 要求变量只能初始化一次，并不要求赋的值一定是编译时常量，可以是常量也可以不是。而 const 要求在声明时初始化，并且赋值必需为编译时常量。
  //  区别二：final 是惰性初始化，即在运行时第一次使用前才初始化。而 const 是在编译时就确定值了。

  final String name = 'test';
  printInterger(name);

  const String ca = '1';
  printInterger(ca);

//  数据类型：numbers,strings,booleans,lists(arrays),maps,runs(UTF-32字符集的字符),symbols
//  numbers
  var aa = 0;
  int bb = 1;
  double cc = 0.1;

//  strings
  var s1 = 'hello';
  String s2 = 'world';

//  booleans
  var real = true;
  bool isReal = false;

//  lists
  var arr = [1, 2, 3, 4, 5];
  List<String> arr2 = ['hello', 'world', '123', '456'];
  List<dynamic> arrs = [1, true, 'haha', 1.0];
  printInterger(arrs);

//  maps
  var map = new Map();
  map['name'] = 'zhangsan';
  map['age'] = 10;
  printInterger(map);
  Map m = new Map();
  m['a'] = 'a';
  printInterger(m);

  //runes
  var clapping = '\u{1f44f}';
  printInterger(clapping);

//  symbols
  print(#s == new Symbol("s"));

  print(add(1, 2));
  print(add2(1, 2));
  print(adds(1, 2));
}

int add(int a, int b) {
  return a + b;
}

add2(int a, int b) {
  return a + b;
}

adds(a, b) => a + b;
