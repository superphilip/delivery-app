import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/ErrorView/ErrorView.dart';
import 'package:delivery_app/src/Features/presentation/search_page/View/Components/SearchPageBuildResultsView.dart';
import 'package:delivery_app/src/Features/presentation/search_page/View/Components/SearchPageSuggestionsView.dart';
import 'package:delivery_app/src/Features/presentation/search_page/ViewModel/SearchPageViewModel.dart';
import 'package:flutter/material.dart';

class SearchPage extends SearchDelegate with BaseView {
  final SearchPageViewModel _viewModel;

  SearchPage({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    super.autocorrect,
    super.enableSuggestions,
    SearchPageViewModel? viewModel,
  }) : _viewModel = viewModel ?? DefaultSearchPageViewModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(titleLarge: TextStyle(color: Colors.white)),
      appBarTheme: AppBarTheme(backgroundColor: orange),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.white),
        onPressed: () => query = "",
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _viewModel.fetchPlacesListByQuery(query: query),
      builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingView;
          case ConnectionState.done:
            if (snapshot.hasError || !snapshot.hasData) {
              return ErrorView();
            }
            if (snapshot.data?.placeList?.isEmpty ?? true) {
              return SearchPageSuggestionsView(
                textHeader: 'No result found',
                textAction: '',
                isRecentSearchSuggestion: false,
                viewModel: _viewModel,
              );
            } else {
              return SearchPageBuildResultsView(
                places: snapshot.data?.placeList ?? [],
              );
            }
          default:
            return loadingView;
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SearchPageSuggestionsView(
        textHeader: "Recently viewed",
        textAction: 'Clear All',
        isRecentSearchSuggestion: true,
        viewModel: _viewModel,
      );
    } else {
      return Container();
    }
  }
}
