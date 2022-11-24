import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/cart/cartmap.dart';
import 'package:medbuddy/src/ui/search/searchfull.dart';
import 'package:medbuddy/src/ui/search/values/colors_palette.dart';
import 'package:medbuddy/src/ui/search/values/constants.dart';


String docidsearch;
String medname;

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: 25 + kDefaultPadding,
          ),
          height: size.height * 0.2 - 35,
          decoration: const BoxDecoration(
            color: ColorsPalette.kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Row(
            children: [
              Flexible(child: 
              Container(
                child: Image.asset('assets/logo/medsellerlogo.png'),
             ) ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined,
                size: 40.0, color: Colors.white,
              ), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => cartMap()),
            );  },),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: ColorsPalette.kPrimaryColor.withOpacity(0.23),
                  ),
                ]),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255))
                    ), 
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchFeed(),));},

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Text("Search", style: TextStyle(
                         color: ColorsPalette.kPrimaryColor.withOpacity(0.5),
                       ),),]),

                  //   onChanged: (value) {},
                  //   decoration: InputDecoration(
                  //     hintText: "Search",
                  //     hintStyle: TextStyle(
                  //       color: ColorsPalette.kPrimaryColor.withOpacity(0.5),
                  //     ),
                  //     enabledBorder: InputBorder.none,
                  //     focusedBorder: InputBorder.none,
                  //   ),
                   ),
                ),
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchFeed(),));},  
             icon: Icon(Icons.search_off_outlined, size: 40, color: ColorsPalette.kPrimaryColor.withOpacity(0.5),
              ),),
               // SvgPicture.asset("assets/icons/search.svg"),
              ],
              
           ),
          ),
        )
      ]),
    );
  }
}

class DataModel {
  final String name;
  final String image;
  final String price;
  final String docid;


  DataModel({this.name, this.image, this.price, this.docid});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
          name: dataMap['medicine name'],
          image: dataMap['images'],
          price: dataMap['price'],
          docid: snapshot.id
      );
    }).toList();
  }
}

class SearchFeed extends StatefulWidget {
  const SearchFeed({Key key}) : super(key: key);

  @override
  _SearchFeedState createState() => _SearchFeedState();
}

class _SearchFeedState extends State<SearchFeed> {
  @override
  Widget build(BuildContext context) {
    return FirestoreSearchScaffold(
      appBarBackgroundColor: Colors.deepPurple,
      appBarTitle: "Search",
      firestoreCollectionName: 'Medicinesell',
      searchBy: 'medicine name',
      scaffoldBody: Center(
        child: Text("Search for product", style: TextStyle(color: Colors.grey),),
      ),
      dataListFromSnapshot: DataModel().dataListFromSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DataModel> dataList = snapshot.data;
          if (dataList.isEmpty) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
          return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final DataModel data = dataList[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                    child: ListTile(
                     // padding: const EdgeInsets.all(8.0),
                      leading: Image.network(
                        '${data.image}',
                        width: 80,
                        height: 80,
                        //style: Theme.of(context).textTheme.headline6,
                      ),
                      onTap: (){   
                        docidsearch = data.docid;      
                        medname = data.name;             
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> searchfull(),));},
                      title: Text('${data.name}',style: Theme.of(context).textTheme.bodyText1),
                      subtitle:  Text("Price:" + " " + '${data.price}',style: Theme.of(context).textTheme.bodyText1),
                    ),),
                  ],
                );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Results found'),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
