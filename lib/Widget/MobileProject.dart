import 'package:flutter/material.dart';

class MobileProject extends StatelessWidget {
  final Function ontab;
  final String image;

  const MobileProject({super.key, required this.ontab, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.36,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
