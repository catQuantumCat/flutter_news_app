import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/model/article.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  SearchArticleBloc() : super(SearchArticleInitial()) {
    on<SearchArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
