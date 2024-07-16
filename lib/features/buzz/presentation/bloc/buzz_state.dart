part of 'buzz_bloc.dart';

@immutable
sealed class BuzzState {}

final class BuzzInitial extends BuzzState {}

final class BuzzLoading extends BuzzState {}

final class BuzzFailure extends BuzzState {
  final String error;

  BuzzFailure(this.error);
}

final class BuzzSuccess extends BuzzState{}
