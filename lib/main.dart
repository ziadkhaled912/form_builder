import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/modules/add_form/cubit/forms_cubit.dart';

import 'modules/forms_screen/app_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormsCubit()),
      ],
      child: OrientationBuilder(
        builder: (context, orientation) => ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(375, 812)
              : const Size(812, 375),
          builder: () => MaterialApp(
            title: 'Dynamic form demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const AppHomePage(),
          ),
        ),
      ),
    );
  }
}
