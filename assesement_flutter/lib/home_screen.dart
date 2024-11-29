import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Button5(),
    );
  }
}

class Button5 extends StatefulWidget {
  const Button5({super.key});

  @override
  _Button5State createState() => _Button5State();
}

class _Button5State extends State<Button5> {
  Color rectangleColor = Colors.grey; // Initial color of the rectangle

  void changeRectangleColor(Color newColor) {
    setState(() {
      rectangleColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      {'name': 'Red', 'color': const Color.fromARGB(255, 240, 39, 12)},
      {'name': 'Green', 'color': Colors.green},
      {'name': 'Blue', 'color': Colors.blue},
      {'name': 'Orange', 'color': Colors.orange},
      {'name': 'Purple', 'color': Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("COLOR PICKER"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ListView containing buttons
          Expanded(
            child: ListView.builder(
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[index]['color'] as Color,
                    ),
                    onPressed: () {
                      changeRectangleColor(colors[index]['color'] as Color);
                    },
                    child: Text(
                      colors[index]['name'] as String,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          // Rectangle at the bottom
          Container(
            height: 100,
            width: double.infinity,
            color: rectangleColor,
            child: const Center(
              child: Text(
                "😊",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
