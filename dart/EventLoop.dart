// 一个Dart APP中有唯一的时间循环，其包含event队列和microtask队列。
// event队列包含所有的外部事件：IO、鼠标、绘制、倒计时、Dart isolates之间的消息等等。
//  microtask 队列是必须的，因为事件处理代码有时候需要稍后完成任务，但在返回结果给事件循环之前。例如：

import 'dart:async';
void main() {
  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 3'));
  new Future.delayed(new Duration(seconds:1),() => print('future #1 (delayed)'));

  new Future(() => print('future #2 of 4'))
      .then((_) => print('future #2a'))
      .then((_) {
        print('future #2b');
        scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
      })
      .then((_) => print('future #2c'));
  
  scheduleMicrotask(() => print('microtask #2 of 3'));

  new Future(() => print('future #3 of 4'))
      .then((_) => new Future(
                      () => print('future #3a (a new Future)')))
      .then((_) => print('future #3b'));

  new Future(() => print('future #4 of 4'))
      .then((_) {
        new Future(() => print('future #4a'));
      })
      .then((_) => print('future #4b'));
  
  scheduleMicrotask(() => print('microtask #3 of 3'));
  print('main #2 of 2');
}