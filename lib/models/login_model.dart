class LoginModel {
  String username;
  String password;

  LoginModel({required this.username, required this.password});

  // Credenciales hardcodeadas por defecto
  static const String _adminUser = 'tlahtoa';
  static const String _adminPass = 'colibri123456';

  // Método para validar las credenciales
  bool validate() {
    return username.trim() == _adminUser && password.trim() == _adminPass;
  }
}
