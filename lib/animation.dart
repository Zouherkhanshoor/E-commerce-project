import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({super.key});

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        lowerBound: 100,
        upperBound: 300);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation"),
        ),
        body: Container(
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: animationController,
                  child: Text("fbekfbjkfbejkk smdc "),
                  builder: (context, child) {
                    return Container(
                      height: animationController.value,
                      width: animationController.value,
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text(
                            "zoherkhanshoor",
                            style: TextStyle(
                                fontSize: animationController.value / 10,
                                color: Colors.white),
                          ),
                          child!
                        ],
                      ),
                    );
                  }),
              Wrap(
                children: [
                  MaterialButton(
                    onPressed: () {
                      animationController.forward();
                    },
                    child: Text("Forword"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      animationController.reverse();
                    },
                    child: Text("Reverse"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      animationController.stop();
                    },
                    child: Text("Stop"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      animationController.repeat();
                    },
                    child: Text("repeat"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      animationController.reset();
                    },
                    child: Text("reset"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
