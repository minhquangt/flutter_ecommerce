import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/models/user.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User(password: '', username: '', email: '');
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập tên đăng nhập';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.username = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Nhập tên đăng nhập',
                      labelText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.email = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Nhập email',
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.password = value!;
                        });
                      },
                      onChanged: (text) {
                        user.password = text;
                      },
                      decoration: InputDecoration(
                        hintText: 'Nhập mật khẩu',
                        labelText: 'Mật khẩu',
                      ),
                      obscureText: true),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng nhập lại mật khẩu';
                    } else if (user.password != confirmPassword) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    confirmPassword = text;
                  },
                  decoration: InputDecoration(
                    hintText: 'Nhập lại mật khẩu',
                    labelText: 'Xác nhận mật khẩu',
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<AuthBlock>(builder:
                        (BuildContext context, AuthBlock auth, Widget? child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: auth.loading && auth.loadingType == 'register'
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Đăng Ký',
                                style: TextStyle(color: Colors.white),
                              ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              !auth.loading) {
                            _formKey.currentState!.save();
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            auth.register(user);
                          }
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
