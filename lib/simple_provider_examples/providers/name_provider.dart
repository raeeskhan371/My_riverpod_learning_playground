import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nameProvider = Provider<String>((ref) {
  return "Raees Khan";
});
// this provider is use for StateProvider Example
final nameStateProvider = StateProvider<String>((ref) => "Raees Khan");

var userListProvider = StateProvider<List<String>>(
  (ref) => ["Raees", "Ali", "Umair"],
);
