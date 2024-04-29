import 'package:bloc/bloc.dart';

part 'addcourse_state.dart';

class AddcourseCubit extends Cubit<AddcourseState> {
  AddcourseCubit() : super(AddcourseInitial());

  void addCourse() {
    emit(Counter());
  }
}
