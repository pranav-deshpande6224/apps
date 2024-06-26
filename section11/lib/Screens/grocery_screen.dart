import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:section11/Data/dummy_categories.dart';
import 'dart:convert';
import 'package:section11/Models/grocery_item.dart';
import 'package:section11/Screens/grocery_new_item_screen.dart';
import 'package:section11/Widgets/grocery_list_Item.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  List<GroceryItem> _groceryItems = [];
  var isLoading = true;
  late Future<List<GroceryItem>> itemsFromServer;

  @override
  void initState() {
   itemsFromServer = getItems();
    super.initState();
  }

  Future<List<GroceryItem>> getItems() async {
    final url = Uri.https(
        'flutter-2ef6c-default-rtdb.firebaseio.com', 'shopping-list.json');
    final result =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if(result.statusCode>=400){
      throw Exception('Unable to fetch data');
    }

    if (result.body == 'null') {
      // Nothing is there in the server.
      return [];
    }

    final Map<String, dynamic> data = json.decode(result.body);
    final List<GroceryItem> tempItems = [];
    for (final eachData in data.entries) {
      final categoryItem = dummyCategories.entries.firstWhere((element) {
        return element.value.title == eachData.value['category'] as String;
      }).value;
      final item = GroceryItem(
          id: eachData.key,
          name: eachData.value['name'] as String,
          quantity: eachData.value['quantity'] as int,
          category: categoryItem);
      tempItems.add(item);
    }
    _groceryItems = tempItems;
    return _groceryItems;
  }

  void loadItems() async {
    final url = Uri.https(
        'flutter-2ef6c-default-rtdb.firebaseio.com', 'shopping-list.json');
    final result =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if(result.statusCode >=400){
      throw Exception('Failed to load Grocery Items');
    }
    // Firebase Returns the String 'null' not this null
    if (result.body == 'null') {
      // Firebase return the String null
      setState(() {
        isLoading = false;
      });
      return;
    }
    final Map<String, dynamic> data = json.decode(result.body);
    final List<GroceryItem> tempItems = [];
    for (final eachData in data.entries) {
      final categoryItem = dummyCategories.entries.firstWhere((element) {
        return element.value.title == eachData.value['category'] as String;
      }).value;
      final item = GroceryItem(
          id: eachData.key,
          name: eachData.value['name'] as String,
          quantity: eachData.value['quantity'] as int,
          category: categoryItem);
      tempItems.add(item);
    }
    setState(() {
      _groceryItems = tempItems;
      isLoading = false;
    });
  }

  void _moveToGroceryNewItemScreen() async {
    final obj = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return const GroceryNewItemScreen();
    }));
    // the problem is multiple http requests are done
    // initially we are loading the item from backend
    // after addding new item again we are calling http requests
    if (obj == null) return;
    setState(() {
      _groceryItems.add(obj);
    });
  }

  void removeItem(GroceryItem item) async {
    // that element need to get deleted after the dismissal
    int indexOfItem = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https('flutter-2ef6c-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response =
        await http.delete(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        _groceryItems.remove(item);
      });
    } else {
      setState(() {
        _groceryItems.insert(indexOfItem, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _moveToGroceryNewItemScreen();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: itemsFromServer,
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }

          if(snapshot.data!.isEmpty){
              return const Center(child: Text('No Items in grocery List'),);
          }

          return ListView.builder(
            // till this point we got the data. 
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return Dismissible(
                      key: ValueKey(snapshot.data![index].id),
                      child: GroceryListItem(
                        item: _groceryItems[index],
                      ),
                      onDismissed: (direction) {
                        removeItem(_groceryItems[index]);
                      },
                    );
                  });

        },
      )
      
      
      
      
      
      //  isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : _groceryItems.isEmpty
      //         ? const Center(
      //             child: Text('No Items are there Please add new items'))
      //         : ListView.builder(
      //             itemCount: _groceryItems.length,
      //             itemBuilder: (ctx, index) {
      //               return Dismissible(
      //                 key: ValueKey(_groceryItems[index].id),
      //                 child: GroceryListItem(
      //                   item: _groceryItems[index],
      //                 ),
      //                 onDismissed: (direction) {
      //                   removeItem(_groceryItems[index]);
      //                 },
      //               );
      //             }),
    );
  }
}
