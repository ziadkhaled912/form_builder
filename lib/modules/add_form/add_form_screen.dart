import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';
import 'package:untitled/shared/componants/componants.dart';

class AddFormScreen extends StatelessWidget {
  const AddFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormsCubit(),
      child: BlocConsumer<FormsCubit, FormsState>(
        listener: (context, state) {},
        builder: (context, state) {
          FormsCubit cubit = FormsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Create New Form"),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: cubit.formWidgets,
                ),
              ),
            ),
            floatingActionButton: cubit.formWidgets.isNotEmpty ? FloatingActionButton(
              child: const Icon(Icons.undo),
              onPressed: () => cubit.undo(),
            ) : null,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.black54,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Components.showTextFieldSheet(context, cubit);
                    break;
                  case 1:
                    Components.showDropdownSheet(context, cubit);
                    break;
                  case 2:
                    Components.showCheckboxSheet(context, cubit);
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.text_fields),
                  label: 'Text Field',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Drop Down',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box),
                  label: 'Check Box',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
