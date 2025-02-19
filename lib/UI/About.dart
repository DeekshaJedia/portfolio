import 'package:flutter/material.dart';
import 'package:portfolio/Widget/CustomText.dart';

class About extends StatelessWidget {
  const About({super.key});

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: const Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          SizedBox(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "01.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const CustomText(
                      text: "About Me",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 4,
                      height: 1.10,
                      color: const Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                const Wrap(
                  children: [
                    CustomText(
                      text:
                          "Hello! I'm Deeksha, a Software Developer based in Jodhpur, IN.\n\nI enjoy creating things that live on the internet, whether that be websites, applications, or anything in between. My goal is to always build products that provide perfect and User friendly experiences.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text:
                          "Currently, I am pursuing my Bachelor's degree in Computer science and Engineering at College of Technology and Engineering.\n\n",
                      textsize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "Here are a few technologies I've been working with recently:\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.75,
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "UI/UX (Canva and Figma)"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: size.width * 0.30,
                          height: size.height * 0.15,
                          child: Column(
                            children: [
                              technology(context, "C/C++"),
                              technology(context, "HTML,CSS & Javascript"),
                              technology(context, "MERN STACK"),
                              technology(context, "PostGresSQL"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: SizedBox(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: const Color(0xff61F9D5),
                      child: Container(
                        margin: const EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: const Color(0xff0A192F),
                      ),
                    ),
                  ),
                  const CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  const CustomImageAnimation({super.key});

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = const Color(0xff61F9D5).withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = const Color(0xff61F9D5).withOpacity(0.0);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: Colors.black54,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage("images/pic1.jpeg"),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
