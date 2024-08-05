import 'package:bloc/bloc.dart';

class AnimationViewCubit extends Cubit<int> {
  AnimationViewCubit() : super(-1);

  void updateScreenIndex({required int nextScreen}) {
    emit(nextScreen);
  }
}
