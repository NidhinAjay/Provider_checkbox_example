import 'package:flutter/material.dart';
import 'package:groceries_provider/provider/provider_class.dart';
import 'package:groceries_provider/second_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => MyProvider()),
    child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const English(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class English extends StatefulWidget {
  const English({Key? key}) : super(key: key);

  @override
  State<English> createState() => _EnglishState();
}

class _EnglishState extends State<English> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    List<String> c1 = [
      "Sugar",
      "Jaggery",
      "Rice",
      "Rava",
      "Maida",
      "Chilli",
      "Kadala",
      "Payar",
      "Oats",
      "Rice Flour",
      "Turmeric Powder"
    ];

    final prov = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Groceries",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: c1.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${c1[index]}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Checkbox(
                checkColor: Colors.black,
                value: prov.icn(c1[index]),
                onChanged: (bool? value) {
                  prov.favour(c1[index]);
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => secnd()),
          );
        },
        label: Icon(
          Icons.shopping_cart,
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}
