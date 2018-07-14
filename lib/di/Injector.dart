import '../services/PasswordProvider.service.dart';

/// Class used a very, very basic dedency injector
class Injector {
  /// Boilerplate to declare a Singleton
  static final Injector _singleton = new Injector._internal();
  factory Injector() {
    return _singleton;
  }
  Injector._internal();

  /// Defining the injectable services
  static final PasswordProvider _pwdProvider = new PasswordProvider();
  PasswordProvider getPasswordProvider(){
    return _pwdProvider;
  }
  
}