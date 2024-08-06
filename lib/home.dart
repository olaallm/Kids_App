import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stories/storyDetails.dart';
import 'package:stories/story_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';

  List<String> storyNames = [
    "الأسد والفأر",
   "الثعلب ف حقل العنب",
    "الحمار الأحمق",
    "الراعي الكذاب",
    "الصياد والسمكة الصغيره",
    "الصيصان السبعه",
    "الغراب العطشان",
    "الكلب الطماع",
    "الولد الكسول",
    "قصة الماعزان",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Stories'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Image.asset("assets/images/bg.jpg"),
          Divider(
            thickness: 3,
            color: Colors.pink,
          ),
          Text("Story Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
          Divider(
            thickness: 3,
            color: Colors.pink,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  color: Colors.pink,
                  indent: 60,
                  endIndent: 60,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, StoryDetails.routeName,
                        arguments: StoryModel(index, storyNames[index]));
                  },
                  child: Text(
                    storyNames[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              itemCount: storyNames.length,
            ),
          ),
        ],
      ),
    );
  }
  List<Widget>tabs=[

    StoryDetails(),
  ];
}