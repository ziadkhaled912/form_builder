import 'package:untitled/models/enums/enums.dart';
import 'package:untitled/models/form_model.dart';

class FormCheckbox extends FormModel {
  FormCheckbox({
    required String title,
    required bool isRequired,
  }) : super(
    formComponentType: FormComponentType.checkBox,
    title: title,
    isRequired: isRequired,
  );
}