import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.name,
    required this.duration,
  });

  final String name;
  final int duration;

  /// Creates a copy of the current TaskModel with property changes
  TaskModel copyWith({
    String? name,
    int? duration,
  }) {
    return TaskModel(
      name: name ?? this.name,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [name, duration];
}
