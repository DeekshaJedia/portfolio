import 'package:flutter/material.dart';
import 'package:portfolio/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  const WorkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
            title: "Flutter Application Developer Intern ",
            subTitle:
                "As a Application developer Inter I Developed and Refined Skills in Mobile Application Development using Flutter and Dart \n Contributed to development meetings and brainstorming sessions.\n Also got to perform research on latest flutter development trends and practices.\n FINTECH IT SOLUTION LLT Jodhpur,Rajasthan ",
            duration: "June - September 2024",
            key: GlobalKey()),
        WorkCustomData(
            title: "Google Developer Students Club LEAD",
            subTitle:
                "As a Google Developer Student Clubs (GDSC) Lead, I organize tech events and workshops to help students learn and innovate. I focus on empowering peers with the skills to solve real-world problems using technology.\n GOOGLE , India ",
            duration: "June - July 2024",
            key: GlobalKey()),
        WorkCustomData(
            title: "Human Resources Intern",
            subTitle:
                "As a software engineering student, I pursued an HR internship to develop a holistic understanding of organizational dynamics and enhance my interpersonal skills. \nThis experience allowed me to bridge the gap between technical expertise and human resource management, fostering a well-rounded approach to team collaboration and project management.",
            duration: "Sep 2022 - Nov 2022",
            key: GlobalKey()),
        WorkCustomData(
            title: "Project Manager Intern",
            subTitle:
                "Managed a team of 30 volunteers under the company's project PLANTFORME.\n As a software engineering student, managing projects enhanced my leadership and organizational skills, preparing me for real-world software development by coordinating team efforts and ensuring timely completion.\n ATHMA NGO, Hyderabad,India",
            duration: "May - june 2022",
            key: GlobalKey()),
      ],
    );
  }
}
