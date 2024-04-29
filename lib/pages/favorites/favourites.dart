import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet/pages/Article/colorwithsize.dart';
import 'package:projet/pages/Article/item.dart';
import 'package:projet/pages/favorites/ConfirmBuy.dart';
import 'package:projet/pages/pallete.dart';

class Myfavourites extends StatefulWidget {
  const Myfavourites({Key? key}) : super(key: key);

  static const route = '/favourites';

  @override
  State<Myfavourites> createState() => _MyfavouritesState();
}

class _MyfavouritesState extends State<Myfavourites> {
  //====declaration===========================
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  List<String> name = [
    'Vintage Tote Vintage Tote Vintage Tote Vintage Tote',
    'City Satchel',
    'Explorer Duffel',
    'Classic Briefcase',
    'Vintage Tote',
    'City Satchel',
    'Explorer Duffel',
    'Classic Briefcase',
  ];
  List<double> price = [1000, 2000, 3000, 4000, 1000, 2000, 3000, 4000];
  List<String> images = [
    'lib/assets/images/hd.jpeg',
    'lib/assets/images/photo.png',
    'lib/assets/images/ph3.png',
    'lib/assets/images/Hd.png',
    'lib/assets/images/hd.jpeg',
    'lib/assets/images/photo.png',
    'lib/assets/images/ph3.png',
    'lib/assets/images/Hd.png'
  ];
  List<ColorData> colorsWithBooleans = [
    ColorData(Colors.red,
        boolValue1: true,
        boolValue2: false,
        boolValue3: true,
        boolValue4: false,
        boolValue5: true,
        boolValue6: false),
    ColorData(Colors.grey,
        boolValue1: false,
        boolValue2: false,
        boolValue3: false,
        boolValue4: false,
        boolValue5: false,
        boolValue6: false),
    ColorData(Colors.green,
        boolValue1: true,
        boolValue2: true,
        boolValue3: true,
        boolValue4: true,
        boolValue5: true,
        boolValue6: true),
    ColorData(Colors.yellow,
        boolValue1: false,
        boolValue2: true,
        boolValue3: false,
        boolValue4: true,
        boolValue5: false,
        boolValue6: true),
    ColorData(Colors.orange,
        boolValue1: true,
        boolValue2: false,
        boolValue3: true,
        boolValue4: false,
        boolValue5: true,
        boolValue6: false),
    ColorData(Colors.purple,
        boolValue1: false,
        boolValue2: true,
        boolValue3: false,
        boolValue4: true,
        boolValue5: false,
        boolValue6: true),
    ColorData(Colors.black,
        boolValue1: true,
        boolValue2: false,
        boolValue3: true,
        boolValue4: false,
        boolValue5: true,
        boolValue6: false),
    ColorData(Colors.black12,
        boolValue1: false,
        boolValue2: true,
        boolValue3: false,
        boolValue4: true,
        boolValue5: false,
        boolValue6: true),
    ColorData(Colors.black54,
        boolValue1: true,
        boolValue2: false,
        boolValue3: true,
        boolValue4: false,
        boolValue5: true,
        boolValue6: false),
    ColorData(Colors.blue,
        boolValue1: false,
        boolValue2: true,
        boolValue3: false,
        boolValue4: true,
        boolValue5: false,
        boolValue6: true),
    ColorData(Colors.pink,
        boolValue1: true,
        boolValue2: false,
        boolValue3: true,
        boolValue4: false,
        boolValue5: true,
        boolValue6: false),
  ];
  List<String> size = [
    'M',
    'L',
    'S',
    'M',
    'L',
    'S',
    'M',
    'M',
  ];

  bool isCart = true;
  double total = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // top: 30,
            child: isCart
                ? (name.isEmpty ? emptycart() : fullfavocart())
                : (name.isEmpty ? emptyfavourites() : fullfavocart()),
          ),
          Positioned(
            top: 40,
            left: 23,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
          if (isCart &&
              name.isNotEmpty &&
              price.isNotEmpty &&
              images.isNotEmpty) // If it's a cart, show buy button
            Positioned(
              bottom: 110,
              right: 17,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color(0xFFD9D9D9),
                          content: Confirmbuy(
                              total: total,
                              emailController: email,
                              addressController: address,
                              phoneNumberController: phonenumber));
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.iconsvgcolor,
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(color: Pallete.texticon),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget fullfavocart() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: GridView.builder(
        itemCount: name.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 5,
          mainAxisExtent: 240,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => MyBottomSheet(
                  name: name[index],
                  price: price[index],
                  image: images[index],
                  isSignedIn: false,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25,
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: const EdgeInsets.only(left: 1),
                      child: Center(
                        child: Image.asset(
                          images[index],
                          height: 300,
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Price : ${price[index]} DA',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Size : ${size[index]}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Color :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.circle,
                                color: colorsWithBooleans[index].color,
                                size: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  name.removeAt(index);
                                  colorsWithBooleans.removeAt(index);
                                  price.removeAt(index);
                                  size.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Pallete.iconsvgcolor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget emptyfavourites() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'lib/assets/svgs/face-frown-solid 1.svg',
              color: Pallete.iconsvgcolor,
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'No itmes added !',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                height: 1.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget emptycart() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'lib/assets/svgs/epmtycart.svg',
              color: Pallete.iconsvgcolor,
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 45),
            child: const Text(
              'No item to added !',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                height: 1.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
