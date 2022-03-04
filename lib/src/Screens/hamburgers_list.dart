import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salice_flutter/Model/products.dart';
import 'package:salice_flutter/dao/product_dao.dart';
import 'burger_page.dart';

class HamburgersList extends StatefulWidget {
  final int row;
  const HamburgersList({Key? key, required this.row}) : super(key: key);

  @override
  _HamburgersListState createState() => _HamburgersListState();
}

class _HamburgersListState extends State<HamburgersList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240, //hauteur de la row
        margin: const EdgeInsets.only(top: 10),
        child: FutureBuilder(
          future: ProductDao.readProducts(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<ProductsModel>;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return ItemList(item: items, index: index);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List<ProductsModel> item;
  final int index;
  const ItemList({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 240,
          width: 200,
          margin: EdgeInsets.only(
            left: 20,
            right: widget.index == widget.index ? 20 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Burger(
                    widget.item[widget.index].name,
                    widget.item[widget.index].imageUrl,
                    widget.item[widget.index].price,
                    widget.item[widget.index].description,
                  ),
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
                      widget.item[widget.index].name,
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
                        Text(
                          '${widget.item[widget.index].price.toString()}€',
                          style: const TextStyle(
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
                            child: IconButton(
                              icon: widget.item[widget.index].isFavorite
                                  ? const Icon(Icons.star)
                                  : const Icon(Icons.star_border),
                              color: Colors.red[500],
                              onPressed: () {
                                if (widget.item[widget.index].isFavorite) {
                                  setState(() {
                                    ProductDao.writeProducts(widget
                                        .item[widget.index].isFavorite = false);
                                  });
                                } else {
                                  setState(() {
                                    ProductDao.writeProducts(widget
                                        .item[widget.index].isFavorite = true);
                                    print(widget.item[widget.index].isFavorite);
                                  });
                                }
                              },
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
          top: 60,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Burger(
                      widget.item[widget.index].name,
                      widget.item[widget.index].imageUrl,
                      widget.item[widget.index].price,
                      widget.item[widget.index].description),
                ),
              );
            },
            child: SizedBox(
              height: 120,
              child: Image(
                image: NetworkImage(widget.item[widget.index].imageUrl),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
