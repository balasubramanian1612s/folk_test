import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk/components/room.dart';
import 'package:folk/second_screen.dart';
import 'package:folk/widgets/bottom_bar.dart';
import 'package:folk/widgets/lato_text.dart';
import 'package:folk/widgets/room_container.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlPanelPage extends StatefulWidget {
  @override
  _ControlPanelPageState createState() => _ControlPanelPageState();
}

class _ControlPanelPageState extends State<ControlPanelPage>
    with TickerProviderStateMixin {
  AnimationController _bgController;
  bool pop = false;
  @override
  void initState() {
    _bgController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animateIt();
    super.initState();
  }

  animateIt() {
    _bgController.forward();
  }

  List<Room> allRooms = [];
  bool isClicked = true;
  String ssvvgg =
      '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="80" height="80" viewBox="0 0 80 80">   <defs>     <pattern id="pattern" preserveAspectRatio="xMidYMid slice" width="100%" height="100%" viewBox="0 0 106 106">       <image width="106" height="106" xlink:href="data:image/jpeg;base64,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"/>     </pattern>     <filter id="Ellipse_20" x="0" y="0" width="80" height="80" filterUnits="userSpaceOnUse">       <feOffset dy="3" input="SourceAlpha"/>       <feGaussianBlur stdDeviation="4.5" result="blur"/>       <feFlood flood-color="#002d67" flood-opacity="0.341"/>       <feComposite operator="in" in2="blur"/>       <feComposite in="SourceGraphic"/>     </filter>   </defs>   <g id="user" transform="translate(-283.5 -56.5)">     <g transform="matrix(1, 0, 0, 1, 283.5, 56.5)" filter="url(#Ellipse_20)">       <g id="Ellipse_20-2" data-name="Ellipse 20" transform="translate(13.5 10.5)" stroke="#fff" stroke-width="2" fill="url(#pattern)">         <circle cx="26.5" cy="26.5" r="26.5" stroke="none"/>         <circle cx="26.5" cy="26.5" r="25.5" fill="none"/>       </g>     </g>     <circle id="Ellipse_21" data-name="Ellipse 21" cx="5" cy="5" r="5" transform="translate(338 69)" fill="#ff9898"/>   </g> </svg> ';
  @override
  Widget build(BuildContext context) {
    // Sample Data
    allRooms.add(Room('Bed room', 4, 'assets/svgs/bed.svg'));
    allRooms.add(Room('Living room', 4, 'assets/svgs/room.svg'));
    allRooms.add(Room('Kitchen', 4, 'assets/svgs/kitchen.svg'));
    allRooms.add(Room('Bathroom', 4, 'assets/svgs/bathtube.svg'));
    allRooms.add(Room('Outdoor', 4, 'assets/svgs/house.svg'));
    allRooms.add(Room('Balcony', 4, 'assets/svgs/balcony.svg'));

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 77, 162, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/svgs/bground.png'),
            Container(
              // color: Color.fromRGBO(9, 77, 162, 1),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.15,
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                LatoText('Control \nPanel', 30, Colors.white),
                                SvgPicture.asset(
                                  'assets/svgs/user.svg',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Hero(
                            tag: 'container',
                            child: Material(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    top: 30, right: 20, left: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(246, 248, 251, 1),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40))),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.03,
                                      child: LatoText('All Rooms', 20,
                                          Color.fromRGBO(0, 45, 93, 1)),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Expanded(
                                      // color: Colors.orange,
                                      child: GridView.count(
                                        // physics: NeverScrollableScrollPhysics(),
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        childAspectRatio: 3 / 2.7,
                                        children: new List<Widget>.generate(
                                          6,
                                          (index) {
                                            return RoomContainer(
                                                allRooms[index].svgPath,
                                                allRooms[index].name,
                                                allRooms[index]
                                                    .numberOfLights
                                                    .toString());
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomBar()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
