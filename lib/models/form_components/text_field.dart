import 'package:untitled/models/enums/enums.dart';
import 'package:untitled/models/form_model.dart';

class FormTextField extends FormModel {
  String? hint;
  FormTextField({
    required String title,
    required bool isRequired,
    required this.hint,
  }) : super(
          formComponentType: FormComponentType.textField,
          title: title,
          isRequired: isRequired,
        );
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['hint'] = hint;
    print(data);
    return data;
  }
}
