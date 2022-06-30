import 'package:flutter/material.dart';
import 'package:medbuddy/src/ui/consult/controller.dart';
import 'package:medbuddy/src/ui/consult/dcdetailview.dart';
import 'package:medbuddy/src/ui/consult/filter.dart';
import 'package:medbuddy/src/ui/consult/specmap.dart';
import 'package:get/get.dart';


String consultdocid;
class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  //dependency injection with getx
  final FirestoreController firestoreController =
      Get.put(FirestoreController());
  final Controller specController = Get.put(Controller());

  //name of chips given as list
  final List<String> _specLabel = ['All', 'ortho', 'derma', 'pedia', 'gastro', 'neuro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Doctors"),
      backgroundColor: Colors.deepPurple,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
),      
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            Obx(
              () => Wrap(
                spacing: 10,
                children: List<Widget>.generate(6, (int index) {
                  return ChoiceChip(
                    label: Text(_specLabel[index]),
                    selected: specController.selectedSpec == index,
                    onSelected: (bool selected) {
                      specController.selectedSpec = selected ? index : null;
                      firestoreController.onInit();
                      firestoreController.getspec(
                          specsmap.values[specController.selectedSpec]);
                    },
                  );
                }),
              ),
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: firestoreController.specList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              firestoreController.specList[index].image,
                              height: 100, width: 100,
                            ),
                            title: Text(
                                "${firestoreController.specList[index].name}"),
                            subtitle: Text(
                                "${firestoreController.specList[index].regno}"),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: (){
                                consultdocid = firestoreController.specList[index].docid;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> dcdetailview()));
                                //print(consultdocid);
                            },
                          ),
                        );
                      }),
                )),
          ],
        ),
      ),
    ));
  }
}