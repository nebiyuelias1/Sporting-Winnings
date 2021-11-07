import 'package:equatable/equatable.dart';

class ApiFailure extends Equatable {
  final String message;

  const ApiFailure(this.message);

  @override
  List<Object?> get props => [message];
}
