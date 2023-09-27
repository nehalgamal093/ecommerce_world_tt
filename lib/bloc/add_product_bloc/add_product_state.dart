part of 'add_product_bloc.dart';

enum AddProductStatus { initial, loading, loaded, error }

class AddProductState extends Equatable {
  final AddProductStatus loadingStatus;

  const AddProductState({
    required this.loadingStatus,
  });

  factory AddProductState.initial() {
    return const AddProductState(loadingStatus: AddProductStatus.initial);
  }

  AddProductState copyWith({
    AddProductStatus? loadingStatus,
  }) {
    return AddProductState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  List<Object?> get props => [loadingStatus];
}
