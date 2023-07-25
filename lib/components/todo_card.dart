import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:monitor_bci_app/components/icon_todo_status.dart';
import 'package:monitor_bci_app/model/todo.dart';
import 'package:monitor_bci_app/utils/images.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('status : ${todo.status}');
    return InkWell(
      onTap: () => context.goNamed('todo', extra: todo),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTodoIcon(todo.type),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.id,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${todo.site.siteId} - ${todo.site.name}'),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icCalendar,
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 10),
                  Text(todo.createdDate)
                ],
              ),
              IconTodoStatus(todoStatus: todo.status),
            ],
          ),
        ]),
      ),
    );
  }

  SvgPicture _buildTodoIcon(String todoType) {
    if (todoType.toLowerCase() == 'regular') {
      return SvgPicture.asset(
        icTodoRegular,
        width: 32,
        height: 32,
      );
    } else {
      return SvgPicture.asset(
        icTodoPreventive,
        width: 32,
        height: 32,
      );
    }
  }
}
