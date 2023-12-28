import 'package:flutter/material.dart';
import 'package:flutter_getx_shayari/model/allshayari.dart';
import 'package:flutter_getx_shayari/model/category.dart';
import 'package:flutter_getx_shayari/pages/category_page.dart';
import 'package:flutter_getx_shayari/pages/display_page.dart';
import 'package:flutter_getx_shayari/ui_helder/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../data/alldata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => ExitDialog(),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyImageSlider(),
                setContainer("Category"),
                MyGridView(),
                setContainer("Trending Shayari"),
                MyStraggel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  final List<CategoryModel> category = AllData().category;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 80,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/categorypage',
              arguments: CategoryPage(
                categoryname: category.elementAt(index).name,
                index: index,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30,
                border: Border.all(
                  color: blueColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      category.elementAt(index).image,
                      fit: BoxFit.cover,
                      height: 55,
                      width: 55,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      category.elementAt(index).name,
                      style: setTextStyle(16, blackColor, FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyImageSlider extends StatefulWidget {
  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(6),
          child: CarouselSlider(
              options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: [
                for (int i = 0; i < AllData().category.length; i++)
                  setInkWell(
                    context,
                    AllData().category.elementAt(i).image,
                    () {
                      Navigator.pushNamed(
                        context,
                        '/categorypage',
                        arguments: CategoryPage(
                          categoryname: AllData().category.elementAt(i).name,
                          index: i,
                        ),
                      );
                    },
                  )
              ]),
        ),
        Container(
          margin: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < AllData().category.length; i++)
                Container(
                  height: 6,
                  width: 6,
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color:
                        currentIndex == i ? blueColor : const Color(0xFFD2D2D2),
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}

class MyStraggel extends StatefulWidget {
  @override
  State<MyStraggel> createState() => _MyStraggelState();
}

class _MyStraggelState extends State<MyStraggel> {
  final List<AllShayari> allshayari = AllData().allshayari;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: allshayari.length,
      itemBuilder: (BuildContext context, int index) {
        return setContainerText(
          allshayari.elementAt(index).shayariList.elementAt(0),
          () {
            Navigator.pushNamed(context, '/displaypage',
                arguments: DisplayPage(
                  catename: allshayari.elementAt(index).category.toString(),
                  shayari: allshayari.elementAt(index).shayariList.elementAt(0),
                ));
            print(
              allshayari.elementAt(index).shayariList.elementAt(0),
            );
          },
        );
      },
      staggeredTileBuilder: (int index) {
        // return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
        return StaggeredTile.fit(1);
      },
      // mainAxisSpacing: 6.0,
      // crossAxisSpacing: 6.0,
    );
  }
}

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Confirm Exit',
              style: setTextStyle(20, blackColor, FontWeight.bold),
            ),
            SizedBox(height: 16),
            Divider(
              height: 1,
              color: blueColor,
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to exit the app?',
              textAlign: TextAlign.center,
              style: setTextStyle(18, blackColor, FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: blueColor,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Center(
                        child: Text('No',
                            style:
                                setTextStyle(16, whiteColor, FontWeight.bold))),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: blueColor,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Center(
                        child: Text('Yes',
                            style:
                                setTextStyle(16, whiteColor, FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
