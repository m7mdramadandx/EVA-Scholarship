import 'package:eva_pharma/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Opportunity opportunity;

  const Details({Key key, this.opportunity}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isFavorite = true;
  int numOfItems = 1, colorIndex = 0, cartItem = 0;
  String _imgUrl;

  @override
  initState() {
    super.initState();
    // _imgUrl = widget.opportunity.imgUrl;
    // _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        /*
      backgroundColor: widget.opportunity.color,
      appBar: AppBar(
        backgroundColor: widget.opportunity.color,
        title: Text(widget.opportunity.title),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Container(
            width: 45,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.shopping_cart),
                cartItem != 0
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: Text('$cartItem'),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(width: 8)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.15, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: silver,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    children: <Widget>[
                      itemInfo(),
                      SizedBox(height: 10),
                      itemActions(product: widget.opportunity),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                mainItemInfo()
              ],
            )
          ],
        ),
      ),

       */
        );
  }
/*
  Widget mainItemInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Price\n"),
                TextSpan(
                  text: "\$${widget.opportunity.price}",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            width: 200,
            child: Hero(
              tag: "${widget.opportunity.id}",
              child: CachedNetworkImage(
                imageUrl: _imgUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.scaleDown),
                      boxShadow: [BoxShadow(color: Colors.transparent)]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemInfo() {
    Product product = widget.opportunity;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Color"),
                Container(
                  height: 50,
                  width: 200,
                  child: ListView.builder(
                    itemCount: product.productItem.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(4),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          _imgUrl = product.productItem[index].imgUrl;
                          colorIndex = index;
                        });
                      },
                      child: colorPicker(product.productItem[index].color),
                    ),
                  ),
                )
              ],
            ),
            RichText(
              text: TextSpan(
                text: "Size\n",
                style: TextStyle(color: product.color),
                children: [
                  TextSpan(
                      text: "${product.size}",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: product.color, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(product.description, style: TextStyle(height: 1.5)),
      ],
    );
  }

  Widget itemActions({Product product}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            cartCounter(),
            FloatingActionButton(
              elevation: 8,
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey),
              backgroundColor: Colors.white,
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: product.color, width: 2)),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    setState(() {
                      _incrementCounter();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: product.color,
                  onPressed: () {
                    _resetCounter();
                  },
                  child: Text("BUY  NOW",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cartCounter() {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: TextStyle(fontSize: 19),
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  Widget colorPicker(Color color) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 24,
      width: 24,
      child: color == widget.opportunity.productItem[colorIndex].color
          ? Icon(Icons.check)
          : Container(),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: primaryColor2),
        shape: BoxShape.circle,
      ),
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        borderSide: BorderSide(color: widget.opportunity.color, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
  */
}
