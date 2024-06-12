import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'face_id_state.dart';

class FaceIdCubit extends Cubit<FaceIdState> {
  FaceIdCubit() : super(FaceIdInitial());
}
