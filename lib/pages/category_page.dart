import 'package:flutter/material.dart';
import 'package:flutter_getx_shayari/data/alldata.dart';
import 'package:flutter_getx_shayari/model/allshayari.dart';
import 'package:flutter_getx_shayari/ui_helder/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'display_page.dart';

class CategoryPage extends StatefulWidget {
  String categoryname;
  int index;

  CategoryPage({Key? key, required this.categoryname, required this.index})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<AllShayari> allshayari = AllData().allshayari;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(widget.categoryname),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: allshayari.elementAt(widget.index).shayariList.length,
            itemBuilder: (BuildContext context, int index) {
              return setContainerText(
                allshayari
                    .elementAt(widget.index)
                    .shayariList
                    .elementAt(index)
                    .toString(),
                () {
                  Navigator.pushNamed(context, '/displaypage',
                      arguments: DisplayPage(
                        catename: widget.categoryname,
                        shayari: allshayari
                            .elementAt(widget.index)
                            .shayariList
                            .elementAt(index)
                            .toString(),
                      ));
                  print(
                    allshayari
                        .elementAt(widget.index)
                        .shayariList
                        .elementAt(index)
                        .toString(),
                  );
                },
              );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(1);
              // return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
            },
            // mainAxisSpacing: 6.0,
            // crossAxisSpacing: 6.0,
          ),
        ),
      ),
    );
  }
}
