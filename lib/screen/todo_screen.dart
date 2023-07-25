import 'package:flutter/material.dart';

import 'package:monitor_bci_app/model/todo.dart';

class TodoScreen extends StatelessWidget {
  final Todo todo;
  const TodoScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.id),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Site Id : ${todo.site.siteId}'),
              Text('Name : ${todo.site.name}'),
              Text('Address : ${todo.site.address ?? ''}'),
              Text('Height : ${todo.site.towerHeight.toString()}'),
              Text('Type : ${todo.site.towerType}'),
              Text('Fabricator : ${todo.site.fabricator}'),
              Text('Region : ${todo.site.region}'),
              Text('Kabupaten : ${todo.site.kabupaten}'),
              Text('Province : ${todo.site.province}'),
              Text('Created Date : ${todo.createdDate}'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildAllRequirement(),
      ],
    );
  }

  Widget _buildAllRequirement() {
    return Expanded(
        child: Container(
      color: const Color(0xFFEAEEF2),
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('A'),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 20),
    ));
  }
}
