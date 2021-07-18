import 'package:equatable/equatable.dart';

abstract class ProgressBlocState extends Equatable {}

class ProgressState extends ProgressBlocState {
  final bool progressStatus;

  ProgressState({required this.progressStatus});

  @override
  List<Object> get props => [progressStatus];
}
