import 'package:flutter/material.dart';

const urlImage = 'https://www.shutterstock.com/image-vector/sky-anime-sunset-background-cartoon-260nw-2473492387.jpg';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.transparent,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
              title: const Text('Title'),
              centerTitle: true,
              background: Image.network(urlImage),
            ),
          
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            return ListTile(
              title: Text('Item: $index'),
            );
          },
          childCount: 20
          )),
          
        ],
      ),
    );
  }
}