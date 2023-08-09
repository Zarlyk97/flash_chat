// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat1/app/data/sms_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Login out"),
                onTap: () async => await controller.logout(),
              ),
              PopupMenuItem(
                child: const Text("Delete"),
                onTap: () async => await controller.delete(),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          MessageStream(controller.streamMessage()),
          SendContainer(
            controller: controller.smscontroller,
            onPressed: () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}

class SendContainer extends StatelessWidget {
  const SendContainer({
    Key? key,
    this.onPressed,
    this.controller,
  }) : super(key: key);
  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                controller: controller,
                maxLines: 2,
                minLines: 2,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
   MessageStream(
    this.streamMessage, {
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.pink,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: streamMessage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: unnecessary_cast
              final message = (snapshot.data!.docs.reversed as Iterable).map(
                (e) => Message.fromMap(
                  e.data(),
                )..isMy = e.data()['sender'] ==
                    FirebaseAuth.instance.currentUser?.email,
              );
              final widgets = message
                  .map(
                    (e) => Text(e.sms),
                  )
                  .toList();
              return ListView(children: message.map((e) =>Padding(padding: EdgeInsets.fromLTRB(e.isMy? 10: width/3,width/ 7, e.isMy!  ? 9,width/ 7,),), ),);
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
