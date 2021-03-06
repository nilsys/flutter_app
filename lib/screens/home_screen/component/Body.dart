import 'package:flutter/material.dart';
import 'package:flutter_app/common/AppColors.dart';
import 'package:flutter_app/screens/download_form_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/screens/home_screen/component/HomeScreenCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/screens/saved_surveys_screen/saved_surveys_screen.dart';
import 'package:flutter_app/screens/survey_screen/SurveyScreen.dart';

class Body extends StatefulWidget {
  final String token;

  const Body({Key key, this.token}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/screen/home_screen_bg.png"),
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 40,
          left: 100,
          right: 100,
          child: Center(
            child: Text(
              AppLocalizations.of(context).tr("HOME"),
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          right: 10,
          height: MediaQuery.of(context).size.height - 50,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HomeScreenCard(
                    onClick: () async{
                    SharedPreferences share=await SharedPreferences.getInstance();
                    String token=share.getString("token");
                    print(token);
                    if(token!=null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DownloadFormScreen(
                                    token: token,
                                  )));
                    }
                    },
                    icon: "assets/svg/download_form.svg",
                    title: AppLocalizations.of(context).tr("DownLoad Forms"),
                    subtitle: "",
                  ),
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedSurveysScreen()));
                    },
                    icon: "assets/svg/fill_form.svg",
                    title:AppLocalizations.of(context) .tr("Fill Forms"),
                    subtitle: "",
                  ),
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurveyScreen(),
                        ),
                      );
                    },
                    icon: "assets/svg/saved_response.svg",
                    title:AppLocalizations.of(context) .tr("Saved Response"),
                    subtitle: "",
                  ),
                ],
              ),
            ),
          ),
        ),

        //  ListView.builder(itemBuilder: )
      ],
    );
  }
}
