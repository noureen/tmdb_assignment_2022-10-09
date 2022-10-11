import 'package:flutter/material.dart';
import 'package:the_movies_db_app/blocs/search_movie/search_movie_bloc.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/screens/genre/widget/item_genre.dart';
import 'package:the_movies_db_app/widgets/footer.dart';

import '../../blocs/genre/genre_bloc.dart';
import '../../blocs/upcoming_movies/upcoming_movies_bloc.dart';
import '../../main.dart';
import '../../styles/styles.dart';
import '../../widgets/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//In this page I have called Genre list of tmdb but was not able to find image list
class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GenreBloc>(context).add(GenreInitEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderAppBar(searchType: SearchType.genre),
            Expanded(child: bodyContent)
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget get bodyContent {
    var padLeft = 0.0;
    if (MediaQuery.of(context).size.width > 700) {
      var mod = MediaQuery.of(context).size.width - 650;
      padLeft = mod / 2.0;
    }
    return BlocListener<GenreBloc, GenreState>(
      listener: (context, state) {
        if (state is GenreInitState) {
          BlocProvider.of<GenreBloc>(context).add(FetchGenreEvent());
        } else if (state is GenreShowProgressState) {
          progress.showLoader(context);
        } else if (state is GenreHideProgressState) {
          progress.hideLoader();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: padLeft, right: padLeft),
        height: MediaQuery.of(context).size.height,
        color: bodyGreyColor,
        child: BlocBuilder<GenreBloc, GenreState>(
            builder: (BuildContext context, GenreState state) {
          if (state is LoadGenreState) {
            return GridView.builder(
              itemCount: state.genreList?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 2),
              itemBuilder: (BuildContext context, int index) {
                final genre = state.genreList![index];
                return Center(
                  child: GenreListItem(
                    genre: genre,
                  ),
                );
              },
            );
          } else if (state is NoInternetState) {
            return noInternet;
          } else if (state is GenreErrorState) {
            return noItemFound;
          }
          return const SizedBox();
        }),
      ),
    );
  }


  //if no item found / error against api call
  Widget get noItemFound => SizedBox(
        child: Center(
          child: Text(
            strNoItemFound,
            style: mediumTextMsgs,
          ),
        ),
      );


  //If no internet
  Widget get noInternet => SizedBox(
        child: Center(
          child: Text(
            strNoInternet,
            style: mediumTextMsgs,
          ),
        ),
      );
}
