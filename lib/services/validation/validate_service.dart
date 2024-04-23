class ValidateService {
  String? isEmptyField(String value) {
    if (value.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? validateDropDown(String value) {
    if (value == 'No option') {
      return 'Required';
    } else {
      return null;
    }
  }

  String? isEmptyFieldWithLength(String value, String feild) {
    if (value.isEmpty) {
      return 'Required';
    } else if (value.length < 10) {
      return '$feild must be at least 10 characters long';
    } else if (value.length > 500) {
      return "$feild must be less than 500 characters long";
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    String? isEmpty = isEmptyField(value);

    if (isEmpty != null) {
      return isEmpty;
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 8) {
      return "Must be more than 8 charactors";
    }

    if (!password.contains(RegExp(r"[a-z]"))) {
      return "at least one lowercase character";
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return "at least one upper case character";
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      return "at least one Digit";
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password.length < 8) {
      return "Must be more than 8 charactors";
    }

    if (!password.contains(RegExp(r"[a-z]"))) {
      return "at least one lowercase character";
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return "at least one upper case character";
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      return "at least one Digit";
    }
    if (password != confirmPassword) {
      return 'Password does not match';
    }
    return null;
  }
}
