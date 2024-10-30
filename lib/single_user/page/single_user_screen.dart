import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_bloc.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_event.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_state.dart';

class SingleUserScreen extends StatelessWidget {
  const SingleUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final singleUserBloc = context.read<SingleUserBloc>();

    // Fetch data on first page load
    singleUserBloc.add(SingleUserFetch());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Single User"),
      ),
      body: Center(
        child: BlocBuilder<SingleUserBloc, SingleUserState>(
          builder: (context, state) {
            if (state is SingleUserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SingleUserLoaded) {
              final currentUser = state.user;

              return Card(
                margin: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
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
            } else if (state is SingleUserError) {
              return Text(state.errorMsg);
            } else {
              return const Text("Some other error occurred!!");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => singleUserBloc.add(SingleUserFetch()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
