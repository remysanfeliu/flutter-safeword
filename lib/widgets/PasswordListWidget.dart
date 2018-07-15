import 'package:flutter/material.dart';
import 'package:safeword/widgets/PasswordCellWidget.dart';
import 'package:safeword/di/Injector.dart';
import 'package:safeword/services/PasswordProvider.service.dart';

class PasswordListWidget extends StatelessWidget {

  final PasswordProvider _pwdProvider = Injector().getPasswordProvider();
  
  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemBuilder:(BuildContext context, int index) {
        return _pwdProvider.passwords().length > index ? new PasswordCellWidget(_pwdProvider.passwords()[index]) : null;
      });
  }

}