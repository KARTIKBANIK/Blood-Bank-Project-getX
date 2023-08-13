import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:u_project/widgets/custom_text.dart';

class SearchScrrren extends StatefulWidget {
  const SearchScrrren({super.key});

  @override
  State<SearchScrrren> createState() => _SearchScrrrenState();
}

class _SearchScrrrenState extends State<SearchScrrren> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Center(
                  child: Lottie.asset("assets/animations/search.json"),
                ),
              ),
              Custom_TExt(
                txt: "Sarch Blood",
                fs: 20,
                fw: FontWeight.w400,
                textColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search here', suffixIcon: Icon(Icons.search)),
                  onChanged: (val) {
                    setState(() {
                      inputText = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("receive_list")
                        .where(
                          "blood-group",
                          isLessThanOrEqualTo: inputText,
                        )
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Text("Loading..."),
                        );
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                child: Text(
                                  data['blood-group'],
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              title: Text(data['name']),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
