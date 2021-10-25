import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/model/account.dart';
import 'package:flutter_course/model/post.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Account(
    id: '1',
    name: 'Flutter_lab',
    selfIntroduction: 'こんばんは',
    userId: 'FlutterLab',
    imagePath: 'https://www.bing.com/images/search?view=detailV2&ccid=FX3yx5KS&id=52E6DEC429C9AAE76B866C323C978DE925E5ACD9&thid=OIP.FX3yx5KS0fAJNDtGaSEdhwHaCE&mediaurl=https%3a%2f%2fbeefup.work%2fwp-content%2fuploads%2f2019%2f10%2flogo_lockup_flutter_horizontal.png&exph=561&expw=2000&q=flutter&simid=607986967768208060&FORM=IRPRST&ck=D80E549987FB1D9FF49B553EF8335004&selectedIndex=0&ajaxhist=0&ajaxserp=0',
    createdTime: Timestamp.now(),
    updatedTime: Timestamp.now(),
  );

  List<Post> postList = [
    Post(
      id: '1',
      content: 'はじめまして',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
    Post(
      id: '2',
      content: 'はじめまして2回目',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 20),
                  //color: Colors.red.withOpacity(0.5),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                foregroundImage: NetworkImage(myAccount.imagePath),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myAccount.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Text('@${myAccount.userId}', style: TextStyle(color: Colors.grey,),),
                                ],
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {

                            },
                            child: Text('編集'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(myAccount.selfIntroduction),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.blue, width: 3,
                    ))
                  ),
                  child: Text('投稿'),
                ),
                Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: index == 0 ? Border(
                                    top: BorderSide(color: Colors.grey, width: 0),
                                    bottom: BorderSide(color: Colors.grey, width: 0)
                                ) : Border(
                                    bottom: BorderSide(color: Colors.grey, width: 0)
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  foregroundImage: NetworkImage(myAccount.imagePath),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(myAccount.name),
                                                Text('@${myAccount.userId}', style: TextStyle(color: Colors.grey),),
                                              ],
                                            ),
                                            Text(DateFormat('M/d/yy').format(postList[index].createdTime!)),
                                          ],
                                        ),
                                        Text(postList[index].content),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
