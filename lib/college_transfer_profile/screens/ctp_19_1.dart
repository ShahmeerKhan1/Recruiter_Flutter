import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/chat_message_model.dart';
import 'package:recruiter_flutter/util/colors.dart';
import 'package:recruiter_flutter/widgets/textfield_focused_border.dart';
import 'package:recruiter_flutter/widgets/textfield_input_border.dart';

import 'ctp_44_1.dart';

class CTP19_1 extends StatefulWidget {

  String data;

  CTP19_1({Key? key, required this.data}) : super(key: key);

  @override
  _CTP19_1State createState() => _CTP19_1State();
}

class _CTP19_1State extends State<CTP19_1> {
  TextEditingController search = TextEditingController();
  bool isButtonEnabled = false;
  final _formKey = GlobalKey<FormState>();

  bool _msgSended = false;

  @override
  void initState() {
    super.initState();

    search = TextEditingController(text: "");

    if (search.text.trim() != "") {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  bool isTextFieldEmpty() {
    setState(() {
      if (search.text != "") {
        isButtonEnabled = true;
      } else {
        isButtonEnabled = false;
      }
    });
    return isButtonEnabled;
  }

  List<ChatMessageModel> messages = [
    ChatMessageModel(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessageModel(
        messageContent: "How have you been?", messageType: "receiver"),
    ChatMessageModel(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessageModel(
        messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessageModel(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessageModel(
        messageContent:
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
        messageType: "receiver"),
    ChatMessageModel(
        messageContent:
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        messageType: "sender"),
    ChatMessageModel(
        messageContent:
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod",
        messageType: "receiver"),
  ];

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // print('Descrip ${model.desc}');
      print('msg');

      messages.add(
        ChatMessageModel(messageContent: search.text, messageType: "sender"),
      );
      form.reset();
    }
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('New Message', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    _notification = true;
                  });
                  print('noti');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CTP_44_1()));
                },
                child: _notification ?  Icon(Icons.notifications, color: Colors.white)
                    : Icon(Icons.notifications_none)
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF474747),
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 46,
                width: double.infinity,
                //   color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'To: ',
                        style: TextStyle(
                            color: Color(0xFF686868), fontSize: 16.0),
                      ),
                      Text(
                        widget.data,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 0, color: Color(0xFF474747), thickness: 2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 58.0),
                  child: ListView.builder(
                    itemCount: messages.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        padding: messages[index].messageType == "receiver"
                            ? const EdgeInsets.only(
                            left: 16, right: 42, top: 10, bottom: 10)
                            : const EdgeInsets.only(
                            left: 90, right: 16, top: 10, bottom: 10),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: messages[index].messageType == "receiver"
                              ? Row(
                            children: [
                              const CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/drawer_img.png'),
                                  radius: 18),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: (messages[index].messageType ==
                                        "receiver"
                                        ? Colors.grey[800]
                                        : Colors.grey[600]),
                                  ),
                                  child: Text(
                                      messages[index].messageContent,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          )
                              : Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: (messages[index].messageType ==
                                        "receiver"
                                        ? Colors.grey[800]
                                        : Colors.grey[600]),
                                  ),
                                  child: Text(
                                      messages[index].messageContent,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding:
              const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
              // height: 60,
              // width: double.infinity,
              // color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                          controller: search,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          autofocus: false,
                          textCapitalization: TextCapitalization.sentences,
                          onSaved: (val) {
                            setState(() {
                              search.text = val!;
                            });
                          },
                          onChanged: (val) {
                            isTextFieldEmpty();
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 16.0),
                            filled: true,
                            fillColor: const Color(0xFF111111),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Start Typing....",
                            labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 14.0),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.attach_file,
                                      color: AppColor.greyBorderColor),
                                  const SizedBox(width: 6),
                                  InkWell(
                                      onTap: () {
                                        if (search.text == "") {
                                          print('please enter text');
                                          _scaffoldKey.currentState!
                                              .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please enter message...')));
                                        } else {
                                          _onSubmit();
                                          setState(() {
                                            _msgSended = true;
                                          });
                                        }
                                      },
                                      child: Icon(Icons.send,
                                          color: isButtonEnabled
                                              ? Colors.white
                                              : Colors.grey)),
                                ],
                              ),
                            ),
                            //  prefixIcon: Icon(Icons.people),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: Colors.lightBlue,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Icon(
                  //       Icons.add,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  // Expanded(
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         hintText: "Write message...",
                  //         hintStyle: TextStyle(color: Colors.black54),
                  //         border: InputBorder.none),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  // FloatingActionButton(
                  //   onPressed: () {},
                  //   child: Icon(
                  //     Icons.send,
                  //     color: Colors.white,
                  //     size: 18,
                  //   ),
                  //   backgroundColor: Colors.blue,
                  //   elevation: 0,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
