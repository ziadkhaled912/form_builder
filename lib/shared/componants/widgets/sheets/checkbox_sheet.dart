import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';
import 'package:untitled/shared/styles/font_styles.dart';

import '../custom_button.dart';
import '../custom_text_form_field.dart';

class CheckboxSheet extends StatefulWidget {
  const CheckboxSheet({Key? key, required this.cubit}) : super(key: key);

  final FormsCubit cubit;

  @override
  State<CheckboxSheet> createState() => _CheckboxSheetState();
}

class _CheckboxSheetState extends State<CheckboxSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController hintController = TextEditingController();

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
                      'Add Checkbox',
                      style: secondaryTextStyle(),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      type: TextInputType.text,
                      controller: titleController,
                      validation: (value) {},
                      titleText: 'Title text',
                      hint: 'enter your checkbox title',
                      backgroundColor: Colors.grey[200],
                      hasBorder: false,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Add',
                      width: MediaQuery.of(context).size.width * 0.5,
                      onPressed: () {
                        widget.cubit.addCheckboxButton(
                          title: titleController.text,
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
