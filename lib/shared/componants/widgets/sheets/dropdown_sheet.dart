import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';
import 'package:untitled/shared/styles/app_colors.dart';
import 'package:untitled/shared/styles/font_styles.dart';

import '../custom_button.dart';
import '../custom_text_form_field.dart';

class DropdownSheet extends StatefulWidget {
  const DropdownSheet({Key? key, required this.cubit}) : super(key: key);

  final FormsCubit cubit;

  @override
  State<DropdownSheet> createState() => _DropdownSheetState();
}

class _DropdownSheetState extends State<DropdownSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<FormsCubit, FormsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Dropdown button',
                      style: secondaryTextStyle(),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      type: TextInputType.text,
                      controller: titleController,
                      validation: (value) {},
                      titleText: 'Title text',
                      hint: 'enter your dropdown title',
                      backgroundColor: Colors.grey[200],
                      hasBorder: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      type: TextInputType.text,
                      controller: valueController,
                      validation: (value) {},
                      titleText: 'Dropdown values',
                      hint: 'enter your dropdown values',
                      backgroundColor: Colors.grey[200],
                      hasBorder: false,
                      suffixIcon: Icons.add,
                      suffixPressed: () {
                        widget.cubit.addDropdownValues(valueController.text);
                        valueController.clear();
                      },
                    ),
                    if (widget.cubit.dropdownValues.isNotEmpty)
                      ListTile(
                        title: Text(
                          'values: ${widget.cubit.dropdownValues}',
                          style: thirdTextStyle(),
                        ),
                        trailing: TextButton(
                          child: const Text('clear'),
                          onPressed: () {
                            widget.cubit.clearDropdownValues();
                          },
                        ),
                      ),
                    CheckboxListTile(
                      value: widget.cubit.requiredField,
                      title: Text(
                        'Text field required',
                        style: thirdTextStyle()
                            .copyWith(color: AppColors.errorColor),
                      ),
                      onChanged: (value) {
                        widget.cubit.changeRequired(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Add',
                      width: MediaQuery.of(context).size.width * 0.5,
                      onPressed: () {
                        widget.cubit.addDropdownButton(
                          title: titleController.text,
                          values: widget.cubit.dropdownValues,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
