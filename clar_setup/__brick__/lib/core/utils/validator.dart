final class Validator<T> {
  final T _value;
  final List<ValidationRule<T>> _rules;
  final List<String> errors;

  Validator(this._value, this._rules) : errors = [];

  void add(ValidationRule<T> rule) => _rules.add(rule);

  bool check() {
    bool isValid = true;

    for (final rule in _rules) {
      final isRuleValid = rule.validate(_value);
      if (!isRuleValid) {
        errors.add(rule.message);
      }

      isValid = isValid && isRuleValid;
    }

    return isValid;
  }
}

abstract interface class ValidationRule<T> {
  final String message;

  const ValidationRule({required this.message});

  bool validate(T value);
}

class MinMaxRule extends ValidationRule<int> {
  final num comparision;

  const MinMaxRule({
    required this.comparision,
    required super.message,
  });

  @override
  bool validate(int value) {
    return comparision < value;
  }
}

class PatternRule extends ValidationRule<String> {
  final String pattern;

  const PatternRule({
    required this.pattern,
    required super.message,
  });

  @override
  bool validate(String value) {
    return RegExp(pattern).hasMatch(value);
  }
}

class RequiredRule extends ValidationRule<String> {
  const RequiredRule({required super.message});

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }
}

class EmailRule extends PatternRule {
  const EmailRule({
    required super.message,
  }) : super(pattern: r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$');

  @override
  bool validate(String value) {
    return RegExp(pattern).hasMatch(value);
  }
}

class PhoneNumberRule extends PatternRule {
  const PhoneNumberRule({
    required super.message,
  }) : super(pattern: r'^(\+?233|0)(([25][034567])|28|59)\d{7}$');

  @override
  bool validate(String value) {
    return RegExp(pattern).hasMatch(value);
  }
}
