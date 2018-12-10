import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 获取屏幕的宽度
 */
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getSysStatusHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}




