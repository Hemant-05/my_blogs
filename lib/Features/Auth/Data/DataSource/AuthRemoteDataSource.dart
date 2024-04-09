import 'package:my_blogs/Core/Error/Exception.dart';
import 'package:my_blogs/Features/Auth/Data/Models/UserModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentSession;

  Future<UserModel> singupWithEmailPass({
    required String name,
    required String email,
    required String pass,
  });

  Future<UserModel> loginWithEmailPass({
    required String email,
    required String pass,
  });

  Future<UserModel?> getCurrentUserDetails();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> loginWithEmailPass({
    required String email,
    required String pass,
  }) async {
    try {
      print(
          '=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=- \n work is on.... \n email = $email \n pass = $pass');
      final response = await client.auth.signInWithPassword(
        password: pass,
        email: email,
      );
      print('=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=- \n work is don....');
      if (response.user == null) {
        throw ServerException(message: 'User is null !!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      print('This is an error ---------------------\n $e');
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> singupWithEmailPass({
    required String name,
    required String email,
    required String pass,
  }) async {
    try {
      final response = await client.auth.signUp(
        password: pass,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw ServerException(message: 'User is null !!');
      }
      return UserModel.fromJson(response.user!.toJson()).copyWith(
        email: currentSession!.user.email,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Session? get currentSession => client.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserDetails() async {
    try {
      if (currentSession != null) {
        final userData = await client
            .from('profiles')
            .select()
            .eq('id', currentSession!.user.id);
        return UserModel.fromJson(userData.first).copyWith(
          email: currentSession!.user.email,
        );
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
