import 'package:flutter/material.dart';
import 'burger_page.dart';
import 'productexecutor.dart';

class HamburgersList extends StatefulWidget {
  final int row;
  const HamburgersList({Key? key, required this.row}) : super(key: key);

  @override
  _HamburgersListState createState() => _HamburgersListState();
}

class _HamburgersListState extends State<HamburgersList> {
  @override
  Widget build(BuildContext context) {
    ///Variables
    int index = 5;
    List<String> burgers = <String>[
      'Bacon',
      'Chicken',
      'Fish',
      'Wrap',
      'Whopper'
    ];

    //Images
    Widget baconImg = SizedBox(
      height: 120,
      child: Image.asset('images/burgers/bacon.png'),
    );
    Widget crispyImg = SizedBox(
      height: 120,
      child: Image.asset('images/burgers/crispy.png'),
    );
    Widget wrapImg = SizedBox(
      height: 120,
      child: Image.asset('images/burgers/wrap.png'),
    );
    Widget fishImg = SizedBox(
      height: 120,
      child: Image.asset('images/burgers/fish.png'),
    );
    Widget whopperImg = SizedBox(
      height: 120,
      child: Image.asset('images/burgers/whopper.png'),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240, //hauteur de la row
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: index,
          itemBuilder: (context, index) {
            // bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: index == index ? 20 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Fait passer une variable d'une page à une autre
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Burger(burgers[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              burgers[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                const Text(
                                  '6.95€',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Burger(burgers[index]),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        burgers[index] == 'Bacon'
                            ? baconImg
                            : burgers[index] == 'Chicken'
                                ? crispyImg
                                : burgers[index] == 'Fish'
                                    ? fishImg
                                    : burgers[index] == 'Wrap'
                                        ? wrapImg
                                        : whopperImg,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
