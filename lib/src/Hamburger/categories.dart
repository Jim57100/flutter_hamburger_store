import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0; //variable des boutons
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    int items = 4;
    List<String> categories = <String>[
      'Menus',
      'Burgers',
      'Desserts',
      'Beverages'
    ];
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: items,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.only(
                    left: (index == 0) ? 20 : 0, //padding
                    right: 20,
                  ),
                  //AddEventListener
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSelectedItem = index;
                      });
                    },
                    child: Card(
                      color: index == currentSelectedItem
                          ? light
                              ? Colors.black.withOpacity(0.7)
                              : Colors.teal
                          : light
                              ? Colors.white
                              : Theme.of(context).cardColor,
                      child: Icon(
                        Icons.fastfood,
                        color: index == currentSelectedItem
                            ? Colors.white
                            : light
                                ? Colors.black.withOpacity(0.7)
                                : Colors.white,
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.all(10),
                      //Round border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ]),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 20 : 0, //padding
                    right: 20,
                  ),
                  width: 90,
                  child: Row(
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        categories[index],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
