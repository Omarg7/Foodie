// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../../../../core/failure/failure.dart';
// import '../../../../core/use_case/base_use_case.dart';
// import '../entity/auth.dart';
// import '../entity/user.dart';
// import '../repository/base_auth_repository.dart';
//
// class RegisterUseCase extends BaseUseCase<Auth, RegisterParameter> {
//   final IAuthRepository baseAuthRepository;
//
//   RegisterUseCase(this.baseAuthRepository);
//   @override
//   Future<Either<Failure, Auth>> call(RegisterParameter parameters) async {
//     return await baseAuthRepository.completeRegister(parameters);
//   }
// }
//
// class RegisterParameter extends Equatable {
//   final String phone;
//   final String email;
//   final String city;
//   final String region;
//   final String fullName;
//   final String shopType;
//   final String uid;
//   final String long;
//   final String lat;
//   final String location;
//   final String shopName;
//   final String password;
//   final String logoUrl;
//   const RegisterParameter( {required this.logoUrl,
//     required this.password,
//     required this.email,
//     required this.phone,
//     required this.city,
//     required this.region,
//     required this.fullName,
//     required this.shopType,
//     required this.uid,
//     required this.long,
//     required this.lat,
//     required this.location,
//     required this.shopName,
//   });
//
//   @override
//   List<Object?> get props => [
//         phone,
//       ];
// }
