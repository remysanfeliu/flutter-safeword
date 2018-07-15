import 'package:safeword/model/Password.dart';

/// This Provider handles the password repository and allows to fetch and save passwords.
class PasswordProvider {

  // Initializing the repo with a bunch of samples
  List<Password> _pwdRepository = [
      Password('facebook', 'password01'),
      Password('twitter', 'my_secure_af_password'),
      Password('linkedin', '4Nd 4n0th3R 0n3 1')
    ];

  /// Get the list of passwords
  List<Password> passwords() {
    return this._pwdRepository;
  }

  /// Add a password entity to the repository
  void addPassword(Password pwd){
    this._pwdRepository.add(pwd);
  }

  /// Helper method : calls addPassword(Password pwd)
  void addPasswordWithLabel(String lbl, String pwd) {
    this.addPassword(Password(lbl, pwd));
  }

}