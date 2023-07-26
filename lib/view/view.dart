import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/model.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List<Pet> searchPetList = [];

  void searchBar(String value) {
    setState(() {
      searchPetList = petList
          .where((element) =>
              element.petCategory.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Pet market',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.grey,
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) => searchBar(value),
                  decoration: InputDecoration(
                    hintText: 'Search by searchPet type...',
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: searchPetList.isEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      padding: const EdgeInsets.all(20),
                      itemCount: petList.length,
                      itemBuilder: (context, index) {
                        final pet = petList[index];
                        return Container(
                          width: double.infinity,
                          height: 200.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                              boxShadow: const [
                                BoxShadow(color: Colors.white10)
                              ]),
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                  pet.petPic,
                                ),
                                height: double.infinity,
                                width: 100,
                              ),
                              const SizedBox(),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    pet.petCategory,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    pet.petType,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    pet.petLove,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 30.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      padding: const EdgeInsets.all(20),
                      itemCount: searchPetList.length,
                      itemBuilder: (context, index) {
                        final searchPet = searchPetList[index];
                        return Container(
                          width: double.infinity,
                          height: 200.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                              boxShadow: const [
                                BoxShadow(color: Colors.white10)
                              ]),
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                  searchPet.petPic,
                                ),
                                height: double.infinity,
                                width: 100,
                              ),
                              const SizedBox(),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    searchPet.petCategory,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    searchPet.petType,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    searchPet.petLove,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 30.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      )
          ),
        ]
        )
    );
  }
}