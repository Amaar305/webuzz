import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/upload_buzz.dart';

part 'buzz_event.dart';
part 'buzz_state.dart';

class BuzzBloc extends Bloc<BuzzEvent, BuzzState> {
  final UploadBuzzUsecase _buzzUsecase;

  BuzzBloc({required UploadBuzzUsecase uploadBuzz})
      : _buzzUsecase = uploadBuzz,
        super(BuzzInitial()) {
    on<BuzzEvent>((event, emit) => emit(BuzzLoading()));
    on<BuzzUpload>(_onBuzzUpload);
  }
  void _onBuzzUpload(BuzzUpload event, Emitter<BuzzState> emit) async {
    final res = await _buzzUsecase.call(UploadBuzzParams(
      image: event.image,
      authorId: event.authorId,
      content: event.content,
      location: event.location,
      buzzType: event.buzzType,
      hashtags: event.hashtags,
      links: event.links,
    ));

    res.fold(
      (l) => emit(BuzzFailure(l.message)),
      (r) => emit(BuzzSuccess()),
    );
  }
}
