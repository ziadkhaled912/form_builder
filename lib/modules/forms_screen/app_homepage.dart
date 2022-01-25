import 'package:flutter/material.dart';
import 'package:untitled/modules/add_form/add_form_screen.dart';
import 'package:untitled/modules/forms_screen/form_build_item.dart';
import 'package:untitled/shared/services/services_methods.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Forms"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ServicesMethods.navigateTo(context, const AddFormScreen());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 3,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => FormBuildItem(
          name: 'Form ${index + 1}',
          date: '24-1-2022',
        ),
      ),
    );
  }
}
