import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'lato_text.dart';

class SceneContainer extends StatefulWidget {
  LinearGradient gradient;
  String svgPath;
  String title;
  bool animate;
  Animation<Offset> animator;
  SceneContainer(@required this.gradient, @required this.svgPath,
      @required this.title, @required this.animate, this.animator);

  @override
  _SceneContainerState createState() => _SceneContainerState();
}

class _SceneContainerState extends State<SceneContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? SlideTransition(
            position: widget.animator,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: SvgPicture.asset(widget.svgPath)),
                  LatoText(widget.title, 15, Colors.white),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: widget.gradient,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: MediaQuery.of(context).size.width / 2 - 35,
            ),
          )
        : Container(
            height: 60,
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: SvgPicture.asset(widget.svgPath)),
                LatoText(widget.title, 15, Colors.white),
              ],
            ),
            decoration: BoxDecoration(
                gradient: widget.gradient,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: MediaQuery.of(context).size.width / 2 - 35,
          );
  }
}
