import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/utils/services/api_service.dart';
import '/presentation/widgets/search_result_widget.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, this.start = '0'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        color: Colors.blue,
        title: searchQuery,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0,
                ),
                FutureBuilder<Map<String, dynamic>>(
                  future: ApiService().fetchData(
                      context: context, queryTerm: searchQuery, start: start),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150, top: 3),
                                child: SearchResultWidget(
                                  text: snapshot.data?['items'][index]['title'],
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    child: const Text(
                                      "< Prev",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                    onPressed: start != "0"
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                  searchQuery: searchQuery,
                                                  start: (int.parse(start) - 10)
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          }
                                        : () {}),
                                const SizedBox(width: 30),
                                TextButton(
                                  child: const Text(
                                    "Next >",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: blueColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
