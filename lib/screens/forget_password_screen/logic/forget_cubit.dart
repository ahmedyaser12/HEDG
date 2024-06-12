
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_state.dart';

class ForgetScreenCubit extends Cubit<ForgetState> {
  ForgetScreenCubit() : super(ForgetInitial());
}
