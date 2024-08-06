import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stories/story_model.dart';

class StoryDetails extends StatefulWidget {
  const StoryDetails({super.key});
  static const String routeName = 'storydetails';

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as StoryModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground.jpg "),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            model.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                verses[index],
                style: TextStyle(fontSize: 18),
              ),
            );
          },
          itemCount: verses.length,
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String story = await rootBundle.loadString("assets/files/$index.txt");
    List<String> storyLines = story.split("\n");
    setState(() {
      verses = storyLines;
    });
    print(storyLines);
  }
}
