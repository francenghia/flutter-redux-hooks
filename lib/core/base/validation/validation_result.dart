class ValidationResult {
  bool isValid;
  String? errorMessage;

  ValidationResult({required this.isValid, required this.errorMessage});

  static ValidationResult ok() {
    return ValidationResult(isValid: true, errorMessage: null);
  }

  static ValidationResult error(String errorMsg) {
    return ValidationResult(isValid: false, errorMessage: errorMsg);
  }
}
