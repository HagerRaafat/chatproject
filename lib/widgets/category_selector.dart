import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Groups', 'Media'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      height: 90.0,
      //color: Color(0xFF457B9D),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: 8.5,
                top: 37.0,
                bottom: 13.0,
                left: 8.5,
              ),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: index == selectedIndex ? Colors.white : null,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                alignment: Alignment.center,
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == selectedIndex
                          ? Color(0xFF125589)
                          : Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600
                      //fontWeight: FontWeight.bold,
                      //letterSpacing: 1.2,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
