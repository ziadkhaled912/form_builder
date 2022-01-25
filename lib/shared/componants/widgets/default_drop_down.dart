import 'package:flutter/material.dart';
import 'package:untitled/shared/styles/app_colors.dart';

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({
    Key? key,
    this.label,
    required this.onChanged,
    required this.validator,
    this.hint,
    required this.items,
    this.selectedValue,
    this.haveBackground = false,
    this.isLoading = false,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? selectedValue;
  final Function onChanged;
  final String? Function(String?) validator;
  final List<String> items;
  final bool haveBackground;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(haveBackground)
          Text(label!),
        Container(
          padding: haveBackground
              ? const EdgeInsets.symmetric(horizontal: 16) : null,
          decoration: haveBackground ? BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(13)) : null,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            dropdownColor: Colors.white,
            // hint: haveBackground ? Text(hint) : null,
            decoration: InputDecoration(
              labelText: haveBackground ? null : label,
              hintText: hint,
              border: haveBackground
                  ? const UnderlineInputBorder(borderSide: BorderSide.none)
                  : null,
            ),
            value: selectedValue,
            validator: validator,
            onChanged: (newValue) {
              FocusScope.of(context).requestFocus(FocusNode());
              onChanged(newValue);
            },
            icon: isLoading ? const SizedBox(
                width: 20,
                height: 20, child: CircularProgressIndicator()) : null,
            items: items.map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                ).toList(),
          ),
        ),
      ],
    );
  }
}
