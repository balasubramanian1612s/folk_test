import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(46, 79, 158, 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34),
              child: SvgPicture.asset(
                'assets/svgs/bulb.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34),
              child: SvgPicture.asset(
                'assets/svgs/homebottom.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34),
              child: SvgPicture.asset(
                'assets/svgs/settingbottom.svg',
              ),
            ),
          ],
        ));
  }
}
