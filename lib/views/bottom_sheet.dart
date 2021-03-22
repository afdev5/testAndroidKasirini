part of 'views.dart';

class Modal extends StatefulWidget {
  final String userID;
  final String userName;
  final Task task;
  Modal(this.userID, this.userName, {this.task});
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  TextEditingController titleController = TextEditingController();
  bool personal = false;
  bool work = true;
  bool meeting = false;
  bool study = false;
  bool shopping = false;
  String category = 'Work';
  DateTime dateTime = DateTime.now();
  Friend friend;
  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      print(widget.task.uid);
      titleController.text = widget.task.title;
      dateTime = widget.task.dateTime;
      category = widget.task.category;
      if (category == "Personal") {
        personal = true;
        work = false;
        meeting = false;
        study = false;
        shopping = false;
      } else if (category == "Work") {
        personal = false;
        work = true;
        meeting = false;
        study = false;
        shopping = false;
      } else if (category == "Meeting") {
        personal = false;
        work = false;
        meeting = true;
        study = false;
        shopping = false;
      } else if (category == "Study") {
        personal = false;
        work = false;
        meeting = false;
        study = true;
        shopping = false;
      } else if (category == "Shopping") {
        personal = false;
        work = false;
        meeting = false;
        study = false;
        shopping = true;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height / 25,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(175, 30),
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                CustomColors.PurpleLight,
                                CustomColors.PurpleDark,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.PurpleShadow,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/fab-delete.png"))),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          (widget.task == null)
                              ? 'Add new task'
                              : 'Detail task',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            controller: titleController,
                            autofocus: true,
                            style: TextStyle(
                                fontSize: 22, fontStyle: FontStyle.normal),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 60,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                              bottom: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                            ),
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              GestureDetector(
                                child: Category(personal, "Personal"),
                                onTap: () {
                                  if (!personal) {
                                    setState(() {
                                      personal = true;
                                      work = false;
                                      meeting = false;
                                      study = false;
                                      shopping = false;
                                      category = "Personal";
                                    });
                                  }
                                },
                              ),
                              GestureDetector(
                                child: Category(work, "Work"),
                                onTap: () {
                                  if (!work) {
                                    setState(() {
                                      work = true;
                                      personal = false;
                                      meeting = false;
                                      study = false;
                                      shopping = false;
                                      category = "Work";
                                    });
                                  }
                                },
                              ),
                              GestureDetector(
                                child: Category(meeting, "Meeting"),
                                onTap: () {
                                  if (!meeting) {
                                    setState(() {
                                      personal = false;
                                      work = false;
                                      meeting = true;
                                      study = false;
                                      shopping = false;
                                      category = "Meeting";
                                    });
                                  }
                                },
                              ),
                              GestureDetector(
                                child: Category(study, "Study"),
                                onTap: () {
                                  if (!study) {
                                    setState(() {
                                      personal = false;
                                      work = false;
                                      meeting = false;
                                      study = true;
                                      shopping = false;
                                      category = "Study";
                                    });
                                  }
                                },
                              ),
                              GestureDetector(
                                child: Category(shopping, "Shopping"),
                                onTap: () {
                                  if (!shopping) {
                                    setState(() {
                                      personal = false;
                                      work = false;
                                      meeting = false;
                                      study = false;
                                      shopping = true;
                                      category = "Shopping";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Text(
                            'Choose date',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: <Widget>[
                              Text(
                                (dateTime == null)
                                    ? DateTime.now().toIso8601String()
                                    : dateTime.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () async {
                                  print('ontap');
                                  DatePicker.showDateTimePicker(context,
                                      showTitleActions: true,
                                      onChanged: (date) {
                                    print('change $date in time zone ' +
                                        date.timeZoneOffset.inHours.toString());
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState(() {
                                      dateTime = date;
                                    });
                                  }, currentTime: DateTime.now());
                                },
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(Icons.chevron_right),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Share With',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 60,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                            ),
                          ),
                          child: (friend == null)
                              ? TypeAheadField(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                          autofocus: false,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.search),
                                              hintText: "Search friend with email",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)))),
                                  suggestionsCallback: (pattern) async {
                                    return await FriendService.searchFriend(
                                        pattern, widget.userID);
                                  },
                                  itemBuilder: (context, suggestion) {
                                    Friend friends = suggestion;
                                    return ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text(friends.name),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) {
                                    
                                    setState(() {
                                      friend = suggestion;
                                    });
                                  },
                                )
                              : Text(
                                  friend.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                ),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          onPressed: () {
                            print(titleController.text);
                            Task task = Task(
                                userID: widget.userID,
                                nameUser: widget.userName,
                                title: titleController.text,
                                category: category,
                                dateTime: dateTime,
                                friend: friend,
                                );
                            (widget.task == null)
                                ? context.bloc<TaskBloc>().add(AddTask(task))
                                : context
                                    .bloc<TaskBloc>()
                                    .add(UpdateTask(task, widget.task.uid));
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  CustomColors.BlueLight,
                                  CustomColors.BlueDark,
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.BlueShadow,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Center(
                              child: Text(
                                (widget.task == null)
                                    ? 'Add task'
                                    : 'Update task',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
