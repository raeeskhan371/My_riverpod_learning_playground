import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProvider = Provider<List<String>>((ref) {
  return ["Raees", "Ali", "Hammad"];
});
