part of 'id_card_cubit.dart';

@immutable
sealed class IdCardState {}

final class IdCardInitial extends IdCardState {}
final class ActiveIndex extends IdCardState {}
final class IdCardImage extends IdCardState {
  final XFile image;
  IdCardImage(this.image);
}
