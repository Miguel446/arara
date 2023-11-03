import 'package:form_builder_validators/form_builder_validators.dart';

abstract class Validators {
  static String? Function(String?) required() {
    return FormBuilderValidators.required(errorText: 'Campo obrigatório');
  }

  static String? Function(String?) email() {
    return FormBuilderValidators.compose([
      required(),
      FormBuilderValidators.email(errorText: 'Digite um e-mail válido'),
    ]);
  }

  static String? Function(String?) password() {
    const minLength = 8;
    return FormBuilderValidators.minLength(
      minLength,
      errorText: 'A senha deve ter no mínimo $minLength caracteres',
    );
  }
}
