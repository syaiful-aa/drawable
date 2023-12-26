import 'package:drawable/drawable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: const [
            ListTile(title: Text('BitmapDrawable')),
            Image(image: DrawableImage('flutter')),
            ListTile(title: Text('VectorDrawable')),
            Image(
              image: DrawableImage('child_care'),
              width: 80,
              height: 80,
            ),
            Image(
              image: DrawableImage('new_splash_screen'),
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}

class ColorDrawableWidget extends StatefulWidget {
  @override
  _ColorDrawableWidgetState createState() => _ColorDrawableWidgetState();
}

class _ColorDrawableWidgetState extends State<ColorDrawableWidget> {
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    loadColor();
  }

  Future<void> loadColor() async {
    final colorDrawable =
    await const AndroidDrawable().loadColor(name: 'example_color');
    setState(() {
      _color = colorDrawable?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 50,
      height: 50,
    );
  }
}
