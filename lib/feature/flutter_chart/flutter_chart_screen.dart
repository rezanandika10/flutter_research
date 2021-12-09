import 'package:flutter/material.dart';
import 'package:flutter_research/styles/fontTheme.dart';

class FlutterChartScreen extends StatefulWidget {
  @override
  _FlutterChartScreenState createState() => _FlutterChartScreenState();
}

class _FlutterChartScreenState extends State<FlutterChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                ),
                color: Color(0xFFFFCF86),
              ),
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/chartVector.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                          top: 35,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'FLUTTER CHART',
                              style: titleHeaderWhiteLSpacing,
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  ),
                  Container(
                      width: 208, child: Image.asset('assets/chartImage.png'))
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
