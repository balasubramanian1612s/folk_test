import 'package:flutter/material.dart';
import 'package:folk/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk/widgets/bottom_bar.dart';
import 'package:folk/widgets/lato_text.dart';
import 'package:folk/widgets/scene_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/src/theme/range_slider_theme.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';

class SecondScreen extends StatefulWidget {
  String mainTitle;
  SecondScreen(this.mainTitle);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _colorController;
  AnimationController _bgController;
  AnimationController _bulbController;
  bool isInit = true;
  Animation<Offset> _animation;
  Animation<Offset> _colorAnimation;
  Animation<Offset> _bulbAnimation;

  Animation<Offset> _animation2;
  AnimationController _controller2;

  String colorString = 'rgba(3, 235, 252, 0.1)';
  String colorString1 = 'rgba(3, 235, 252, 0.1)';
  Color currentColor = Colors.pink[200];
  double fillOpacity = 1;

  updateBulbColor(Color color) {
    setState(() {
      colorString =
          'rgba(${color.red}, ${color.green}, ${color.blue}, ${color.opacity})';
      colorString1 = 'rgba(${color.red}, ${color.green}, ${color.blue}, 0.5)';
    });
    print(colorString);
    print(colorString1);
  }

  @override
  dispose() {
    _controller.dispose();
    _bgController.dispose();
    _bulbController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var animationController2 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller2 = animationController2;
    _animation2 = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInCubic,
    ));

    updateBulbColor(currentColor);
    _bgController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _bgController.forward();

    var animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    var colorController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _colorController = colorController;
    _colorAnimation = Tween<Offset>(
      begin: const Offset(-10, 0.0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _colorController,
      curve: Curves.easeInCubic,
    ));

    var bulbAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        isInit = false;
      });

      _controller..forward();
      _bulbController..forward();
      _colorController..forward();
      _controller2..forward();
    });

    _controller = animationController;
    _animation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    _bulbController = bulbAnimationController;
    _bulbAnimation = Tween<Offset>(
      begin: const Offset(1.7, -0.5),
      end: const Offset(1.7, -0.1),
    ).animate(CurvedAnimation(
      parent: bulbAnimationController,
      curve: Curves.easeInCubic,
    ));
  }

  String ssvvgg;
  double _currentSliderValue = 100;
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    ssvvgg =
        '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="139" height="159" viewBox="0 0 139 159">   <defs>     <filter id="Ellipse_10" x="35" y="89" width="70" height="70" filterUnits="userSpaceOnUse">       <feOffset dy="3" input="SourceAlpha"/>       <feGaussianBlur stdDeviation="8" result="blur"/>       <feFlood flood-color="$colorString1"/>       <feComposite operator="in" in2="blur"/>       <feComposite in="SourceGraphic"/>     </filter>   </defs>   <g id="light_bulb" data-name="light bulb" transform="translate(-204 4)">     <g transform="matrix(1, 0, 0, 1, 204, -4)" filter="url(#Ellipse_10)">       <circle id="Ellipse_10-2" data-name="Ellipse 10" cx="11" cy="18" r="11" transform="translate(59 110)" fill="$colorString" fill-opacity="$fillOpacity"/>     </g>     <path id="Path_100" data-name="Path 100" d="M30.334,1.617h79.054c3.314,0,4.206,2.324,6,6L139,62a6,6,0,0,1-6,6H6a6,6,0,0,1-6-6L24.334,7.617C25.837,4.237,27.02,1.617,30.334,1.617Z" transform="translate(204 52)" fill="#fff"/>     <rect id="Rectangle_13" data-name="Rectangle 13" width="5" height="102" transform="translate(271 -4)" fill="#fff"/>     <rect id="Rectangle_14" data-name="Rectangle 14" width="4" height="58" rx="2" transform="matrix(0.921, -0.391, 0.391, 0.921, 303.828, 59.087)" fill="#568bd0" opacity="0.151"/>   </g> </svg> ';

    double height = MediaQuery.of(context).size.height;

    List<Color> colorPallete = [
      Colors.pink[200],
      Colors.purple[200],
      Colors.orange[200],
      Colors.red[200],
      Colors.green[200],
      Colors.orange[200],
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 77, 162, 1),
      body: SafeArea(
        child: Stack(
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.2).animate(_bgController),
              child: Image.asset('assets/svgs/bground.png'),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: height * 0.082,
                              child: LatoText(
                                '← ${widget.mainTitle}',
                                30,
                                Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SlideTransition(
                            position: _animation,
                            child: Text(
                              '4 Lights',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                                textStyle: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SlideTransition(
                    position: _animation,
                    child: Container(
                      height: height * 0.07,
                      child: ListView.separated(
                          padding: const EdgeInsets.only(left: 20.0),
                          separatorBuilder: (context, i) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/surface1.svg',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: i == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        height: height * 0.07 / 2,
                                        child: Center(
                                          child: LatoText(
                                              'Main Light',
                                              14,
                                              (i == 1
                                                  ? Colors.white
                                                  : Color.fromRGBO(
                                                      0, 45, 93, 1))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: i == 1
                                        ? Color.fromRGBO(23, 60, 119, 1)
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * 0.03,
                                        child: LatoText('Intensity', 20,
                                            Color.fromRGBO(0, 45, 93, 1)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/svgs/solution2.svg',
                                              ),
                                              Expanded(
                                                child: SfSliderTheme(
                                                  data: SfRangeSliderThemeData(
                                                      activeTrackColor:
                                                          Colors.yellow,
                                                      thumbColor: Colors.white,
                                                      thumbStrokeColor:
                                                          Colors.yellowAccent,
                                                      inactiveTrackColor: Colors
                                                          .grey
                                                          .withOpacity(0.1)),
                                                  child: SfSlider(
                                                    min: 0.0,
                                                    max: 100.0,
                                                    value: _currentSliderValue,
                                                    interval: 20,
                                                    showTicks: true,
                                                    minorTicksPerInterval: 0,
                                                    onChanged: (dynamic value) {
                                                      if (value < 2) {
                                                        setState(() {
                                                          updateBulbColor(
                                                              Colors.black);
                                                          fillOpacity = 1;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          updateBulbColor(
                                                              currentColor);
                                                          fillOpacity =
                                                              value / 100;
                                                          _currentSliderValue =
                                                              value;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/svgs/solution1.svg',
                                                color: _currentSliderValue > 10
                                                    ? Color.fromRGBO(
                                                        255, 216, 43, 1)
                                                    : Colors.grey[400],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.03),
                                      SizedBox(
                                        height: height * 0.03,
                                        child: LatoText('Colors', 20,
                                            Color.fromRGBO(0, 45, 93, 1)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          height: height * 0.04,
                                          // color: Colors.red,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, i) {
                                                if (i == 6) {
                                                  return CircleAvatar(
                                                    radius: 17,
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        'assets/svgs/+.svg',
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  );
                                                } else {
                                                  return SlideTransition(
                                                    position: _colorAnimation,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          currentColor =
                                                              colorPallete[i];
                                                        });
                                                        updateBulbColor(
                                                            colorPallete[i]);
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 17,
                                                        backgroundColor:
                                                            colorPallete[i],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              separatorBuilder: (context, i) {
                                                return SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                );
                                              },
                                              itemCount: 7),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        child: LatoText('Scenes', 20,
                                            Color.fromRGBO(0, 45, 93, 1)),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SceneContainer(
                                                LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: <Color>[
                                                    Color.fromRGBO(
                                                        255, 155, 156, 1),
                                                    Color.fromRGBO(
                                                        254, 181, 146, 1),
                                                  ],
                                                ),
                                                'assets/svgs/surface2.svg',
                                                'Birthday',
                                                false,
                                                _animation2),
                                            SceneContainer(
                                                LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: <Color>[
                                                    Color.fromRGBO(
                                                        167, 147, 235, 1),
                                                    Color.fromRGBO(
                                                        207, 147, 234, 1),
                                                  ],
                                                ),
                                                'assets/svgs/surface2.svg',
                                                'Party',
                                                true,
                                                _animation2),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SceneContainer(
                                                LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: <Color>[
                                                    Color.fromRGBO(
                                                        147, 204, 235, 1),
                                                    Color.fromRGBO(
                                                        147, 216, 235, 1),
                                                  ],
                                                ),
                                                'assets/svgs/surface2.svg',
                                                'Relax',
                                                false,
                                                _animation2),
                                            SceneContainer(
                                                LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: <Color>[
                                                    Color.fromRGBO(
                                                        138, 221, 148, 1),
                                                    Color.fromRGBO(
                                                        184, 234, 146, 1),
                                                  ],
                                                ),
                                                'assets/svgs/surface2.svg',
                                                'Fun',
                                                true,
                                                _animation2),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * 0.03),
                                    ],
                                  ),
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
            SlideTransition(
              position: _bulbAnimation,
              child: SvgPicture.string(ssvvgg),
            ),
          ],
        ),
      ),
    );
  }
}
