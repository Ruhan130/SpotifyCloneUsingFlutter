part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Homemodel> posts;

  HomeScreenLoaded({required this.posts});
  // void printPosts() {
  //   for (var post in posts) {
  //     print('Post ID: ${post.id}, Title: ${post.title}, Body: ${post.body}');
  //   }
  // }
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError({required this.message});
}
