import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.png'))
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             Visibility(
               visible: storyBrain.buttonShouldBeVisible(),
               child: Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                    storyBrain.getStory(),
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
             ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child:  Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      child: Text(
                        storyBrain.getChoice2(),
                        style: const TextStyle(
                          fontSize: 20.0,
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
    );
  }
}

