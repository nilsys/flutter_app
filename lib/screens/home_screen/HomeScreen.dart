import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen/component/Body.dart';
import 'package:flutter_app/widget/BottomBar.dart';
import 'package:flutter_app/widget/DrawerWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({Key key, this.token}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String token;
  void getToken() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    token=sharedPreferences.getString('token');

  }
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    print('token');
    print(token);
    return Scaffold(
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Body(
            token:widget.token
          ),
        ),
        bottomNavigationBar: BottomBar());
  }
}
