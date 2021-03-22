part of 'views.dart';

class TaskPage extends StatelessWidget {
  final String id;
  TaskPage(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TaskBloc, TaskState>(
          cubit: context.bloc<TaskBloc>()..add(FetchTaskCount(id)),
          builder: (_, taskState) {
            if (taskState is TaskCount) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) => Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 15, bottom: 0),
                                child: Text(
                                  'Projects',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.TextSubHeader),
                                ),
                              ),
                          childCount: 1),
                    ),
                    SliverGrid.count(
                      crossAxisCount: 2,
                      children: [
                        CardCategory('Personal', taskState.count[0]),
                        CardCategory('Work',taskState.count[1]),
                        CardCategory('Meeting', taskState.count[2]),
                        CardCategory('Shopping', taskState.count[4]),
                        CardCategory('Party', 0),
                        CardCategory('Study', taskState.count[3]),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              context.bloc<TaskBloc>()..add(FetchTaskCount(id));
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
