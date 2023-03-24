import 'package:flutter/material.dart';

class SafeColors {
  static _GeneralColors generalColors = _GeneralColors();
  static _ComponentsColors componentsColors = _ComponentsColors();
  static _StatusColors statusColors = _StatusColors();
  static _TextColors textColors = _TextColors();
  static _ButtonColors buttonColors = _ButtonColors();
  static _MaterialButtonColors materialButtonColors = _MaterialButtonColors();
}

class _GeneralColors {
  Color background = const Color(0xFFFAF9FF);
  Color backgroundSplash = const Color(0xFF3F50B5);
  Color primary = const Color(0xFFFAF9FF);
  Color secondary = const Color(0xFF3F50B5);
  Color highlight = const Color(0xFF1D0F75);
  Color white = const Color(0xFFFAF9FF);
}

class _ComponentsColors {
  Color smoothPageIndicatorColor = const Color(0xFFE9E9E9);
  _IconColors iconColors = _IconColors();
}

class _IconColors {
  Color primary = const Color(0xFF3F50B5);
  Color secondary = const Color(0xFF1D0F75);
}

class _StatusColors {
  Color active = const Color(0xFF3F50B5);
  Color error = const Color(0xFFEB3D3D);
  Color success = const Color(0xFF2ECC71);
  Color info = const Color(0xFFD9DADE);
  Color info2 = const Color(0xFF535353);
  Color alert = const Color(0xFFffcc00);
}

class _TextColors {
  Color dark = const Color(0xFF212121);
  Color white = const Color(0xFFFAF9FF);
  Color label = const Color(0xFF535353);
  Color disabled = const Color(0xFFD5D5D5);
}

class _ButtonColors {
  Color primary = const Color(0xFF3F50B5);
  Color secondary = const Color.fromARGB(255, 93, 110, 207);
  Color disabled = const Color(0xFFD5D5D5);
  Color danger = const Color(0xFFEB3D3D);
}

class _MaterialButtonColors {
  MaterialColor primary = const MaterialColor(
    0xFF3F50B5,
    _materialColorButtonPrimaryMap,
  );
}

const Map<int, Color> _materialColorButtonPrimaryMap = {
  50: Color.fromRGBO(63, 80, 181, .1),
  100: Color.fromRGBO(63, 80, 181, .2),
  200: Color.fromRGBO(63, 80, 181, .3),
  300: Color.fromRGBO(63, 80, 181, .4),
  400: Color.fromRGBO(63, 80, 181, .5),
  500: Color.fromRGBO(63, 80, 181, .6),
  600: Color.fromRGBO(63, 80, 181, .7),
  700: Color.fromRGBO(63, 80, 181, .8),
  800: Color.fromRGBO(63, 80, 181, .9),
  900: Color.fromRGBO(63, 80, 181, 1),
};
