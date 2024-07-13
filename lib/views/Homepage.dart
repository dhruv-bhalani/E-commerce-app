import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utills/product_utills.dart';
import 'package:ecommerce/views/catagory.dart';
import 'package:ecommerce/views/extensions.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selected = "All Products";
  final List<String> imagesSlider = [
    "https://img.freepik.com/free-vector/ecommerce-web-page-concept-illustration_114360-8204.jpg?semt=sph",
    "https://img.freepik.com/free-photo/african-american-man-looks-clothes-online-touch-screen-monitor-fashion-boutique-mall-self-service-board-male-customer-looking-trendy-clothes-items-retail-kiosk-display_482257-63314.jpg?semt=sph",
    "https://img.freepik.com/premium-photo/businessman-using-laptop-with-online-shopping-concept-marketplace-website-with-virtual-interface-online-shopping-cart-part-network-online-shopping-business-with-selecting-shopping-cart_162459-3661.jpg?semt=sph",
    "https://img.freepik.com/free-vector/social-media-marketing-mobile-phone-concept_23-2148431745.jpg?semt=sph",
    "https://img.freepik.com/premium-photo/add-cart-internet-web-store-buy-online-ecommerce-concept_628331-86.jpg?semt=sph",
    "https://img.freepik.com/premium-psd/psd-online-fashion-e-commerce-product-sale-social-media-post-instagram-post-banner-template_865512-81.jpg?ga=GA1.1.138003806.1720690598&semt=sph"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                DropdownButton(
                  value: selected,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selected = value.toString();
                    });
                  },
                  items: [
                    const DropdownMenuItem(
                      child: Text('All Products'),
                      value: 'All Products',
                    ),
                    ...Allcatagory.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.tdata),
                        value: e,
                      );
                    }),
                  ],
                ),
              ],
            ),
            catagory(
                context: context,
                products: allproducts,
                size: size,
                category: 'All Products'),
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items: imagesSlider.map(
                (imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
