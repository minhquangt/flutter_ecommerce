import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:provider/provider.dart';

class SearchDrawer extends StatefulWidget {
  @override
  _SearchDrawerState createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: TextFormField(
            onSaved: (value) {},
            decoration: InputDecoration(
              hintText: 'Tìm kiếm sản phẩm',
              labelText: 'Tìm kiếm',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
