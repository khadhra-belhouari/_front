import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet/pages/Article/colorwithsize.dart';
import 'package:projet/pages/Article/liked.dart';
import 'package:projet/pages/Article/rate.dart';
import 'package:projet/pages/Article/sized.dart';
import 'package:projet/pages/pallete.dart';

class MyBottomSheet extends StatefulWidget {
  //====declaration===========================
  final String name;
  final double price;
  final String image;
  final bool isSignedIn;

  const MyBottomSheet({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.isSignedIn,
  }) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  //=======declaration
  final bool _isLiked = false;
  bool isTextFilled = false;

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
  List<String> comments = [
    'Great product!',
    'I love the design.',
    'Amazing quality.',
    'These shoes exceeded my expectations with their impeccable comfort and stylish design. From long walks to casual outings, they are the perfect blend of fashion and function',
    'I love these colorways! I wore them one time so far and have had compliment after compliment. I love the feel of these shoes, they’re so',
    'The design is sleek and modern, making them a fashion',
    'Great product!',
    'I love the design.',
    'Amazing quality.',
    'These shoes exceeded my expectations with their impeccable comfort and stylish design. From long walks to casual outings, they are the perfect blend of fashion and function',
    'I love these colorways! I wore them one time so far and have had compliment after compliment. I love the feel of these shoes, they’re so',
    'The design is sleek and modern, making them a fashion'
  ];

  TextEditingController commentController = TextEditingController();

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  double rate = 4.5;
  double revrate = 4.3;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;
  bool starreviews = false;
  bool rateimage = false;

  String val = '1';

  bool xs = false;
  bool s = false;
  bool m = false;
  bool l = false;
  bool xl = false;
  bool xxl = false;

  @override
  void initState() {
    super.initState();
    xs = colorsWithBooleans[0].boolValue1;
    s = colorsWithBooleans[0].boolValue2;
    m = colorsWithBooleans[0].boolValue3;
    l = colorsWithBooleans[0].boolValue4;
    xl = colorsWithBooleans[0].boolValue5;
    xxl = colorsWithBooleans[0].boolValue6;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: 130,
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/svgs/Line 18.svg',
                  width: 10,
                  height: 10,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  Image.asset(
                      alignment: Alignment.center,
                      widget.image,
                      height: 300,
                      fit: BoxFit.fitHeight),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            widget.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          rate.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Ratestar(isRated: rateimage),
                        ),
                        Liked(islaked: _isLiked, isSigned: widget.isSignedIn),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
//=======================================colors=================================
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              transformAlignment: Alignment.centerLeft,
                              height: 35,
                              width: 200,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(left: 0),
                                scrollDirection: Axis.horizontal,
                                itemCount: colorsWithBooleans.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 30,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        padding: const EdgeInsets.only(left: 0),
                                        onPressed: () {
                                          setState(() {
                                            xs = colorsWithBooleans[index]
                                                .boolValue1;
                                            s = colorsWithBooleans[index]
                                                .boolValue2;
                                            m = colorsWithBooleans[index]
                                                .boolValue3;
                                            l = colorsWithBooleans[index]
                                                .boolValue4;
                                            xl = colorsWithBooleans[index]
                                                .boolValue5;
                                            xxl = colorsWithBooleans[index]
                                                .boolValue6;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.circle,
                                          size: 30,
                                        ),
                                        color: colorsWithBooleans[index].color,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
//==============================================================================
                            const Positioned(
                              top: 8,
                              left: 195,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                                size: 20,
                              ),
                            )
                          ],
                        ),
//========quantity==============================================================
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.centerRight,
                              height: 30,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: DropdownButton<String>(
                                onTap: () {},
                                iconDisabledColor: const Color(0xFFA0887F),
                                itemHeight: 50,
                                underline: const Divider(
                                  thickness: 0,
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                dropdownColor: Pallete.iconsvgcolor,
                                value: val,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    val = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//==============================================================================
                  Itemsized(
                    boolValue1: xs,
                    boolValue2: s,
                    boolValue3: m,
                    boolValue4: m,
                    boolValue5: xl,
                    boolValue6: xxl,
                  ),
//============Add to cart=======================================================<
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: widget.isSignedIn
                              ? () {
                                  // Add your logic here for adding to cart
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.isSignedIn
                                ? Pallete.iconsvgcolor
                                : Colors.grey,
                            minimumSize: const Size(100, 45),
                          ),
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(color: Pallete.texticon),
                          ),
                        ),
//==============================================================================
                        const SizedBox(width: 60),
                        Text(
                          '${widget.price.toString()}DA',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ),
//==============================================================================
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 20),
                    child: Row(
                      children: [
                        const Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          revrate.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Ratestar(isRated: starreviews),
                      ],
                    ),
                  ),
//==============================================================================
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: [
                        Ratestar(isRated: star1),
                        Ratestar(isRated: star2),
                        Ratestar(isRated: star3),
                        Ratestar(isRated: star4),
                        Ratestar(isRated: star5),
                      ],
                    ),
                  ),
//==============================================================================
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 243, 243),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: TextField(
                                controller: commentController,
                                maxLines: null,
                                minLines: 1,
                                maxLength: 500,
                                onChanged: (text) {
                                  setState(() {
                                    isTextFilled = text.isNotEmpty;
                                  });
                                },
                                decoration: const InputDecoration(
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Add a comment...',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: ElevatedButton(
                              onPressed: commentController.text.isNotEmpty
                                  ? () {
                                      setState(() {
                                        comments.add(commentController.text);
                                        commentController.clear();
                                        isTextFilled = false;
                                      });
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                backgroundColor: Pallete.iconsvgcolor,
                              ),
                              child: const Text(
                                'Post',
                                style: TextStyle(color: Pallete.texticon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(comments[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
