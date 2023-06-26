import 'package:bloc/bloc.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeIndex> {
  WelcomeCubit() : super(WelcomeIndex(currentPage: 0));

  void changeScreenIndex() =>
      emit(WelcomeIndex(currentPage: state.currentPage));
}
