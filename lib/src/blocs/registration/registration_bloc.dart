import 'package:belajar_edspert/src/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<SendRegisterData>((event, emit) async {
      //LOADING
      emit(RegistrationIsLoading());
      //KIRIM DATA
      if (event.name.isEmpty) {
        emit(RegistrationIsFailed('Nama tidak boleh kosong'));
      }
      final result =
          await UserService.regis(event.name, event.email, event.password);

      emit(result.fold((l) => RegistrationIsFailed('Gagal Register'),
          (r) => RegistrationIsSuccess("Selamat bergabung, ${r.name}")));
      //SUCCESS ATAU FAILED
    });
  }
}
