import 'package:ecom/views/listCategories.dart';
import 'package:flutter/material.dart';


import 'package:ecom/widgets/button_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';



class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [


        PageViewModel(
          title: 'bienvenue sur notre restaurant',
          body: '',

          image: Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9453c424618659.5633738cf27d2.jpg"),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'La mascotte est votre meilleure adresse 👌🏼',
          body: 'Rejoignez-nous',
          footer: Column(
            children: [
              RaisedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => listecategories()));
                },
                color: Colors.purpleAccent,
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "S'authentifier",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(

                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => listecategories()));
                },
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 70,vertical: 15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.purpleAccent),

                ),
              ),
            ],
          ),
      image: Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9453c424618659.5633738cf27d2.jpg"),
                  decoration: getPageDecoration(),
        ),
      ],
      done: Text('login', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: false,
      skip: Text('Skip'),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).backgroundColor,
      dotsFlex: 0,
      nextFlex: 0,
      //isProgressTap: true,
      // isProgress: true,
      //showNextButton: true,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => listecategories()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    activeColor: Colors.purpleAccent,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),

    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}