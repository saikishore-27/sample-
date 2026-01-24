import '../model/post.dart';
import '../service/api_service.dart';

class PostRepository {
  final ApiService api;

  PostRepository(this.api);

  Future<List<Post>> getPosts() => api.fetchPosts();
}
