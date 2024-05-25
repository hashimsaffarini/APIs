import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/cubit/my_state.dart';
import 'package:api_project/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    // BlocProvider.of<MyCubit>(context).emitGetUserById(6927869);
    BlocProvider.of<MyCubit>(context).emitCreateUser(Users(
      name: 'ali Saffarini',
      email: 'ali@gmail.com',
      gender: 'Male',
      status: 'Active',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BlocBuilder<MyCubit, MyState>(
            //   builder: (context, state) {
            //     if (state is GetAllUsers) {
            //       final users = state.users;
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: users.length,
            //         itemBuilder: (context, index) {
            //           final user = users[index];
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //               vertical: 10,
            //               horizontal: 10,
            //             ),
            //             child: Container(
            //               height: 50,
            //               color: Colors.amber,
            //               child: Center(
            //                 child: Text(
            //                   user.name ?? 'No name found',
            //                   style: const TextStyle(fontSize: 20),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            // BlocBuilder<MyCubit, MyState>(
            //   builder: (context, state) {
            //     if (state is GetUserById) {
            //       final users = state.user;
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(
            //           vertical: 10,
            //           horizontal: 10,
            //         ),
            //         child: Container(
            //           height: 50,
            //           color: Colors.amber,
            //           child: Center(
            //             child: Text(
            //               users.name ?? 'No name found',
            //               style: const TextStyle(fontSize: 20),
            //             ),
            //           ),
            //         ),
            //       );
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            BlocBuilder<MyCubit, MyState<Users>>(
              builder: (context, state) {
                if (state is Success) {
                  return state.when(
                    success: (users) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(
                            child: Text(
                              users.email ?? 'No name found',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error) => Text(error.toString()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  );
                  // return Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 10,
                  //     horizontal: 10,
                  //   ),
                  //   child: Container(
                  //     height: 50,
                  //     color: Colors.amber,
                  //     child: Center(
                  //       child: Text(
                  //         users.email ?? 'No name found',
                  //         style: const TextStyle(fontSize: 20),
                  //       ),
                  //     ),
                  //   ),
                  // );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
