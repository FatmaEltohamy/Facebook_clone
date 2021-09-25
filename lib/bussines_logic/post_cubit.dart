import 'package:bloc/bloc.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {

  PostCubit() : super(PostState(isLoading: false));

  Future delayForTwoSeconds() async {
    emit(PostState(isLoading: false));
    await Future.delayed(Duration(seconds: 5),(){
      emit(PostState(isLoading: true));
    });
  }
}
