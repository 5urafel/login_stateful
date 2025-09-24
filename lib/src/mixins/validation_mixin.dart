mixin ValidationMixin {
  String? validateEmail(value) {
    if (value == null || !value.contains('@')) {
      return 'invalid email address';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.length < 4) {
      return 'password must at least be 4';
    }
    return null;
  }
}
