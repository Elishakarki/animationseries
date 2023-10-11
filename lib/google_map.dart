import 'package:flutter/material.dart';

class DragableScrollableSheet extends StatefulWidget {
  const DragableScrollableSheet({super.key});

  @override
  State<DragableScrollableSheet> createState() =>
      _DragableScrollableSheetState();
}

class _DragableScrollableSheetState extends State<DragableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: MediaQuery.sizeOf(context).height * 0.27,
              child: Image.network(
                'https://developers.google.com/static/maps/images/landing/hero_mobile_maps_sdks.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purpleAccent),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                )),
            Positioned.fill(
                child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              snap: true,
              builder: (context, scrollController) => Material(
                  shadowColor: Colors.black,
                  elevation: 9,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (context, index) => ListTile(
                            title: Text("index ${index + 1}"),
                          ))),
            ))
          ],
        ),
      ),
    );
  }
}
