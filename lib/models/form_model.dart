import 'package:untitled/models/enums/enums.dart';

class FormModel {
  late FormComponentType formComponentType;
  late String title;
  late bool isRequired;
  FormModel({
    required this.formComponentType,
    required this.title,
    required this.isRequired,
});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['formComponentType'] = formComponentType.toString();
    data['title'] = title;
    data['isRequired'] = isRequired;
    return data;
  }
}