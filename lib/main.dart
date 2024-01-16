import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation annimation;
  late AnimationController annimationController;

  @override
  void initState() {
    super.initState();
    annimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    annimation = Tween(begin: -1, end: 1.0).animate(CurvedAnimation(
        parent: annimationController, curve: Curves.fastOutSlowIn));
    annimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: annimationController,
        builder: (context, child) {
          return Scaffold(
            body: Transform(
              transform: Matrix4.translationValues(annimation.value*width, 1.0, 1.0),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              )
            )
          );
        },
    );
  }
}
