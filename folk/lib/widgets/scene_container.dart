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
    double height = MediaQuery.of(context).size.height;
    return widget.animate
        ? SlideTransition(
            position: widget.animator,
            child: Container(
              height: height * 0.08,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 6,
                      child: SvgPicture.asset(widget.svgPath)),
                  SizedBox(
                      height: height * 0.03,
                      child: Align(
                          alignment: Alignment.center,
                          child: LatoText(widget.title, 15, Colors.white))),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: widget.gradient,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: MediaQuery.of(context).size.width * 0.42,
            ),
          )
        : Container(
            height: height * 0.08,
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: SvgPicture.asset(widget.svgPath)),
                SizedBox(
                    height: height * 0.03,
                    child: Align(
                        alignment: Alignment.center,
                        child: LatoText(widget.title, 15, Colors.white))),
              ],
            ),
            decoration: BoxDecoration(
                gradient: widget.gradient,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: MediaQuery.of(context).size.width * 0.42,
          );
  }
}
