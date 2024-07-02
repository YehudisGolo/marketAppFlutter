import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.location_on,
          color: Colors.grey[700],
        ),
        title: Text('Jeruselam, Israel',
            style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage())),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Good morning,"),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Lets order some fresh items for you',
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "fresh items",
              style: GoogleFonts.notoSerif(fontSize: 18),
            ),
          ),
          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: EdgeInsets.all(12),
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.shopingItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopingItems[index][0],
                    itemPrice: value.shopingItems[index][1],
                    imagePath: value.shopingItems[index][2],
                    color: value.shopingItems[index][3],
                    onPressed: () => Provider.of<CartModel>(context, listen: false).addItemToCart(index),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
