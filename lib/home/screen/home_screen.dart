import 'package:flutter/material.dart';
import 'package:flutter_research/home/data/cardModel.dart';
import 'package:flutter_research/styles/fontTheme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardModel> cardModelList = [
    CardModel(
        title: 'Local Auth', path: 'assets/CardImage01.png', color: 0xFFEBE4D6),
    CardModel(title: 'GetX', path: 'assets/CardImage02.png', color: 0xFF03174C),
    CardModel(
        title: 'Flutter Chart',
        path: 'assets/CardImage03.png',
        color: 0xFFFFCF86),
    CardModel(
        title: 'SQFLite', path: 'assets/CardImage04.png', color: 0xFFFA6E5A),
    CardModel(
        title: 'Slider', path: 'assets/CardImage05.png', color: 0xFF6CB28E),
    CardModel(
        title: 'Pull Refresh',
        path: 'assets/CardImage06.png',
        color: 0xFF8E97FD),
    CardModel(
        title: 'Liquid Animation',
        path: 'assets/CardImage01.png',
        color: 0xFFEBE4D6),
    CardModel(
        title: 'Crashlytics',
        path: 'assets/CardImage02.png',
        color: 0xFF03174C),
    CardModel(
        title: 'Voice to Text',
        path: 'assets/CardImage03.png',
        color: 0xFFFFCF86),
    CardModel(
        title: 'Chat on Apps',
        path: 'assets/CardImage04.png',
        color: 0xFFFA6E5A),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Flutter Research',
              style: titleHeader,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 12),
            child: Text('by Mobile Squad', style: titleSubHeader),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              itemCount: cardModelList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(cardModelList[index].color),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Image.asset(
                        cardModelList[index].path,
                        fit: BoxFit.fitWidth,
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            cardModelList[index].title,
                            style: titleCardWhite,
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3.2 : 2.8),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          )
        ],
      ),
    );
  }
}
