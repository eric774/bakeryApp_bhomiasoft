// import 'dart:async';
// import 'package:exampleapi/rest_api.dart';
// import 'package:flutter/material.dart';
// import 'item.dart';

// class Search4 extends StatefulWidget {
//   @override
//   _Search4State createState() => _Search4State();
// }

// class _Search4State extends State<Search4> {
//   TextEditingController _searchQueryController = TextEditingController();
//   bool _isSearching = false;

//   List<Item> items = [];
//   String query = '';
//   Timer debouncer;

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   @override
//   void dispose() {
//     debouncer?.cancel();
//     super.dispose();
//   }

//   void debounce(
//     VoidCallback callback, {
//     Duration duration = const Duration(milliseconds: 1000),
//   }) {
//     if (debouncer != null) {
//       debouncer.cancel();
//     }
//     debouncer = Timer(duration, callback);
//   }

//   Future init() async {
//     final items = await ApiService.getEmployees(query);
//     setState(() => this.items = items);
//   }

//   Widget _buildSearchField() {
//     return TextField(
//       controller: _searchQueryController,
//       autofocus: true,
//       decoration: InputDecoration(
//         hintText: "Search Data...",
//         border: InputBorder.none,
//         hintStyle: TextStyle(color: Colors.white30),
//       ),
//       style: TextStyle(color: Colors.white, fontSize: 16.0),
//       onChanged: searchBook,
//     );
//   }

//   List<Widget> _buildActions() {
//     if (_isSearching) {
//       return <Widget>[
//         IconButton(
//           icon: const Icon(Icons.clear),
//           onPressed: () {
//             if (_searchQueryController == null ||
//                 _searchQueryController.text.isEmpty) {
//               Navigator.pop(context);
//               return;
//             }
//             _clearSearchQuery();
//           },
//         ),
//       ];
//     }

//     return <Widget>[
//       IconButton(
//         icon: const Icon(Icons.search),
//         onPressed: _startSearch,
//       ),
//     ];
//   }

//   void _startSearch() {
//     ModalRoute.of(context)
//         .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

//     setState(() {
//       _isSearching = true;
//     });
//   }

//   void _stopSearching() {
//     _clearSearchQuery();

//     setState(() {
//       _isSearching = false;
//     });
//   }

//   void _clearSearchQuery() {
//     setState(() {
//       _searchQueryController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: _isSearching ? const BackButton() : Container(),
//         title: _isSearching ? _buildSearchField() : Text('data'),
//         actions: _buildActions(),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final item = items[index];
//                 return buildBook(item);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future searchBook(String query) async => debounce(() async {
//         final items = await ApiService.getEmployees(query);
//         if (!mounted) return;
//         setState(() {
//           this.query = query;
//           this.items = items;
//         });
//       });

//   Widget buildBook(Item item) => ListTile(
//         leading: Image.network(
//           item.product_image,
//           fit: BoxFit.cover,
//           width: 50,
//           height: 50,
//         ),
//         title: Text(item.product_name),
//       );
// }
