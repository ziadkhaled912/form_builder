import 'package:flutter/material.dart';
import 'package:untitled/shared/services/services_methods.dart';

class FormBuildItem extends StatelessWidget {
  const FormBuildItem({
    Key? key,
    required this.name,
    required this.date,
  }) : super(key: key);

  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date),
        onTap: () {},
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}
