import 'package:flutter/material.dart';

class Contents extends StatelessWidget {
  final article;

  Contents(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${article['title']}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "By ${article['author']} | ${article['publishedAt']}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                  height: 40,
                ),
                Image(
                  image: NetworkImage("${article['urlToImage']}"),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "${article["content"]}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
