import 'package:flutter/material.dart';
import 'package:gif_finder/model/gif.dart';
import 'package:gif_finder/view_model/home_screen_view_model.dart';
import 'package:gif_finder/util/constants.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _debounce;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels > _controller.position.maxScrollExtent - 300) {
      Provider.of<HomeScreenViewModel>(context, listen: false).loadMoreGifs();
    }
  }

  _onSearchChanged(String query, HomeScreenViewModel viewModel) {
    _debounce?.cancel();
    _debounce =
        Timer(const Duration(milliseconds: delayAfterTextInputInMs), () {
      if (query == '') {
        viewModel.clearGifs();
      } else {
        viewModel.searchGifs(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeScreenViewModel>(context);

    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _getGifsList(viewModel, context)),
            viewModel.loadingMoreGifs ? const CircularProgressIndicator() : const SizedBox.shrink(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search...',
                    ),
                    onChanged: (query) => _onSearchChanged(query, viewModel)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Gif Finder'),
    );
  }

  _getGifsList(HomeScreenViewModel viewModel, BuildContext context) {
    if (viewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (viewModel.searchQuery.isEmpty) {
      return const Center(
        child: Text('Search for a gif'),
      );
    }

    if (viewModel.error.isNotEmpty) {
      return Center(
        child: Text(
          viewModel.error,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      );
    }

    if (viewModel.gifs.isEmpty) {
      return const Center(
        child: Text('No gifs found'),
      );
    }

    return GridView.builder(
      itemCount: viewModel.gifs.length,
      controller: _controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final gif = viewModel.gifs[index];
        return _getGifItem(gif);
      },
    );
  }

  _getGifItem(Gif gif) {
    if (gif.images?.fixedHeight?.url == null) {
      return null;
    }

    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: gif.images?.fixedWidth?.url as String,
      height: 300.0,
      fit: BoxFit.cover,
    );
  }
}
