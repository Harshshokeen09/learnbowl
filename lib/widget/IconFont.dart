import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Iconfont extends StatelessWidget {
  Color color;
  double size;
  String iconName;

  Iconfont({this.color, this.iconName, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200, width: 200, child: SvgPicture.asset("fonts/download.svg"));
  }
}
