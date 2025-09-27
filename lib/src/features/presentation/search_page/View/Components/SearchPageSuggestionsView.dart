import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/ErrorView/ErrorView.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Features/presentation/search_page/ViewModel/SearchPageViewModel.dart';
import 'package:flutter/material.dart';

class SearchPageSuggestionsView extends StatefulWidget {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final bool isRecentSearchSuggestion;
  final SearchPageViewModel viewModel;

  const SearchPageSuggestionsView({
    super.key,
    required this.textHeader,
    required this.textAction,
    this.textActionTapped,
    required this.isRecentSearchSuggestion,
    required this.viewModel,
  });

  @override
  State<SearchPageSuggestionsView> createState() =>
      _SearchPageSuggestionsViewState();
}

class _SearchPageSuggestionsViewState extends State<SearchPageSuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: widget.isRecentSearchSuggestion
          ? SearchPageSuggestionsListView(
              textHeader: widget.textHeader,
              textAction: widget.textAction,
              viewModel: widget.viewModel,
              textActionTapped: () {
                setState(() {
                  widget.viewModel.clearRecentSearchInLocalStorage();
                });
              },
            )
          : SearchPageSuggestionPopularPlacesListView(
              textHeader: widget.textHeader,
              textAction: widget.textAction,
              viewModel: widget.viewModel,
            ),
    );
  }
}

class SearchPageSuggestionsListView extends StatelessWidget with BaseView {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final SearchPageViewModel viewModel;

  SearchPageSuggestionsListView({
    super.key,
    required this.textHeader,
    required this.textAction,
    this.textActionTapped,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.fetchPlacesListByRecentSearches(),
      builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingView;
          case ConnectionState.done:
            if (snapshot.hasError || !snapshot.hasData) {
              return ErrorView();
            }
            if (snapshot.data?.placeList?.isEmpty ?? true) {
              return Container();
            }
            return Column(
              children: [
                SizedBox(height: 20),
                DoubleTextView(
                  textHeader: textHeader,
                  textAction: textAction,
                  textActionTapped: textActionTapped,
                ),
                RecentSearchCarrouselView(
                  placeList: snapshot.data?.placeList ?? [],
                ),
              ],
            );

          default:
            return loadingView;
        }
      },
    );
  }
}

class SearchPageSuggestionPopularPlacesListView extends StatelessWidget
    with BaseView {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final SearchPageViewModel viewModel;

  SearchPageSuggestionPopularPlacesListView({
    super.key,
    required this.textHeader,
    required this.textAction,
    this.textActionTapped,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.fetchPopularPlacesList(),
      builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingView;
          case ConnectionState.done:
            if (snapshot.hasError || !snapshot.hasData) {
              return ErrorView();
            }
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
                        SizedBox(height: 20),
                        DoubleTextView(
                          textHeader: textHeader,
                          textAction: textAction,
                          textActionTapped: textActionTapped,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "We cannot find the item you are searching for, maybe a little spelling mistake?.",
                          style: TextStyle(
                            color: gris,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20),
                        DoubleTextView(
                          textHeader: "Related Search",
                          textAction: "",
                          textActionTapped: textActionTapped,
                        ),
                        SizedBox(height: 20),
                        PlaceListCarrousel(
                          placeList: snapshot.data?.placeList ?? [],
                          isShortedVisualization: false,
                          carrouselStyle: PlaceListCarrouselStyle.list,
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            );
          default:
            return loadingView;
        }
      },
    );
  }
}
