import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';
import 'package:untitled/shared/componants/widgets/custom_button.dart';
import 'package:untitled/shared/componants/widgets/custom_text_form_field.dart';
import 'package:untitled/shared/styles/app_colors.dart';
import 'package:untitled/shared/styles/font_styles.dart';

class TextFieldSheet extends StatefulWidget {
  const TextFieldSheet({Key? key, required this.cubit}) : super(key: key);

  final FormsCubit cubit;

  @override
  State<TextFieldSheet> createState() => _TextFieldSheetState();
}

class _TextFieldSheetState extends State<TextFieldSheet> {
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
                      'Add Text Field',
                      style: secondaryTextStyle(),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      type: TextInputType.text,
                      controller: titleController,
                      validation: (value) {},
                      titleText: 'Title text',
                      hint: 'enter your text field title',
                      backgroundColor: Colors.grey[200],
                      hasBorder: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      type: TextInputType.text,
                      controller: hintController,
                      validation: (value) {},
                      titleText: 'Hint text',
                      hint: 'enter your text field hint',
                      backgroundColor: Colors.grey[200],
                      hasBorder: false,
                    ),
                    const SizedBox(height: 20),
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
                        widget.cubit.addTextField(
                          title: titleController.text,
                          hint: hintController.text,
                          isRequired: widget.cubit.requiredField,
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
