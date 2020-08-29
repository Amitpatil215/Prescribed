import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Responsive with ChangeNotifier {
  double _height;
  double _width;

  void setResponsiveParameters(BuildContext ctx) {
    _height = MediaQuery.of(ctx).size.height;
    _width = MediaQuery.of(ctx).size.width;
  }

  get responsiveHeight {
    return _height;
  }

  get responsiveWidth {
    return _width;
  }
}
