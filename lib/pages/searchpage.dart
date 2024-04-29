import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet/pages/Article/item.dart';
import 'package:projet/pages/pallete.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //====declaration===========================
  late TextEditingController searchController;
  String? selectedValue;
  String? val;

  bool isfound = true;
  final bool _isSignedIn = false;

  List<String> name = [
    'Vintage Tote',
    'City Satchel City Satchel City Satchel',
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

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                // padding: EdgeInsets.only(top: screenHeight * 0.078),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.83,
                    height: screenHeight * 0.058,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        autocorrect: true,
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          suffixIcon: searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchController.clear();
                                    });
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: screenHeight * 0.13,
            child: searchController.text.isNotEmpty
                ? searchScreen()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget searchScreen() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (name.isNotEmpty && isfound && price.isNotEmpty && images.isNotEmpty) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(left: 60, top: 20, bottom: 10, right: 60),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButton<String>(
                    underline: const Divider(
                      thickness: 0,
                      color: Colors.transparent,
                    ),
                    hint: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Gender')),
                    borderRadius: BorderRadius.circular(15),
                    iconDisabledColor: Colors.grey,
                    dropdownColor: Pallete.iconsvgcolor,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['Men', 'Women', 'Kids']
                        .map<DropdownMenuItem<String>>((String value) {
                      Widget icon;
                      if (value == 'Men') {
                        icon = const Icon(Icons.person);
                      } else if (value == 'Women') {
                        icon = SvgPicture.asset(
                          'lib/assets/svgs/women.svg',
                          width: 15,
                          height: 15,
                        );
                      } else {
                        icon = const Icon(Icons.child_care);
                      }
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            icon,
                            const SizedBox(width: 8),
                            Text(
                              value,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButton<String>(
                    iconDisabledColor: Colors.grey,
                    itemHeight: 50,
                    underline: const Divider(
                      thickness: 0,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Pallete.iconsvgcolor,
                    hint: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Price')),
                    value: val,
                    onChanged: (String? newValue) {
                      setState(() {
                        val = newValue!;
                      });
                    },
                    items: <String>[
                      '0-1000DA',
                      '1000-2000DA',
                      '2000-3500DA',
                      '3500-4500DA',
                      '4500-5500DA',
                      '++5500DA'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: name.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: screenWidth * 0.05,
                childAspectRatio: 0.8,
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
                        isSignedIn: _isSignedIn,
                      ),
                    );
                  },
                  child: Column(children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 20, left: 20),
                      // width: screenWidth * 0.4,
                      // height: screenHeight * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          images[index],
                          width: 150,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // const
                    SizedBox(
                      // height: 5,
                      height: screenHeight * 0.006,
                    ),
                    Container(
                      // width: 140,
                      width: screenWidth * 0.35,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        name[index],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      // width: 140,
                      width: screenWidth * 0.35,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${price[index]} DA',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'lib/assets/svgs/file-search-icon.svg',
                width: 140,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'No results found     ',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "We couldn't find what you are looking for",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
  }
}
