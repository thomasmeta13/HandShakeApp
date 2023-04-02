class AuthService {
  Future<User?> signIn(String email, String password) async {
  // Perform sign-in using email and password.
  // If sign-in is successful, return a User object.
  // If sign-in fails, return null.
  
  return Future.value(null);
}

}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
