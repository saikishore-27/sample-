import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/post_bloc.dart';
import 'package:flutter_application_1/domain/post_state.dart';

import '../core/constants.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (_, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (_, i) {
                  final post = state.posts[i];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      title: Text(
                        post.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        post.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
               
                    ),
                  );
                },
              ),
            );
          } else if (state is PostError) {
            return Center(
                child: Text(
              'Error: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
