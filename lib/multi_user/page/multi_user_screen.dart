import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_bloc.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_event.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_state.dart';

class MultiUserScreen extends StatelessWidget {
  const MultiUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final multiUserBloc = context.read<MultiUserBloc>();

    // Fetch data on first page load
    multiUserBloc.add(MultiUserFetch());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Muliple User"),
      ),
      body: Center(
        child: BlocBuilder<MultiUserBloc, MultiUserState>(
          builder: (context, state) {
            if (state is MultiUserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MultiUserLoaded) {
              final currentUserList = state.user;

              return ListView.builder(
                itemBuilder: (context, pos) {
                  final currentUser = currentUserList[pos];
                  return Card(
                    margin: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            foregroundImage: NetworkImage(currentUser.avatar),
                          ),
                          Text(
                            "${currentUser.firstName} ${currentUser.lastName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            currentUser.email,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: currentUserList.length,
              );
            } else if (state is MultiUserError) {
              return Text(state.errorMsg);
            } else {
              return const Text("Some other error occurred!!");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => multiUserBloc.add(MultiUserFetch()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
