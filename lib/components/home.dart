import 'package:controle_flutter/components/calculatrice.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _navigateToCalculatrice() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Calculatrice(
        title: 'Esats Demo Calculatrice Page',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXVnY2tneWEzbHN6OHF2bXl6NXlxa3ExeGJ1dzd1aTR5M2hkZnV6dCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/a8749TBnyEIY8/giphy.gif',
              width: 350,
              height: 300,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCalculatrice,
        child: const Icon(Icons.add),
      ),
    );
  }
}