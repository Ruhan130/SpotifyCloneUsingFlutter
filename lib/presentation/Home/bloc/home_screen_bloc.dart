import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/presentation/Home/model/homeModel.dart';
import 'package:project/presentation/Home/repository/homeRepo.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeRepo homeRepository;

  HomeScreenBloc(this.homeRepository) : super(HomeScreenInitial()) {
    on<FetchPosts>((event, emit) async {
      try {
        emit(HomeScreenLoading());
        List<Homemodel> data = await homeRepository.fetchData();
        emit(HomeScreenLoaded(posts: data));
        print(data);
      } catch (e, stackTrace) {
        print('Error: $e');
        print('StackTrace: $stackTrace');
        emit(HomeScreenError(message: 'Something Went Wrong'));
      }
    });
  }
}
