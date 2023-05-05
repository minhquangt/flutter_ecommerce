import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class WishList extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<WishList> {
  final List<Map<dynamic, dynamic>> products = [
    {
      'name': 'ÁO BLAZER - BL23899',
      'rating': 5.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683045194/design_ui/ezgif.com-webp-to-jpg_1_joc4qb.jpg',
      'price': '650.000'
    },
    {
      'name': 'ÁO SƠ MI - AR230326DT',
      'rating': 5.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020953/design_ui/ezgif.com-webp-to-jpg_rrae4o.jpg',
      'price': '420.000'
    },
    {
      'name': 'ÁO T-SHIRT - TSN220396',
      'rating': 4.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020721/design_ui/tsn220396_1__slmqkm.jpg',
      'price': '320.000',
    },
    {
      'name': 'ÁO POLO - APV231368',
      'rating': 4.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020713/design_ui/apv231368_3m_._53_cnmzgr.jpg',
      'price': '550.000'
    },
    {
      'name': 'ÁO TSHIRT - TSN220972',
      'rating': 4.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020985/design_ui/tsn220972._23_fsvyyr.jpg',
      'price': '370.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản Phẩm Yêu Thích'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(UniqueKey().toString()),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                // Then show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(item['name'] + " dismissed"),
                    duration: Duration(seconds: 1)));
              } else {
                // Then show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(item['name'] + " added to carts"),
                    duration: Duration(seconds: 1)));
              }
              // Remove the item from the data source.
              setState(() {
                products.removeAt(index);
              });
            },
            // Show a red background as the item is swiped away.
            background: Container(
              decoration: BoxDecoration(color: Colors.green),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.add_shopping_cart, color: Colors.white),
                  ),
                ],
              ),
            ),
            secondaryBackground: Container(
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
            ),
            child: InkWell(
              onTap: () {
                print('Card tapped.');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ListTile(
                      trailing: Icon(Icons.swap_horiz),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.blue),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: item['image'],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          ),
                        ),
                      ),
                      title: Text(
                        item['name'],
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2.0, bottom: 1),
                                child: Text('${item['price']}',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RatingStars(
                                value: item['rating'],
                                starSize: 16,
                                valueLabelColor: Colors.amber,
                                starColor: Colors.amber,
                              )
                            ],
                          )
                        ],
                      ),
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
