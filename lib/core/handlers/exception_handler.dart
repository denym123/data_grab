import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../core.dart';

class ExceptionHandler {
  final Object error;
  final StackTrace? stackTrace;
  final String _defaultErrorMessage =
      "Não foi possível realizar essa operação no momento.\nTente novamente mais tarde.";

  ExceptionHandler(this.error, this.stackTrace) {
    log('==================================================================');
    log('============================= ERROR =============================');
    log('==================================================================');
    log(error.toString());
    log(stackTrace.toString());

    _handlerMessage(error);

    GlobalException globalException = GlobalException(error, stackTrace);

    Map<String, dynamic> globalExceptionMap =
        globalException.error as Map<String, dynamic>;
    int? statusCode = globalExceptionMap['statusCode'];

    if (statusCode != null && statusCode != HttpStatus.internalServerError) {
      return;
    }

  }

  void _handlerMessage(Object e) {
    if (e.runtimeType != HttpException) {
      Messages.error(_defaultErrorMessage);
      return;
    }

    HttpException httpException = e as HttpException;

    if (httpException.statusCode == HttpStatus.internalServerError) {
      Messages.error(_defaultErrorMessage);
      return;
    }

    Messages.alert(httpException.message ?? _defaultErrorMessage);
  }
}
