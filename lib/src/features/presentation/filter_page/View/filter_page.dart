import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/features/presentation/filter_page/View/customWidgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool topRated = false;
  bool nearme = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;

  bool openNow = false;
  bool cerditCards = false;
  bool alcoholServerd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: headerText('CUISINES', gris, 17, FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CuisinesFilter(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: headerText('SORT BY', gris, 17, FontWeight.w600),
              ),
              _sortByContainer(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: headerText('FILTER', gris, 17, FontWeight.w600),
              ),
              _filterContainer(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: headerText('PRICE', gris, 17, FontWeight.w600),
              ),
              PriceFilter()
            ]),
          ),
        ],
      ),
    );
  }

  Widget _sortByContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ListTitleChecked(
            texto: 'Top Rated',
            isActive: topRated,
            func: () {
              setState(() => topRated = !topRated);
            },
          ),
          ListTitleChecked(
            texto: 'Nearest Me',
            isActive: nearme,
            func: () {
              setState(() => nearme = !nearme);
            },
          ),
          ListTitleChecked(
            texto: 'Cost High to Low',
            isActive: costHighToLow,
            func: () {
              setState(() => costHighToLow = !costHighToLow);
            },
          ),
          ListTitleChecked(
            texto: 'Cost Low to High',
            isActive: costLowToHigh,
            func: () {
              setState(() => costLowToHigh = !costLowToHigh);
            },
          ),
          ListTitleChecked(
            texto: 'Most Popular',
            isActive: mostPopular,
            func: () {
              setState(() => mostPopular = !mostPopular);
            },
          ),
        ],
      ),
    );
  }

  Widget _filterContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ListTitleChecked(
            texto: 'Open Now',
            isActive: openNow,
            func: () {
              setState(() => openNow = !openNow);
            },
          ),
          ListTitleChecked(
            texto: 'Credit Cards',
            isActive: cerditCards,
            func: () {
              setState(() => cerditCards = !cerditCards);
            },
          ),
          ListTitleChecked(
            texto: 'Alcohol Served',
            isActive: alcoholServerd,
            func: () {
              setState(() => alcoholServerd = !alcoholServerd);
            },
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    elevation: 2,
    backgroundColor: Colors.white,
    title: headerText('Filters', primaryColor, 20, FontWeight.w600),
    centerTitle: true,
    leading: Container(
      padding: EdgeInsets.only(top: 20, left: 7),
      child: headerText('Reset', primaryColor, 17, FontWeight.w500),
    ),
    actions: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.only(top: 5, right: 10),
          child: headerText('Done', orange, 17, FontWeight.w500),
        ),
      ),
    ],
  );
}
