import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce_ui_kit/models/category.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import 'search.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<Map<dynamic, dynamic>> products = [
    {
      'name': 'ÁO BLAZER - BL23899',
      'rating': 5.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683045194/design_ui/ezgif.com-webp-to-jpg_1_joc4qb.jpg',
      'price': '650.000'
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
      'name': 'ÁO POLO - APV231370',
      'rating': 3.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683021119/design_ui/apv231370._51_twkxmp.jpg',
      'price': '620.000'
    },
    {
      'name': 'ÁO POLO - APV231368',
      'rating': 4.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020713/design_ui/apv231368_3m_._53_cnmzgr.jpg',
      'price': '550.000'
    },
    {
      'name': 'ÁO POLO - APV231356',
      'rating': 3.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020999/design_ui/apv231356._13_uix6l8.jpg',
      'price': '500.000'
    },
    {
      'name': 'ÁO TSHIRT - TSN220972',
      'rating': 4.0,
      'image':
          'https://res.cloudinary.com/minhquangt/image/upload/v1683020985/design_ui/tsn220972._23_fsvyyr.jpg',
      'price': '370.000'
    },
  ];

  final List<Map<dynamic, dynamic>> productFeatured = [
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState!
                    .showBottomSheet((context) => ShopSearch());
              },
            )
          ],
          title: Text('Sản phẩm'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 150.0),
                      child: Material(
                        color: Theme.of(context).colorScheme.secondary,
                        child: TabBar(
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(icon: Icon(Icons.view_list)),
                            Tab(icon: Icon(Icons.grid_on)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: ListView(
                              children: products.map((product) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        print('Card tapped.');
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Divider(
                                            height: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, bottom: 10.0),
                                            child: ListTile(
                                              trailing:
                                                  Icon(Icons.navigate_next),
                                              leading: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: product['image'],
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        new Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                product['name'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 2.0,
                                                                bottom: 1),
                                                        child: Text(
                                                            '${product['price']}',
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      RatingStars(
                                                        value:
                                                            product['rating'],
                                                        starSize: 16,
                                                        valueLabelColor:
                                                            Colors.amber,
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
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              padding: EdgeInsets.only(
                                  top: 8, left: 6, right: 6, bottom: 12),
                              children: List.generate(productFeatured.length,
                                  (index) {
                                return Container(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        print('Card tapped.');
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                5),
                                            width: double.infinity,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: productFeatured[index]
                                                  ['image'],
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: ListTile(
                                              title: Text(
                                                productFeatured[index]['name'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 2.0,
                                                                bottom: 1),
                                                        child: Text(
                                                            '${productFeatured[index]['price']}',
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
