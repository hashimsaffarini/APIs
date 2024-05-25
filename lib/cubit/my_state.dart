import 'package:api_project/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_state.freezed.dart';

@freezed
abstract class MyState<T> with _$MyState<T> {
  const factory MyState.initial() = Initial;
  const factory MyState.loading() = Loading<T>;
  const factory MyState.success(T data) = Success<T>;
  const factory MyState.error(ErrorHandler error) = Error<T>;
  // const factory MyState.successList(List<T> data) = SuccessList<T>;
}
