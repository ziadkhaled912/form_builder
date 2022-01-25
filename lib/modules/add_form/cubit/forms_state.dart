part of 'forms_cubit.dart';

@immutable
abstract class FormsState {}

class FormsInitial extends FormsState {}

class FormChangeState extends FormsState {}

class ComponentAddedState extends FormsState {}

class ComponentRemovedState extends FormsState {}

class DropDownValueAddedState extends FormsState {}
