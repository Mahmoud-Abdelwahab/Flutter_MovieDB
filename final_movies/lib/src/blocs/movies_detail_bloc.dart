import 'package:finalmovies/src/blocs/base.dart';
import 'package:finalmovies/src/model/item_model.dart';
import 'package:finalmovies/src/model/movie_detail_model.dart';
import 'package:rxdart/rxdart.dart';


class MovieDetailBloc extends BaseBloc<MovieDetailModel> {

  Observable<MovieDetailModel> get movieDetail => fetcher.stream;

  fetchMovieDetail(int movieId) async {
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();