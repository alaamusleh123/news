import 'package:flutter/material.dart';
import 'package:news_api/api/repository.dart';

import '../api/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  Repository repository = Repository();
  late Model model;

  Future<void> getNewsData() async {
    await repository.getNews().then((value) {
      if (value.status == 'ok') {
        print('not empty');
        model = value;
        setState(() {
          isLoading = false;
        });
        print('${model.totalResults}');
        print('${model.articles[0]['publishedAt']}');
      } else {
        print('empty');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health News',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: Container(
              child: Text('Loading'),
            ))
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      model.articles.length,
                      (index) => Column(
                            children: [
                              Card(
                                //margin: EdgeInsets.all(10),
                                child: ListTile(
                                  leading: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: 100,
                                        minHeight: 100,
                                        maxWidth: 100,
                                        minWidth: 100,
                                      ),
                                      child: Image.network(
                                        '${model.articles[index]['urlToImage']}',
                                        fit: BoxFit.cover,
                                      )),
                                  title: Text(
                                    '${model.articles[index]['title']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${model.articles[index]['author']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 7,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          )),
                ),
              ),
            ),
    );
  }
}
