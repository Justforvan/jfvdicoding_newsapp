import 'package:flutter/material.dart';
import 'package:new_dicoding_newsapp/articles.dart';
import 'package:new_dicoding_newsapp/details_screen.dart';
import 'package:new_dicoding_newsapp/styles.dart';
import 'package:new_dicoding_newsapp/webview_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
       colorScheme: Theme.of(context).colorScheme.copyWith(
         primary: primaryColor,
         onPrimary: Colors.black,
         secondary: secondaryColor,
       ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: primaryColor,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))
            )
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        ArticleDetailsPage.routeName: (context) => ArticleDetailsPage(article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}

class NewsListPage extends StatelessWidget {
    static const routeName = '/article_list';

    const NewsListPage ({Key? key}) : super(key: key);


    Widget _buildArticleItem (BuildContext context, Article article) {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.network(article.urlToImage, width: 100, errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),),
        title: Text(article.title),
        subtitle: Text(article.description),
        onTap: () {
          Navigator.pushNamed(context, ArticleDetailsPage.routeName, arguments: article);
        },
      );
    }
    @override
    Widget build(BuildContext context) {
      return SafeArea(child: Scaffold(
          appBar: AppBar(title: const Text('News App'),),
          body: FutureBuilder<String>(builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
            return _buildArticleItem(context, articles[index]);
          });
        }, future:
          DefaultAssetBundle.of(context).loadString('assets/articles.json'),),
      ));
//

  }
}

