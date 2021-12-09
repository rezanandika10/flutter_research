import 'package:flutter/material.dart';
import 'package:flutter_research/home/screen/home_screen.dart';
import 'package:flutter_research/styles/fontTheme.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidAnimationScreen extends StatefulWidget {
  @override
  _LiquidAnimationScreenState createState() => _LiquidAnimationScreenState();
}

class _LiquidAnimationScreenState extends State<LiquidAnimationScreen> {
  List<Widget> _pages(BuildContext context) => [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/slide1.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Our Initiative',
                  style: titleCardBlack,
                ),
                Text(
                  'features research',
                  style: titleSubHeader,
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/slide2.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'State Management ',
                  style: titleCardWhite,
                ),
                Text(
                  'and widgets',
                  style: titleSubHeaderWhite,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(8, 32, 8, 8),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/welcome.png'),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 4),
                    child: Text(
                      'Mobile',
                      style: sans16WhiteBold,
                    ),
                  ),
                  Icon(
                    Icons.phone_android_outlined,
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'Squad',
                      style: sans16WhiteBold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 64),
                child: Text(
                  'Flutter Research',
                  style: titleHeaderWhite,
                ),
              ),
              Container(
                width: 350,
                padding: EdgeInsets.only(top: 10, left: 32, right: 32),
                child: Text(
                  'Better features and greater efficiency in the future.',
                  style: sans16White,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 400),
                width: 480,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    "GET STARTED",
                    style: sans16Black,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shape: StadiumBorder()),
                ),
              )
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: _pages(context),
      enableLoop: false,
      waveType: WaveType.liquidReveal,
    );
  }
}
