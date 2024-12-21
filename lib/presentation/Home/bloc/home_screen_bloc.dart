import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/presentation/Home/model/homeModel.dart';

import 'package:project/presentation/Home/repository/homeRepo.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final homeRepo homeRepository; 
  HomeScreenBloc(this.homeRepository) : super(HomeScreenInitial()) {
    on<fetchPosts>((event, emit) async {
      try{
        emit(HomeScreenLoading());
      List<Homemodel> data = await homeRepository.fetchData();
      emit(HomeScreenLoaded(posts: data));
      }
      catch (e){
        emit(HomeScreenError(message: 'Something Went Wrong'));
      }
      
    });
  }
}
