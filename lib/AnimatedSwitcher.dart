
 
 

import 'package:flutter/material.dart';

class AnimatedFABDemo extends StatefulWidget { 

  @override 

  _AnimatedFABDemoState createState() => _AnimatedFABDemoState(); 

} 

 
 

class _AnimatedFABDemoState extends State<AnimatedFABDemo> { 

  bool isCircular = false; // Control the shape of the FAB 

  ScrollController _scrollController = ScrollController(); 

 
 

  @override 

  void initState() { 

    super.initState(); 

 
 

    // Add a listener to the scroll controller to update the FAB shape 

    _scrollController.addListener(() { 

      final pixels = _scrollController.position.pixels; 

 
 

      setState(() { 

        // Check the scroll position and update the FAB shape accordingly 

        isCircular = pixels >= 1; 

      }); 

    }); 

  } 

 
 

  @override 

  void dispose() { 

    _scrollController.dispose(); 

    super.dispose(); 

  } 

 
 

  @override 

  Widget build(BuildContext context) { 

    return Scaffold( 

      body: SafeArea( 

        child: CustomScrollView( 

          controller: _scrollController, 

          slivers: [ 

            SliverAppBar( 

              title: Text('Animated FAB Demo'), 

              floating: true, 

              snap: true, 

              // Use flexibleSpace to create space for the FAB 

              flexibleSpace: Container(), 

            ), 

            SliverList( 

              delegate: SliverChildBuilderDelegate( 

                (context, index) { 

                  return ListTile( 

                    title: Text('Item $index'), 

                  ); 

                }, 

                childCount: 50, // Example list length 

              ), 

            ), 

          ], 

        ), 

      ), 

      floatingActionButton: AnimatedSwitcher( 

        duration: Duration(milliseconds: 500), 

        child: isCircular 

            ? FloatingActionButton( 

                onPressed: () {}, 

                child: Icon(Icons.chat), 

              ) 

            : FloatingActionButton.extended( 

                onPressed: () {}, 

                icon: Icon(Icons.chat), 

                label: Text('Let\'s chat'), 

              ), 

      ), 

    ); 

  } 

} 