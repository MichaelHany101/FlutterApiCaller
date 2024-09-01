import 'package:api_caller/Model/AlbumModel.dart';
import 'package:api_caller/Model/PhotoModel.dart';
import 'package:api_caller/Model/UserModel.dart';
import 'package:api_caller/Model/CommentModel.dart';
import 'package:api_caller/Model/ToDoModel.dart';
import 'package:api_caller/Model/PostModel.dart';
import 'package:http/http.dart' as http;

//MARK: - Get Users
class GetUserService {
  Future< List<UserModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await data.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return userModelFromJson(jsonData);
    }
    return null;
  }
}

//MARK: - Get Posts
class GetPostService {
  Future< List<PostModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await data.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return postsModelFromJson(jsonData);
    }
    return null;
  }

}
//MARK: - Get Comments
class GetCommentService {
  Future< List<CommentModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await data.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return modelFromJson(jsonData);
    }
    return null;
  }
}

//MARK: - Get Todos
class GetTodoService {
  Future< List<TodoModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var responce = await data.get(url);
    if (responce.statusCode == 200) {
      var jsonData = responce.body;
      return todoModelFromJson(jsonData);
    }
    return null;
  }
}

//MARK: - Get Albums
class GetAlbumService {
  Future< List<AlbumModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    var responce = await data.get(url);
    if (responce.statusCode == 200) {
      var jsonData = responce.body;
      return albumModelFromJson(jsonData);
    }
    return null;
  }

}
//MARK: - Get Photos
class GetPhotoService {
  Future< List<PhotoModel>? > getService() async {
    var data = http.Client();
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var responce = await data.get(url);
    if (responce.statusCode == 200) {
      var jsonData = responce.body;
      return photoModelFromJson(jsonData);
    }
    return null;
  }
}