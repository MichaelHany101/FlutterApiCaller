import 'package:flutter/material.dart';
import 'package:api_caller/Service/Service.dart';
import 'package:api_caller/Model/UserModel.dart';
import 'package:api_caller/Model/PostModel.dart';
import 'package:api_caller/Model/TodoModel.dart';
import 'package:api_caller/Model/AlbumModel.dart';
import 'package:api_caller/Model/PhotoModel.dart';

class apiCaller extends StatefulWidget {
  final dynamic user;

  const apiCaller ({
    required this.user,
});

  @override
  State<apiCaller> createState() => _apiCallerState();
}

class _apiCallerState extends State<apiCaller> {

  //MARK: - Variables
  List<PostModel> posts = [];
  List<TodoModel> todos = [];
  List<AlbumModel> albums = [];
  List<PhotoModel> photos = [];

  //MARK: - Get Posts
  getPosts() {
    GetPostService().getService().then((postValue) {
      setState(() {
        posts = postValue!;
      });
    });
  }

  //MARK: - Get Albums
  getAlbums() {
    GetAlbumService().getService().then((albumValue) {
      setState(() {
        albums = albumValue!;
      });
    });
  }

  //MARK: - Get Photos
  getPhotos() {
    GetPhotoService().getService().then((photoValue) {
      setState(() {
        photos = photoValue!;
      });
    });
  }

  //MARK: - Init State
  @override
  void initState() {
    getPosts();
    getAlbums();
    getPhotos();
    print(widget.user);
    super.initState();
  }

  //MARK: - UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Center(
          child: Text("${widget.user.name}"),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final apiData = posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                elevation: 5,
                //borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),

                    //MARK: - ID
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        apiData.id.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),

                    //MARK: - NAME, EMAIL, BODY
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            apiData.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            apiData.body,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
