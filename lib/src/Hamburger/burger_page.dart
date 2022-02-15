import 'hamburgers_list_mini.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  const Burger(this.title, {Key? key}) : super(key: key);
  final String title;
  // static const tag = "burger_page";
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
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

  int numberOfBurgers = 0;

  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    // var title = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context)
        .size; //Donne la hauteur et la largeur de l'application
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15,
              child: CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.png'), radius: 15),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Deliver Me Burger. Fast Delivery & Great Service!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                //Espacement
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // nameArgument == "Crispy Burger" ? crispyImg : baconImg,
                    widget.title == 'Bacon'
                        ? baconImg
                        : widget.title == 'Chicken'
                            ? crispyImg
                            : widget.title == 'Fish'
                                ? fishImg
                                : widget.title == 'Wrap'
                                    ? wrapImg
                                    : whopperImg,
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[350]),
                          child: const Text(
                            '6.95€',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.teal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            child: Container(
              width: size.width,
              color: light
                  ? const Color.fromRGBO(240, 240, 240, 1)
                  : const Color.fromRGBO(20, 20, 20, 1),
              height: size.height / 1.6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "Chuck Norris can clap with one hand. Chuck Norris doesn’t read books. He stares them down until he gets the information he wants. When Chuck Norris does a pushup, he’s pushing the Earth down. The dark is afraid of Chuck Norris. Chuck Norris can make a slinky go upstairs.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const HamburgersListMini(),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  setState(() {
                                    numberOfBurgers = numberOfBurgers - 1;
                                  });
                                },
                                color: Colors.orangeAccent,
                              ),
                              Text(numberOfBurgers.toString()),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  setState(() {
                                    numberOfBurgers = numberOfBurgers + 1;
                                  });
                                },
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ),
                        //Buttons on bottom page
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: MaterialButton(
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)),
                              onPressed: () {},
                              child: const Text(
                                "Buy now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
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
        },
      ),
    );
  }
}
