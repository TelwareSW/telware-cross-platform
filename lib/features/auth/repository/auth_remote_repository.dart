import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:telware_cross_platform/core/models/user_model.dart';
import 'package:telware_cross_platform/core/constants/server_constants.dart';
import 'package:telware_cross_platform/core/models/app_error.dart';
import 'package:flutter/foundation.dart';
import 'package:telware_cross_platform/features/auth/models/auth_response_model.dart';

part 'auth_remote_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository(ref: ref, dio: Dio(BASE_OPTIONS));
}

class AuthRemoteRepository {
  final Dio _dio;

  AuthRemoteRepository({
    required ProviderRef<AuthRemoteRepository> ref,
    required Dio dio,
  }) : _dio = dio;

  Future<AppError?> signUp({
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String reCaptchaResponse,
  }) async {
    try {
      final response = await _dio.post('/auth/sign-up', data: {
        'email': email,
        'phone': phone,
        'password': password,
        'confirmPassword': confirmPassword,
        'reCaptchaResponse': reCaptchaResponse,
      });

      if (response.statusCode! >= 400) {
        final String message = response.data?['message'] ?? 'Unexpected Error';
        return AppError(message);
      }
    } on DioException catch (dioException) {
      return handleDioException(dioException);
    } catch (error) {
      debugPrint('Sign Up error:\n${error.toString()}');
      return AppError("Couldn't sign up now. Please, try again later.");
    }
    return null;
  }

  // todo: make sure of what does get from the back-end
  Future<Either<AppError, AuthResponseModel>> verifyEmail(
      {required String email, required String code}) async {
    try {
      final response = await _dio.post('/auth/verify',
          data: {'email': email, 'verificationCode': code});

      if (response.statusCode! >= 400) {
        final String message = response.data?['message'] ?? 'Unexpected Error';
        return Left(AppError(message));
      }
      final AuthResponseModel verificationResponse = AuthResponseModel.fromMap(
          (response.data['data']) as Map<String, dynamic>);

      return Right(verificationResponse);
    } on DioException catch (dioException) {
      return Left(handleDioException(dioException));
    } catch (error) {
      debugPrint('Verify Email error:\n${error.toString()}');
      return Left(
          AppError("Couldn't verify email now. Please, try again later."));
    }
  }

  Future<AppError?> sendConfirmationCode({required String email}) async {
    try {
      final response =
          await _dio.post('/auth/send-confirmation', data: {'email': email});

      if (response.statusCode! >= 400) {
        final String message = response.data?['message'] ?? 'Unexpected Error';
        return AppError(message);
      }
    } on DioException catch (dioException) {
      return handleDioException(dioException);
    } catch (error) {
      debugPrint('Resend Confirmation Code error:\n${error.toString()}');
      return AppError("Couldn't request resend now. Please, try again later.");
    }
    return null;
  }

  Future<Either<AppError, UserModel>> getMe(String sessionId) async {
    try {
      final response = await _dio.get(
        '/users/me',
        options: Options(
          headers: {'X-Session-Token': sessionId},
        ),
      );

      if (response.statusCode! >= 300 || response.statusCode! < 200) {
        final message = response.data['message'];
        return Left(AppError(message));
      }

      debugPrint('=========================================');
      debugPrint('Get me was successful');
      final user = UserModel.fromMap(response.data['data']['user']);
      return Right(user);
    } on DioException catch (dioException) {
      return Left(handleDioException(dioException));
    } catch (error) {
      debugPrint('Get user error:\n${error.toString()}');
      return Left(
          AppError('Failed to connect, check your internet connection.'));
    }
  }

  Future<Either<AppError, AuthResponseModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode! >= 300 || response.statusCode! < 200) {
        final String message = response.data?['message'] ?? 'Unexpected Error';
        if (response.statusCode == 403) {
          return Left(AppError(message, code: 403));
        }
        return Left(AppError(message));
      }

      // todo(ahmed): check response body from the back side
      final AuthResponseModel logInResponse = AuthResponseModel.fromMap(
          (response.data['data']) as Map<String, dynamic>);

      return Right(logInResponse);
    } on DioException catch (dioException) {
      return Left(handleDioException(dioException));
    } catch (e) {
      debugPrint('Log in error:\n${e.toString()}');
      return Left(AppError('Couldn\'t log in now. Please, try again later.'));
    }
  }

  Future<AppError?> logOut(
      {required String token, required String route}) async {
    try {
      final response = await _dio.post(
        route,
        options: Options(
          headers: {'X-Session-Token': token},
        ),
      );

      if (response.statusCode! >= 300 || response.statusCode! < 200) {
        final message = response.data['message'];
        return AppError(message);
      }
    } on DioException catch (dioException) {
      return handleDioException(dioException);
    } catch (e) {
      debugPrint('Log out error:\n${e.toString()}');
      return AppError('Couldn\'t perform action now. Please, try again later.');
    }
    return null;
  }

  Future<AppError?> forgotPassword(String email) async {
    try {
      debugPrint('email: $email');
      final response =
          await _dio.post('/auth/password/forget', data: {'email': email});

      debugPrint('Forgot Password response: ${response.data ?? 'No data'}');
      if (response.statusCode! >= 300 || response.statusCode! < 200) {
        final String message = response.data?['message'] ?? 'Unexpected Error';
        return AppError(message);
      }
    } on DioException catch (dioException) {
      return handleDioException(dioException);
    } catch (e) {
      debugPrint('Log in error:\n${e.toString()}');
      return AppError('Couldn\'t log in now. Please, try again later.');
    }
    return null;
  }

  // todo(marwan): ask for verification code resend

  // todo(marwan): verify user. send the verification code to the back-end to check it

  AppError handleDioException(DioException dioException) {
    String? message;
    if (dioException.response != null) {
      message = (dioException.response!.data as Map<String, dynamic>)['message'];
      debugPrint(message);
    } else if (dioException.type == DioExceptionType.connectionTimeout ||
        dioException.type == DioExceptionType.connectionError ||
        dioException.type == DioExceptionType.unknown) {
      message = 'Failed to connect, check your internet connection.';
      debugPrint('Server is not reachable: ${dioException.message}');
    } else {
      message = 'Something wrong happened. Please, try again later.';
      debugPrint(message);
      debugPrint('here Unhandled Dio Exception');
    }
    return AppError(message ?? 'Unexpected server error.');
  }
}
