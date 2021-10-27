import 'package:flutter/material.dart';
import 'package:flutter_course/model/post.dart';
import 'package:flutter_course/utils/authentication.dart';
import 'package:flutter_course/utils/firestore/posts.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController contentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規投稿', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: contentController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async{
                  if(contentController.text.isNotEmpty) {
                    Post newPost = Post(
                      content: contentController.text,
                      postAccountId: Authentication.myAccount!.id,
                    );
                    var result = await PostFirestore.addPost(newPost);
                    if(result == true) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('投稿'),
            ),
          ],
        ),
      ),
    );
  }
}
