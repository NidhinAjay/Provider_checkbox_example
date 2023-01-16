import 'package:flutter/material.dart';
import 'package:groceries_provider/provider/provider_class.dart';
import 'package:provider/provider.dart';

class secnd extends StatefulWidget {
  const secnd({Key? key}) : super(key: key);

  @override
  State<secnd> createState() => _secndState();
}

class _secndState extends State<secnd> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    final list = prov.myList;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Cart",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: ListTile(
                      title: Text(
                        "${list[index]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Checkbox(
                          checkColor: Colors.black,
                          value: prov.icn(list[index]),
                          onChanged: (bool? value) {
                            prov.favour(list[index]);
                          })));
            }));
  }
}
