import '../Widget/hamburgers_list_mini.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  const Burger(this.name, this.image, this.price, this.description, {Key? key})
      : super(key: key);
  final String name;
  final String image;
  final double price;
  final String description;

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

  ///SubWidgets
  Widget _bottomButtons() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Theme.of(context).primaryColor.withOpacity(0.2),
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
                onPressed: () {
                  // context.read<FileController>().writeCart();
                },
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
    );
  }

  Widget _images() {
    return SizedBox(
      height: 120,
      child: Image(
        image: NetworkImage(widget.image),
      ),
    );
  }

  Widget _textDescription() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceAndRate() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[350]),
          child: Text(
            '${widget.price.toString()}€',
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
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
    );
  }

  Widget _textDescriptionLanscape() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  ///Widgets
  Widget _presentation() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
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
              _images(),
              const Spacer(),
              _priceAndRate(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textualInfo() {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
      child: ClipRRect(
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
              _textDescription(),
              const Spacer(),
              const HamburgersListMini(),
              _bottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _presentationLandscape() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
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
              _images(),
              const Spacer(),
              _priceAndRate(),
            ],
          ),
          const Spacer(),
          _bottomButtons(),
        ],
      ),
    );
  }

  Widget _textualInfoLandscape() {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 1.1,
      child: ClipRRect(
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
              _textDescriptionLanscape(),
              const Spacer(),
              const HamburgersListMini(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _layoutDetail() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Column(
        children: <Widget>[
          _presentation(),
          const Spacer(),
          _textualInfo(),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          _presentationLandscape(),
          _textualInfoLandscape(),
        ],
      );
    }
  }

  ///Variables
  int numberOfBurgers = 0;

  @override
  Widget build(BuildContext context) {
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
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            child: _layoutDetail(),
          );
        },
      ),
    );
  }
}
