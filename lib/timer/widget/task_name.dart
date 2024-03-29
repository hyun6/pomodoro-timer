import 'package:flutter/widgets.dart';

class TaskNameWidget extends StatelessWidget {
  const TaskNameWidget({
    super.key,
    required this.taskName,
  });

  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'CURRENT TASK',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(taskName),
      ],
    );
  }
}
