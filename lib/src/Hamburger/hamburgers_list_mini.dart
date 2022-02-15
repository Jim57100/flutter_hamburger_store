import 'package:flutter/material.dart';

class HamburgersListMini extends StatefulWidget {
  const HamburgersListMini({Key? key}) : super(key: key);

  @override
  _HamburgersListMiniState createState() => _HamburgersListMiniState();
}

class _HamburgersListMiniState extends State<HamburgersListMini> {
  //Accès aux Images
  Widget baconImg = SizedBox(
    height: 110,
    child: Image.asset('images/burger_bacon.png'),
  );
  Widget crispyImg = SizedBox(
    height: 80,
    child: Image.asset('images/burger_crispy.png'),
  );
  int items = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 10),
      //Créer une liste
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = index.isEven; //return true
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: index == items ? 20 : 0,
                      ),
                      //Item à l'intérieur du container
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.teal,
                          elevation: 3,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        reverse ? "Crispy Burger" : "Bacon Burger",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                //display image
                Positioned(
                  top: reverse ? 20 : 5,
                  left: reverse ? 10 : 15,
                  child: GestureDetector(
                    onTap: () {},
                    child: reverse ? crispyImg : baconImg,
                  ),
                )
              ],
            );
          }),
    );
  }
}
