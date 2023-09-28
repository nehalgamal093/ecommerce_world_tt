part of 'sub_categories_list_bloc.dart';

sealed class SubCategoriesListEvent extends Equatable {
  const SubCategoriesListEvent();

  @override
  List<Object> get props => [];
}

class SubCategoriesEvent extends SubCategoriesListEvent {}
