import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedFABDemo(),
    );
  }
}

class AnimatedFABDemo extends StatefulWidget {
  @override
  _AnimatedFABDemoState createState() => _AnimatedFABDemoState();
}

class _AnimatedFABDemoState extends State<AnimatedFABDemo> {
  bool isCircular = false; // Control the shape of the FAB

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated FAB Demo'),
      ),
      body: ListView.builder(
        itemCount: 50, // Example list length
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      floatingActionButton: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: isCircular ? 56.0 : 160.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            color: Colors.blue,
          ),
          child: Center(
            child: isCircular
                ? Icon(Icons.chat, color: Colors.white)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text('Let\'s chat', style: TextStyle(color: Colors.white)),
                    ],
                  ),
          ),
        ),
      
    );
  }
}
