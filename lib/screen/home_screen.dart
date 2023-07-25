import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_bci_app/components/todo_card.dart';
import 'package:monitor_bci_app/provider/todo_provider.dart';
import 'package:monitor_bci_app/provider/todo_state.dart';
import 'package:monitor_bci_app/utils/strings.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(todoNotifierProvider.notifier).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        title: const Text(titleHomeScreen),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    final state = ref.watch(todoNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSortAndFilter(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFEAEEF2),
            child: Consumer(
              builder: (context, ref, child) {
                if (state is TodoLoaded) {
                  if (state.todos.isEmpty) {
                    return const Center(child: Text('No Todo'));
                  } else {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return TodoCard(todo: state.todos[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.todos.length,
                    );
                  }
                } else if (state is TodoLoadedWithError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              // child: ListView.separated(
              //     itemBuilder: (context, index) {
              //       return const TodoCard();
              //     },
              //     separatorBuilder: (context, index) =>
              //         const SizedBox(height: 10),
              //     itemCount: 20),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSortAndFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_upward,
              color: Colors.black,
            ),
            label: const Text(
              'Terbaru',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              side: const BorderSide(color: Color.fromARGB(255, 37, 33, 33)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
            ),
            label: const Text(
              'fILTER',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
