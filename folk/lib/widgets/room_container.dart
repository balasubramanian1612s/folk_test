import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../second_screen.dart';
import 'lato_text.dart';

class RoomContainer extends StatefulWidget {
  String svgPath;
  String title;
  String lights;
  RoomContainer(
      @required this.svgPath, @required this.title, @required this.lights);
  @override
  _RoomContainerState createState() => _RoomContainerState();
}

class _RoomContainerState extends State<RoomContainer> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () async {
         
          await Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              reverseTransitionDuration: Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Interval(0, 0.5),
                );

                return FadeTransition(
                  opacity: curvedAnimation,
                  child: SecondScreen( widget.title.replaceFirst(' ', '\n')),
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(widget.svgPath,
                    width: MediaQuery.of(context).size.width / 7),
                Expanded(child: Container()),
                LatoText(widget.title, 20, Color.fromRGBO(0, 45, 93, 1)),
                Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child:
                        LatoText('${widget.lights} Lights', 12, Colors.orange)),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(46, 79, 158, 0.05),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
        ),
      ),
    );
  }
}
