import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/models/category.dart';
import 'package:flutter_ecommerce_ui_kit/models/product.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categoryList = [
    Category('Áo T-Shirt',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683035861/design_ui/photo-1527719327859-c6ce80353573_dvuvlr.jpg'),
    Category('Áo Polo',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683035861/design_ui/photo-1604006852748-903fccbc4019_kjipkh.jpg'),
    Category('Áo Sơ Mi',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683035861/design_ui/photo-1621072156002-e2fccdc0b176_pxwpwo.jpg'),
    Category('Áo Blazer',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683038750/design_ui/photo-1617137984095-74e4e5e3613f_ysvpth.jpg'),
  ];
  final List<Product> productList = [
    Product(
        'ÁO POLO - APV231370',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683021119/design_ui/apv231370._51_twkxmp.jpg',
        '620.000',
        'Áo Polo kiểu dáng body fit, tôn dáng người mặc. Màu sắc trung tính, dễ phối đồ. Chất liệu: CVC Spandex'),
    Product(
        'ÁO POLO - APV231356',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683020999/design_ui/apv231356._13_uix6l8.jpg',
        '500.000',
        'Chất liệu: CVC Spandex. Kiểu dáng: Bodyfit form dáng đẹp, phù hợp mặc công sở, đi chơi. Màu sắc thanh lịch, dễ phối đồ.'),
    Product(
        'ÁO TSHIRT - TSN220972',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683020985/design_ui/tsn220972._23_fsvyyr.jpg',
        '370.000',
        'Áo Tshirt chất liệu nhẹ, mát, thấm hút mồ hôi tốt. Thiết kế trẻ trung, năng động, màu sắc tôn da. Phù hợp mặc đi làm, đi dạo phố, du lịch, dễ phối với nhiều kiểu quần hoặc phụ kiện.'),
    Product(
        'ÁO SƠ MI - AR230326DT',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683020953/design_ui/ezgif.com-webp-to-jpg_rrae4o.jpg',
        '420.000',
        'Áo sơ mi dài tay tay, kiểu dáng Regular Fit dễ mặc, hợp form dáng. Màu sắc và kiểu dáng trẻ trung, kiểu dáng hiện đại, dễ phối đồ. Chất liệu: 25% modal 75% microfiber'),
    Product(
        'ÁO T-SHIRT - TSN220396',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683020721/design_ui/tsn220396_1__slmqkm.jpg',
        '320.000',
        'Chất liệu vải cotton mềm mại, nhẹ nhàng. Thiết kế trẻ trung form Body Fit dễ mặc, giúp tôn lên vóc dáng nam giới. Gam màu đen lịch lãm, hiện đại dễ phối đồ.'),
    Product(
        'ÁO POLO - APV231368',
        'https://res.cloudinary.com/minhquangt/image/upload/v1683020713/design_ui/apv231368_3m_._53_cnmzgr.jpg',
        '550.000',
        'Áo Polo kiểu dáng body fit, tôn dáng người mặc. Màu sắc trung tính, dễ phối đồ. Chất liệu: CVC Spandex'),
  ];

  bool _isTextFieldVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            AppLocalizations.of(context)!
                                    .translate('NEW_ARRIVALS') ??
                                '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        height: 240.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: productList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 128.0,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/products',
                                            arguments: i);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 160,
                                            child: Hero(
                                              tag: '${i.name}',
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: i.image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              i.name,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            subtitle: Text('${i.price}',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-1.jpg'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('Danh mục',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor),
                                child: Text('Xem tất cả',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(categoryList.length, (index) {
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
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                70,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: categoryList[index].image,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                        categoryList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-2.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
