import 'dart:async';

class Validator {
  static String emailValidationRule =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static String passwordValidationRule = '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,10})';

  final performEmailValidation = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp regExp = new RegExp(emailValidationRule);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Please enter a valid email address');
    }
  });

  final performPasswordValidation = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    RegExp regExp = new RegExp(passwordValidationRule);
    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError('''
      Password must contain:
       - One digit
       - One lowercase character
       - One uppercase character
       - One special symbol "@#%"
       and be between 6 and 10 characters long
      ''');
    }
  });
}
