part of '../genres/genres_repository.dart';


abstract class GenresRepoInterface {
  Future<GenreResponse?> fetchGenres();
}
