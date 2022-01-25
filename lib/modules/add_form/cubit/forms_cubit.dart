import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/form_components/drop_down_button.dart';
import 'package:untitled/models/form_components/text_field.dart';
import 'package:untitled/models/form_model.dart';
import 'package:untitled/shared/componants/widgets/custom_text_form_field.dart';
import 'package:untitled/shared/componants/widgets/default_drop_down.dart';
import 'package:untitled/shared/services/shared_methods.dart';

part 'forms_state.dart';

class FormsCubit extends Cubit<FormsState> {
  FormsCubit() : super(FormsInitial());

  static FormsCubit get(context) => BlocProvider.of(context);

  List<Widget> formWidgets = [];
  List<FormModel> formModels = [];

  void undo() {
    if (formWidgets.isNotEmpty) {
      formWidgets.removeLast();
      formModels.removeLast();
    }
    emit(ComponentRemovedState());
  }

  /// Text Field
  ///
  void addTextField({
    required String title,
    required bool isRequired,
    String? hint,
  }) {
    addTextFieldToWidgetsList(
      isRequired: isRequired,
      title: title,
      hint: hint,
    );
    addTextFieldToModelList(
      title: title,
      isRequired: isRequired,
      hint: hint,
    );
    emit(ComponentAddedState());
  }

  void addTextFieldToWidgetsList({
    required String title,
    required bool isRequired,
    String? hint,
  }) {
    formWidgets.add(
        Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CustomTextFormField(
        type: TextInputType.text,
        validation: isRequired
            ? (value) => SharedMethods.defaultValidation(value)
            : (value) {},
        titleText: title,
        hint: hint,
        backgroundColor: Colors.grey[200],
        hasBorder: false,
      ),
    ));
  }

  void addTextFieldToModelList({
    required String title,
    required bool isRequired,
    String? hint,
  }) {
    FormTextField model = FormTextField(
      title: title,
      isRequired: isRequired,
      hint: hint,
    );
    formModels.add(model);
  }

  /// Drop down
  ///
  List<String> dropdownValues = [];

  void addDropdownValues(String value) {
    dropdownValues.add(value);
    emit(DropDownValueAddedState());
  }

  void clearDropdownValues() {
    dropdownValues.clear();
    emit(DropDownValueAddedState());
  }

  void addDropdownButton({
    required String title,
    required List<String> values,
    bool isRequired = false,
    String? hint,
  }) {
    addDropdownToWidgetsList(
      title: title,
      values: values,
      isRequired: isRequired,
      hint: hint,
    );
    emit(ComponentAddedState());
  }

  void addDropdownToWidgetsList({
    required String title,
    required List<String> values,
    bool isRequired = false,
    String? hint,
  }) {
    formWidgets.add(Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: DefaultDropDown(
        label: title,
        haveBackground: false,
        hint: hint,
        items: values,
        validator: (value) {},
        onChanged: (value) {},
      ),
    ));
  }

  void addDropdownToModelList({
    required String title,
    required List<String> values,
    bool isRequired = false,
    String? hint,
  }) {
    FormDropdownButton model = FormDropdownButton(
      title: title,
      isRequired: isRequired,
      dropdownValues: values,
      hint: hint,
    );
    formModels.add(model);
  }

  ///
  /// Check box
  void addCheckboxButton({
    required String title,
    bool isRequired = false,
    String? hint,
  }) {
    formWidgets.add(Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CheckboxListTile(
        onChanged: (value) {},
        value: false,
        title: Text(title),
      ),
    ));
    emit(ComponentAddedState());
  }

  bool requiredField = false;

  void changeRequired(bool? value) {
    requiredField = value ?? false;
    emit(FormChangeState());
  }
}
