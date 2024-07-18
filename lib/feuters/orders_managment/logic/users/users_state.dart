import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part  'users_state.freezed.dart';

@freezed
abstract class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.getAllUsers(List<User> users)=_getAllUsers;
}
