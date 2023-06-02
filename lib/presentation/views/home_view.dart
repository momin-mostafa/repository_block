import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_block/domain/provider/internet/bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Lost Connection'),
              ),
            );
            return;
          }
          if (state is InternetGainState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Connection gained'),
              ),
            );
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('loading..'),
            ),
          );
        },
        builder: (context, state) {
          if (state is InternetLostState) {
            return const Text('Lost Connection');
          }
          if (state is InternetGainState) {
            return const Text('Internet Gain State');
          }
          return const Text('Loading ...');
        },
      )),
    );
  }
}
