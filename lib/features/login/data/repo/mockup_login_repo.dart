import 'package:product_list_app/features/login/domain/repo/login_repo.dart';

class MockupLoginRepo  implements LoginRepo {
  @override
  Future<bool> login({required String email, required String password}) async{
    await Future.delayed(Duration(seconds: 2));
    return email.isNotEmpty && password.isNotEmpty;
  }
}