import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce_ui_kit/models/category.dart';

class Categorise extends StatefulWidget {
  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Mục'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 8),
              children: List.generate(categoryList.length, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: categoryList[index].image,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          ),
                          ListTile(
                              title: Text(
                            categoryList[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
