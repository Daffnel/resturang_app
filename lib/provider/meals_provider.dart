import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resturang_app/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
