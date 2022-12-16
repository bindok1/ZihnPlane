import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubitCubit extends Cubit<List<String>> {
  SeatCubitCubit() : super([]);

  void selectseat(String id) {
    print('prev state :$state');
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(state);
    print(state);
    //untuk menampilkan perubahan pada saat klik
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    print('index: $index');
    if (index == -1) {
      return false;
    } else
      return true;
  }
}
