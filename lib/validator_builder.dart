typedef ValidatorFunction = String? Function(String?);

class ValidationBuilder {
  final List<ValidatorFunction> validators = [];

  static final RegExp _isNumeric = RegExp(r'^[0-9]+$');

  ValidationBuilder isEmpty(
      {String validationText = 'Value can not be empty'}) {
    validators
        .add((value) => value == null || value.isEmpty ? validationText : null);
    return this;
  }

  ValidationBuilder isNumber(
      {String validationText = 'Value is not a number'}) {
    validators
        .add((value) => _isNumeric.hasMatch(value!) ? null : validationText);
    return this;
  }

  String? checkValidation(String? value) {
    for (var validator in validators) {
      if (value == null) return null;

      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  ValidatorFunction build() => checkValidation;
}
