import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updatePage(int index) {
    emit(index);
  }
}

class ShowBottomNavCubit extends Cubit<bool> {
  ShowBottomNavCubit() : super(false);

  void show() {
    emit(!state);
  }
}
