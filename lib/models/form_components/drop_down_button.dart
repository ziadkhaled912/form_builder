import 'package:untitled/models/enums/enums.dart';
import 'package:untitled/models/form_model.dart';

class FormDropdownButton extends FormModel{
  late List<String> dropdownValues = [];
  String? hint;

  FormDropdownButton({
    required String title,
    required bool isRequired,
    required this.hint,
    required this.dropdownValues,
  }) : super(
    formComponentType: FormComponentType.dropdown,
    title: title,
    isRequired: isRequired,
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['hint'] = hint;
    data['dropdownValues'] = dropdownValues;
    return data;
  }
}