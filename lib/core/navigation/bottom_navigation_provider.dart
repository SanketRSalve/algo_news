import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_provider.g.dart';

@riverpod
class BottomNavigationController extends _$BottomNavigationController {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
