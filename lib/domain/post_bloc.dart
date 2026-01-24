import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../data/repo/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repo;

  PostBloc(this.repo) : super(PostLoading()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await repo.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(message: e.toString())); // include actual error
      }
    });
  }
}
