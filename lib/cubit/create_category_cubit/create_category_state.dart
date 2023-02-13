part of "create_category_cubit.dart";

@immutable
abstract class CreateCategoryState {}

class CreateCategoryInitial extends CreateCategoryState {}

class CreateCategoryLoading extends CreateCategoryState {}

class CreateCategorySuccess extends CreateCategoryState {}

class CreateCategoryFailure extends CreateCategoryState {
  final String errorMessage;
  CreateCategoryFailure(this.errorMessage);
}
