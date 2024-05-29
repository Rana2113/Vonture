import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vonture_app/core/models/user_model.dart';
import 'package:vonture_app/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  static LoginCubit get(context) => BlocProvider.of(context);
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    print("LoginCubit: login called");

    var result = await loginRepo.login(email, password);
    result.fold((failure) {
      print("LoginCubit: login failed - Error: ${failure.errorMessages}");

      emit(LoginFailure(failure.errorMessages));
    }, (user) {
      print("LoginCubit: login successful - User: $user");
      emit(LoginSuccess(user));
    });
  }
}
