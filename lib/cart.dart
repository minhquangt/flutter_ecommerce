import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final List<Map<dynamic, dynamic>> products = [
    {
      'name': 'ÁO BLAZER - BL23899',
      'rating': 5.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683045194/design_ui/ezgif.com-webp-to-jpg_1_joc4qb.jpg',
      'price': '200.000'
    },
    {
      'name': 'ÁO SƠ MI - AS230027D',
      'rating': 3.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683045194/design_ui/ezgif.com-webp-to-jpg_2_dgbrym.jpg',
      'price': '500.000'
    },
    {
      'name': 'ÁO SƠ MI - AR230326DT',
      'rating': 3.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020953/design_ui/ezgif.com-webp-to-jpg_rrae4o.jpg',
      'price': '300.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Giỏ Hàng'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Container(
                  child: Text(
                      products.length.toString() + " sản phẩm ở trong giỏ hàng",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
            ),
            Flexible(
              child: ListView.builder(
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
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
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
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: ListTile(
                                trailing: Text('${item['price']}'),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: item['image'],
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
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
                                          padding: const EdgeInsets.only(
                                              top: 2.0, bottom: 1),
                                          child: Text('Còn hàng',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontWeight: FontWeight.w700,
                                              )),
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
                  }),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Tổng",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                        Text("1.030.000",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child:
                                Text("Tổng ", style: TextStyle(fontSize: 14))),
                        Text("1.000.000",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Phí ship",
                                style: TextStyle(fontSize: 14))),
                        Text("30.000",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 50, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/order');
                  },
                  child: Text(
                    "MUA HÀNG",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
