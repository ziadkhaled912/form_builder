import 'package:flutter/material.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';
import 'package:untitled/shared/componants/widgets/sheets/checkbox_sheet.dart';
import 'package:untitled/shared/componants/widgets/sheets/dropdown_sheet.dart';
import 'package:untitled/shared/componants/widgets/sheets/text_field_sheet.dart';

class Components {
  static void showTextFieldSheet(BuildContext context, FormsCubit cubit) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        builder: (context) => TextFieldSheet(
          cubit: cubit,
        ),
      );

  static void showDropdownSheet(BuildContext context, FormsCubit cubit) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        builder: (context) => DropdownSheet(
          cubit: cubit,
        ),
      );

  static void showCheckboxSheet(BuildContext context, FormsCubit cubit) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        builder: (context) => CheckboxSheet(
          cubit: cubit,
        ),
      );
}
