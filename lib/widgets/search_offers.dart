import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/Language.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/main.dart';
import 'package:pamride/pages/mobile/search_result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pamride/widgets/images.dart';

class SearchMetadata {
  final int nbHits;

  const SearchMetadata(this.nbHits);

  factory SearchMetadata.fromResponse(SearchResponse response) =>
      SearchMetadata(response.nbHits);
}

class Ride {
  final String destination;
  final String placeOfStart;
  final String price;
  final String departureDate;
  final String driverName;
  final String driverProfileImg;
  final String availableSeats;

  Ride(this.destination, this.placeOfStart, this.price, this.departureDate,
      this.driverName, this.driverProfileImg, this.availableSeats);

  static Ride fromJson(Map<String, dynamic> json) {
    return Ride(
        json['destination'],
        json['placeOfStart'],
        json['price'],
        json['departureDate'],
        json['driverName'],
        json['driverProfileImg'],
        json['availableSeats']);
  }
}

class HitsPage {
  const HitsPage(this.items, this.pageKey, this.nextPageKey);

  final List<Ride> items;
  final int pageKey;
  final int? nextPageKey;

  factory HitsPage.fromResponse(SearchResponse response) {
    final items = response.hits.map(Ride.fromJson).toList();
    final isLastPage = response.page >= response.nbPages;
    final nextPageKey = isLastPage ? null : response.page + 1;
    return HitsPage(items, response.page, nextPageKey);
  }
}

class SearchOffers extends StatefulWidget {
  final String? title;
  const SearchOffers({Key? key, this.title}) : super(key: key);

  @override
  State<SearchOffers> createState() => _SearchRidesPageState();
}

class _SearchRidesPageState extends State<SearchOffers> {
  final _searchTextController = TextEditingController();

  final _ridessSearcher = HitsSearcher(
      applicationID: Constant.algolia_app_id,
      apiKey: Constant.algolia_api_key,
      indexName: Constant.algolia_index_name);

  Stream<SearchMetadata> get _searchMetadata =>
      _ridessSearcher.responses.map(SearchMetadata.fromResponse);

  final PagingController<int, Ride> _pagingController =
      PagingController(firstPageKey: 0);

  Stream<HitsPage> get _searchPage =>
      _ridessSearcher.responses.map(HitsPage.fromResponse);

  final GlobalKey<ScaffoldState> _mainScaffoldKey = GlobalKey();

  final _filterState = FilterState();

  late final _facetList = FacetList(
      searcher: _ridessSearcher,
      filterState: _filterState,
      attribute: 'destination');

  double pageBGColor = 0.0;

  int searchCount = 0;

  @override
  void initState() {
    getOverlayTitle();
    super.initState();
    _searchTextController.addListener(() => {
          if (_searchTextController.text.length > 0)
            {
              setState(() {
                pageBGColor = 0.5;
              }),
              _ridessSearcher.applyState(
                (state) => state.copyWith(
                  query: _searchTextController.text,
                  page: 0,
                ),
              ),
            }
          else
            {
              setState(() {
                pageBGColor = 0.0;
              }),
            }
        });
    _searchPage.listen((page) {
      if (page.pageKey == 0) {
        _pagingController.refresh();
      }
      _pagingController.appendPage(page.items, page.nextPageKey);
    }).onError((error) => _pagingController.error = error);
    _pagingController.addPageRequestListener(
        (pageKey) => _ridessSearcher.applyState((state) => state.copyWith(
              page: pageKey,
            )));
    _ridessSearcher.connectFilterState(_filterState);
    _filterState.filters.listen((_) => _pagingController.refresh());
  }

  void getOverlayTitle() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchTextController.text = (_prefs.getString('overlayTitle') != null
          ? _prefs.getString('overlayTitle')
          : "")!;
    });
    _prefs.remove('overlayTitle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _mainScaffoldKey,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          translation(context).search,
          style: TextStyle(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.015,
              bottom: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.height * 0.28,
              right: MediaQuery.of(context).size.height * 0.01,
            ),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.more_vert,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Center(
          child: Stack(
        children: [
          Container(
            color: Colors.black
                .withOpacity(_searchTextController.text.length > 0 ? 0.5 : 0.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                    height: 44.0,
                    child: TextField(
                      controller: _searchTextController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200], // Background color
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Rounded border
                          borderSide: BorderSide.none,
                        ),
                        hintText: translation(context).searchOffers,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Icon(Icons.search, color: Colors.orange),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    )),
                StreamBuilder<SearchMetadata>(
                  stream: _searchMetadata,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox.shrink();
                    }
                    searchCount = int.parse(snapshot.data!.nbHits.toString());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _searchTextController.text.length > 0
                          ? Column(
                              children: [
                                Text(
                                  '${searchCount} results found',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Visibility(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange),
                                        onPressed: () => {
                                              Get.to(() {
                                                return ResultPage(
                                                  originToCompare:
                                                      _searchTextController
                                                          .text,
                                                  destinationToCompare:
                                                      _searchTextController
                                                          .text,
                                                );
                                              })
                                            },
                                        child: Text('Search all listings')),
                                    visible: searchCount > 1),
                                const Divider(height: 4),
                              ],
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                ),
                //Expanded(child: _hits(context)),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _hits(BuildContext context) => PagedListView<int, Ride>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Ride>(
          noItemsFoundIndicatorBuilder: (_) => const Center(
                child: Text('No results found'),
              ),
          itemBuilder: (_, item, __) => Container(
              color: _searchTextController.text.length > 0
                  ? ColorsRes.secondaryColor
                  : ColorsRes.darkOrangeColor,
              height: (item.placeOfStart.length + item.destination.length > 45)
                  ? 90
                  : 70,
              padding: const EdgeInsets.all(8),
              child: _searchTextController.text.length > 0
                  ? Row(
                      children: [
                        // Driver Profile Image
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child: Container(
                                  color: Colors
                                      .grey, // Set the desired background color
                                  child: Image.network(
                                    getProfileImageUrl(item.driverProfileImg),
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container();
                                    },
                                    width: 47,
                                    height: 47,
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() {
                                return ResultPage(
                                  originToCompare: item.placeOfStart,
                                  destinationToCompare: item.destination,
                                );
                              });
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  // Place of Start and Destination
                                  TextSpan(
                                    text:
                                        '${item.placeOfStart} - ${item.destination}\n',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Driver Name
                                  TextSpan(
                                    text: 'driver: ',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${item.driverName},\t\t',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Price
                                  TextSpan(
                                    text: 'price: ',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Ksh ${item.price}\n',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Departure Date
                                  TextSpan(
                                    text: 'departure: ',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${item.departureDate}',
                                    style: TextStyle( 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink())));

  @override
  void dispose() {
    _searchTextController.dispose();
    _ridessSearcher.dispose();
    _pagingController.dispose();
    _filterState.dispose();
    _facetList.dispose();
    super.dispose();
  }
}
