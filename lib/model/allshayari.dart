import 'package:flutter/foundation.dart';
import 'package:flutter_getx_shayari/model/category.dart';

class AllShayari {
  final String category;
  final List<String> shayariList;

  AllShayari({
    required this.category,
    required this.shayariList,
  });
}
