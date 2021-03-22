part of 'views.dart';

class Home extends StatelessWidget {
  final String id;
  final String nameUser;
  Home(this.id, this.nameUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TaskBloc, TaskState>(
        cubit: context.bloc<TaskBloc>()..add(FetchTask(id)),
        builder: (_, taskState) {
          if (taskState is TaskLoaded) {
            List<Task> todayTask = taskState.task
                .where(
                    (element) => element.dateTime.year == DateTime.now().year)
                .where(
                    (element) => element.dateTime.month == DateTime.now().month)
                .where((element) => element.dateTime.day == DateTime.now().day)
                .toList();
            List<Task> tomorrowTask = taskState.task
                .where(
                    (element) => element.dateTime.year == DateTime.now().year)
                .where(
                    (element) => element.dateTime.month == DateTime.now().month)
                .where(
                    (element) => element.dateTime.day == DateTime.now().day + 1)
                .toList();
            print(todayTask);
            print(tomorrowTask);
            if (todayTask.length > 0 || tomorrowTask.length > 0) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.TextSubHeader),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: todayTask.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                useRootNavigator: true,
                                builder: (context) {
                                  return Modal(
                                    id,
                                    nameUser,
                                    task: todayTask[index],
                                  );
                                });
                          },
                          child: ItemTask(todayTask[index], id, () {
                            context.bloc<TaskBloc>()
                              ..add(DeleteTask(
                                  todayTask[index], todayTask[index].uid));
                          }),
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 15),
                      child: Text(
                        'Tomorrow',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.TextSubHeader),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: tomorrowTask.length,
                      itemBuilder: (BuildContext context, index) {
                        return ItemTask(tomorrowTask[index],id, () {
                          context.bloc<TaskBloc>()
                            ..add(DeleteTask(
                                tomorrowTask[index], tomorrowTask[index].uid));
                        });
                      },
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              );
            } else {
              return EmptyTask();
            }
          } else if (taskState is TaskInitial || taskState is TaskCount){
            context.bloc<TaskBloc>()..add(FetchTask(id));
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
