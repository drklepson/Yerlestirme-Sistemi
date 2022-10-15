part 'items/email_validator.g.dart';
part 'items/name_validator.g.dart';
part 'items/password_validator.g.dart';
part 'items/date_validator.g.dart';
part 'items/apuani_validator.g.dart';
part 'items/rank_validator.g.dart';
part 'items/birim_kodu_validator.g.dart';

class CustomValidator {
  factory CustomValidator() => _validator;

  CustomValidator._init();
  static final CustomValidator _validator = CustomValidator._init();

  static String? _regExpReturn({
    required String pattern,
    required String? value,
    required String trWords,
  }) {
    final regex = RegExp(pattern);
    if (value != null && value.isNotEmpty) {
      if (regex.hasMatch(value)) {
        return null;
      } else {
        return trWords;
      }
    } else {
      return trWords;
    }
  }

  static String? name(String? value) => _$name(value);

  static String? email(String? value) => _$email(value);

  static String? password(String? value) => _$password(value);

  static String? date(String? value) => _$date(value);

  static String? aPuani(String? value) => _$aPuaniValid(value);

  static String? siralama(String? value) => _$siralamaValid(value);

  static String? birimKodu(String? value) => _$birimKodu(value);
}
