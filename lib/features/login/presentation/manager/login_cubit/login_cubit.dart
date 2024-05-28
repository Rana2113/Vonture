import 'package:bloc/bloc.dart';
import 'package:vonture_app/core/models/user_model.dart';
import 'package:vonture_app/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginRepo.login(email, password);
    result.fold((failure) {
      emit(LoginFailure(failure.errorMessages));
    }, (user) {
      emit(LodinSuccess(user));
    });
  }
}
