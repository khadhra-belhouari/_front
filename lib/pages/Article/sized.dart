import 'package:flutter/material.dart';

class Itemsized extends StatefulWidget {
  final bool boolValue1;
  final bool boolValue2;
  final bool boolValue3;
  final bool boolValue4;
  final bool boolValue5;
  final bool boolValue6;

  const Itemsized({
    Key? key,
    required this.boolValue1,
    required this.boolValue2,
    required this.boolValue3,
    required this.boolValue4,
    required this.boolValue5,
    required this.boolValue6,
  }) : super(key: key);

  @override
  State<Itemsized> createState() => _ItemsizedState();
}

class _ItemsizedState extends State<Itemsized> {
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(sizes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 1),
            child: SizedBox(
              width: 40,
              height: 40,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    fontSize: 20,
                    color: _getTextColor(index),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Color _getTextColor(int index) {
    if (index == 0 && widget.boolValue1) return Colors.black;
    if (index == 1 && widget.boolValue2) return Colors.black;
    if (index == 2 && widget.boolValue3) return Colors.black;
    if (index == 3 && widget.boolValue4) return Colors.black;
    if (index == 4 && widget.boolValue5) return Colors.black;
    if (index == 5 && widget.boolValue6) return Colors.black;
    return Colors.grey;
  }
}
