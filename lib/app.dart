import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/post_bloc.dart';

import 'package:flutter_application_1/domain/post_event.dart';
import 'package:flutter_application_1/presentation/post_screen.dart';
import 'di/injector.dart';
import 'core/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostBloc>()..add(LoadPosts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,

        home: const PostScreen(),
      ),
    );
  }
}
