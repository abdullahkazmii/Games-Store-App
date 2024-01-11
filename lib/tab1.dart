import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/products.dart';
import 'package:flutter/material.dart';
class tab1 extends StatefulWidget {
  static const String id='tab1';
  const tab1({super.key});

  @override
  State<tab1> createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  List imagelist = [
    {"id": 1, "image_path": 'images/slider-1.webp'},
    {"id": 2, "image_path": 'images/slider-2.webp'},
    {"id": 3, "image_path": 'images/slider-3.webp'},
    {"id": 4, "image_path": 'images/slider-4.jpeg'}
  ];

  final CarouselController carouselController = CarouselController();
  TextEditingController _searchController = TextEditingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add your button 1 action here
                        print('Button 1 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.sports_soccer, // Replace with your desired icon
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add your button 2 action here
                        print('Button 2 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.car_rental, // Replace with your desired icon
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        // Add your button 2 action here
                        print('Button 3 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.gamepad,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        // Add your button 2 action here
                        print('Button 4 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.local_police,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        // Add your button 2 action here
                        print('Button 5 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.extension,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        // Add your button 2 action here
                        print('Button 6 pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Icon(
                        Icons.sports_basketball,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Opacity(
                opacity: 0.7, // Adjust the opacity level as needed (0.0 to 1.0)
                child: InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imagelist
                        .map(
                          (item) =>
                          Image.asset(
                            item['image_path'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                    )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 3,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagelist
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key ? Colors.red : Colors
                            .teal,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),


          ],

        ),
      )
    );
  }
}



