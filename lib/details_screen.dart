import 'package:flutter/material.dart';
import 'package:new_dicoding_newsapp/articles.dart';

class ArticleDetailsPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailsPage ({Key? key, required this.article}) : super (key: key);

  @override
  Widget build (BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.description),
                const Divider(color: Colors.grey,),
                Text(article.title,style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
                const Divider(color: Colors.grey,),
                Text('Date: ${article.publishedAt}'),
                const SizedBox(height: 10),
                Text('Author: ${article.author}'),
                const Divider(color: Colors.grey),
                Text(article.content, style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, child: const Text("Read More"))
              ],
            ),)
          ],
        ),
      ),
    ));
  }
}