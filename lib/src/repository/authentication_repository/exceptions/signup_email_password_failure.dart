class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure(
      [this.message = "An unknown error occurred."]);

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak password':
        return const SignupEmailPasswordFailure(
            'Please enter a stronger password.');
      case 'Invalid email':
        return const SignupEmailPasswordFailure('Email is not valid.');
      case 'Operation not allowed':
        return const SignupEmailPasswordFailure('Opertaion is not allowed.');
      case 'user disabled':
        return const SignupEmailPasswordFailure(
            'This user is disabled. Please contact support');
      default:
        return const SignupEmailPasswordFailure();
    }
  }
}
