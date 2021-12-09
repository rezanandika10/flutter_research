import 'package:flutter/material.dart';
import 'package:flutter_research/feature/pull_refresh/data/repo/news_repo.dart';
import 'package:flutter_research/feature/pull_refresh/model/news_model.dart';
import 'package:flutter_research/feature/pull_refresh/presentation/bloc/bloc.dart';
import 'package:flutter_research/feature/pull_refresh/presentation/bloc/news_bloc.dart';
import 'package:flutter_research/feature/pull_refresh/presentation/widget/news_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PullRefrsehScreen extends StatefulWidget {
  @override
  _PullRefrsehScreenState createState() => _PullRefrsehScreenState();
}

class _PullRefrsehScreenState extends State<PullRefrsehScreen> {
  NewsBloc newsBloc = NewsBloc(newsRepo: NewsRepo());
  bool isLoading = false, isError = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    newsBloc.close();
    super.dispose();
  }

  Future<void> getData() {
    newsBloc.add(FetchNews());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text('News Page',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
      body: BlocListener<NewsBloc, NewsState>(
          cubit: newsBloc,
          listener: (_, NewsState state) {
            if (state is NewsLoading) {
              isLoading = true;
            }
            if (state is NewsLoaded) {}
            if (state is NewsError) {
              isError = true;
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            cubit: newsBloc,
            builder: (_, NewsState state) {
              if (state is NewsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is NewsLoaded) {
                return mainContent(state.newsModel);
              }
              if (state is NewsError) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }

  Widget mainContent(NewsModel newsModel) {
    return RefreshIndicator(
      onRefresh: getData,
      child: ListView.separated(
        separatorBuilder: (context, int index) {
          return const SizedBox(height: 24);
        },
        itemCount: newsModel.articles.length,
        itemBuilder: (BuildContext context, int index) {
          return NewsWidget(
            urlImage: newsModel.articles[index].urlToImage,
            author: newsModel.articles[index].source.name,
            title: newsModel.articles[index].title,
          );
        },
      ),
    );
  }
}
