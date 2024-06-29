import 'package:flutter/material.dart';
import 'package:my_ex/utills/product_utills.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commras"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
        Expanded(
        //flex:3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              child: Row(
                  children:allProduct.map((e)=>Container(
                    padding: const EdgeInsete.all(10),
                    margin: const EdgeInsete.only(
                      right:12,
                      bottom:4,
                    ),
                    decoration: BoxDecoration(
                        color: Color.white),
                    child: Column(
                      children: [
                        Text(e['title']),
                        Text("\$  ${e['price']}"),
                      ],
                    ),
                  )),
                      .tolist()
          ),
        ),
      ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}
