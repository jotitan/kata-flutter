import 'package:flutter/material.dart';
import 'package:kata_flutter/models/cart_product.dart';
import 'package:kata_flutter/widgets/offerList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (BuildContext context)=>CartStore(),
      child:MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage('CSE Tickets'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: OfferList(),
    );
  }
}

