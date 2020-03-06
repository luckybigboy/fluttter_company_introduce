import 'dart:ui' show Color;

Color string2Color(String colorString) {
  int value = 0x00000000;
  if (colorString != '') {
    if (colorString[0] == '#') {
      colorString = colorString.substring(1);
    }
    value = int.tryParse(colorString, radix: 16);
    if (value != null) {
      if (value < 0xFF000000) {
        value += 0xFF000000;
      }
    }
  }
  return Color(value);
}

// class ColorsUtil {
//   /// 十六进制颜色，
//   /// hex, 十六进制值，例如：0xffffff,
//   /// alpha, 透明度 [0.0,1.0]

//   static Color hexToColor(String s) {
//     // 如果传入的十六进制颜色值不符合要求，返回默认值
//     if (s == null ||
//         s.length != 7 ||
//         int.tryParse(s.substring(1, 7), radix: 16) == null) {
//       s = '#999999';
//     }

//     return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
//   }
// }
