import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Model/Method.dart';
import 'package:portfolio/UI/About.dart';
import 'package:portfolio/UI/FeatureProject.dart';
import 'package:portfolio/UI/Work.dart';
import 'package:portfolio/Widget/AppBarTitle.dart';
import 'package:portfolio/Widget/CustomText.dart';
import 'package:portfolio/Widget/MainTiitle.dart';
import 'package:portfolio/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpanded = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () {
          if (_isAppBarExpanded) {
            if (isExpanded) {
              setState(() {
                isExpanded = false;
              });
            }
          } else {
            if (!isExpanded) {
              setState(() {
                isExpanded = true;
              });
            }
          }
        },
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: const [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Us',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: const Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                method.launchURL(
                                    "https://drive.google.com/file/d/1d5vIRmqaFAiofp7ugQdpNdDRdwPQd8m1/view?usp=sharing");
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  SizedBox(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            color: const Color(0xffffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method
                                  .launchURL("https://github.com/DeekshaJedia");
                            }),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          color: const Color(0xffffa8b2d1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/deeksha-jedia-774836234/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .06,
                                  ),
                                  const CustomText(
                                    text: "Hi, my name is",
                                    textsize: 16.0,
                                    color: Color(0xff41FBDA),
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 3.0,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const CustomText(
                                    text: "Deeksha Jedia.",
                                    textsize: 68.0,
                                    letterSpacing: 0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  CustomText(
                                    text:
                                        "I build Apps and things for the Web.",
                                    textsize: 56.0,
                                    color: const Color(0xffCCD6F6)
                                        .withOpacity(0.6),
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: size.height * .04,
                                  ),
                                  const Wrap(
                                    children: [
                                      Text(
                                        "I'm a Software Engineer based in Jodhpur, IN specializing in \nDesigning and Building websites, \napplications, and everything in between.",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          letterSpacing: 2.75,
                                          wordSpacing: 0.75,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * .12,
                                  ),

                                  //get in tuch text
                                  InkWell(
                                    onTap: () {
                                      method.launchEmail();
                                    },
                                    hoverColor: const Color(0xff64FFDA)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        "Get In Touch",
                                        style: TextStyle(
                                          color: Color(0xff64FFDA),
                                          letterSpacing: 2.75,
                                          wordSpacing: 1.0,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: size.height * 0.20,
                                  ),
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: const About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: const Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      const MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic5.png",
                                        ontab: () {
                                          method.launchURL("");
                                        },
                                        projectDesc:
                                            "A medical app UI designed with Flutter and Dart, offering a sleek and intuitive interface for managing health records and appointments. Ideal for showcasing modern, responsive design in healthcare applications.",
                                        projectTitle: "Med-Kit",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "Flutter UI",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic3.png",
                                        ontab: () {
                                          method.launchURL("");
                                        },
                                        projectDesc:
                                            "A sleek, individual restaurant app UI built with Flutter and Dart, showcasing dynamic menus and user-friendly design. It demonstrates modern app development techniques and responsive design.",
                                        projectTitle: "Tuk-In",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "Flutter UI",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic7.png",
                                        ontab: () {
                                          method.launchURL("");
                                        },
                                        projectDesc:
                                            "Designed for Real Time Clients which merely focuses on A versatile medical conference app UI created with Flutter and Dart, featuring registration, event management, speaker details, and calendar integration. It also includes routing to relevant web pages for additional information.",
                                        projectTitle: "CREST",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "Flutter UI",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic4.png",
                                        ontab: () {
                                          method.launchURL(
                                              "https://github.com/DeekshaJedia/Simon-game");
                                        },
                                        projectDesc:
                                            "Simon is a classic memory game recreated using HTML, CSS, and JavaScript. Players replicate a sequence of colors and sounds, with difficulty increasing each round.",
                                        projectTitle: "Simon Game",
                                        tech1: "HTML",
                                        tech2: "CSS",
                                        tech3: "Javascript",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/DICE.png",
                                        ontab: () {
                                          method.launchURL("");
                                        },
                                        projectDesc:
                                            "A simple dice game created with HTML, CSS, and JavaScript where players roll dice to get the highest number.",
                                        projectTitle: "Dice Game",
                                        tech1: "HTML",
                                        tech2: "Css",
                                        tech3: "Javascript",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic6.png",
                                        ontab: () {
                                          method.launchURL("");
                                        },
                                        projectDesc:
                                            "Built a dynamic drum kit web app using HTML, CSS, and JavaScript, allowing users to create and play rhythms with interactive drum sounds. The app features responsive design and smooth animations for an engaging user experience.",
                                        projectTitle: "Drum Kit",
                                        tech1: "HTML",
                                        tech2: "Css",
                                        tech3: "Javascript",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic2.png",
                                        ontab: () {
                                          method.launchURL(
                                              "https://github.com/DeekshaJedia/World_Time_Application");
                                        },
                                        projectDesc:
                                            "The World Time application, built with Flutter and Dart, fetches time data from an API to display the current time in various locations worldwide.",
                                        projectTitle: "World Time Application",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "API",
                                      ),
                                    ],
                                  )),

                              const SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CustomText(
                                            text: "0.4 What's Next?",
                                            fontWeight: FontWeight.normal,
                                            textsize: 16.0,
                                            color: Color(0xff41FBDA),
                                            letterSpacing: 3.0,
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          const CustomText(
                                            text: "Get In Touch",
                                            textsize: 42.0,
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "My inbox is always open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 32.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            child: Card(
                                              elevation: 4.0,
                                              color: const Color(0xff64FFDA),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(0.85),
                                                height: size.height * 0.09,
                                                width: size.width * 0.10,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff0A192F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                                  child: Text(
                                                    "Say Hello",
                                                    style: TextStyle(
                                                      color: Color(0xff64FFDA),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "deekahajedia@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
