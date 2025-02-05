import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/list_of_countries.dart';
import 'bloc/article_screen_bloc.dart';
import 'widgets/list_widget.dart';
import '../search_article/search_article.dart';

class ArticleScreenView extends StatelessWidget {
  const ArticleScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SearchArticle())),
              icon: const Icon(Icons.search))
        ],
        title: const Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          BlocBuilder<ArticleScreenBloc, ArticleScreenState>(
            builder: (ctx, state) {
              return DropdownMenu(
                  initialSelection: ctx.read<ArticleScreenBloc>().state.country,
                  onSelected: (value) {
                    ctx.read<ArticleScreenBloc>().add(GetData(country: value!));
                  },
                  dropdownMenuEntries: listOfCountries.entries
                      .map((e) =>
                          DropdownMenuEntry(value: e.key, label: e.value))
                      .toList());
            },
          ),
          const ListWidget(),
        ],
      ),
    );
  }
}
