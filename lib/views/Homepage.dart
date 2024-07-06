import 'package:ecommerce/utills/product_utills.dart';
import 'package:ecommerce/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,

              //flex:3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: allproducts
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => DetailPage());

                            Navigator.of(context).push(route);
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(10, 10),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(e['thumbnail']),
                                ),
                                Text(e['title']),
                                Text("\$  ${e['price']}"),
                                const Spacer(),
                                RatingBar.builder(
                                  initialRating: e['rating'].toDouble(),
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
