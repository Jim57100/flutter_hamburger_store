import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({required this.email, Key? key}) : super(key: key);
  final String email;
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    String email = widget.email;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height / 5,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(45),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 2),
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: 35,
                              child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/avatar.png'),
                                  radius: 30),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(email,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black54),
                                  child: const Text(
                                    'Best customer',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              '0€',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              //BARRE DE RECHERCHE
              Positioned(
                //défini le 0 du bottol
                bottom: 0,
                child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: Card(
                    color: light ? Colors.white : Theme.of(context).cardColor,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'What does your belly want to eat ?',
                        suffixIcon: Icon(
                          Icons.search,
                          color: light ? Colors.black54 : Colors.white60,
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
