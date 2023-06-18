import 'package:bloc_getit_practice/models/movie_model.dart';
import 'package:bloc_getit_practice/models/post_model.dart';
import 'package:bloc_getit_practice/service/api_service.dart';

class ApiRepository {
  ApiRepository(this.apiService);
  final ApiService apiService;

  Future<List<PostModel>> getPostList() async {
    final response = await apiService.getPostData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => PostModel.fromJson(singlePost)).toList();
    } else {
      return [];
    }
  }

  Future<MovieModel> getMovieList() async {
    final response = await apiService.getMovieList();
    if (response != null) {
      final data = response.data;
      return MovieModel.fromJson(data);
    } else {
      return MovieModel(
        movie: [],
        metadata:
            Metadata(currentPage: '0', perPage: 0, pageCount: 0, totalCount: 0),
      );
    }
  }
}
