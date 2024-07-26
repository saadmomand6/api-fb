import 'dart:convert';

List<BlogsModel> blogsModelFromJson(String str) => List<BlogsModel>.from(json.decode(str).map((x) => BlogsModel.fromJson(x)));

String blogsModelToJson(List<BlogsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogsModel {
    String? id;
    String? title;
    String? content;
    String? author;

    BlogsModel({
        this.id,
        this.title,
        this.content,
        this.author,
    });

    factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "content": content,
        "author": author,
    };
}