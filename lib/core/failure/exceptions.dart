import 'package:equatable/equatable.dart';
class ServiceExceptions implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServiceExceptions({required this.errorMessageModel});
}

class LocalExceptions implements Exception{
  final String message;

  LocalExceptions({required this.message});
}


class ErrorMessageModel extends Equatable {
  final bool status;
  final String message;

  const ErrorMessageModel({required this.status,required this.message,});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json){
    return ErrorMessageModel(status: json['status'],
      message: json['message'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props =>[status,message];
}