import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/search/screens/home/components/home_screen.dart';


class carouselSlider extends StatelessWidget {
  const carouselSlider({
    Key key,
    this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: const ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        height: double.infinity,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: images
          .map(
            (e) => Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 221, 218, 233).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 30.0,
                    offset: -Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(e),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xffae9fe0),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 228, 25, 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
